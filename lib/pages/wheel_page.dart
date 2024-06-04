import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_you_decide/data/local_data.dart';
import 'package:help_you_decide/getx/wheel_controller.dart';
import 'package:help_you_decide/widgets/edit_option.dart';
import 'package:help_you_decide/widgets/unique_random.dart';

class WheelPage extends StatelessWidget {
  WheelPage({super.key});

  final localData = Get.find<LocalData>();

  final int? index = Get.arguments;

  final uniqueRandom = Get.find<UniqueRandom>();

  @override
  Widget build(BuildContext context) {
    final WheelController wheelController =
        Get.put(WheelController(localDataIndex: index!));

    // final UniqueRandom uniqueRandom = UniqueRandom();

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => index! >= localData.localData.length
            ? const Text('已沒有內容')
            : Text('抽獎項目：${localData.localData[index!].item}')),
        actions: [
          IconButton(
            onPressed: () {
              Get.dialog(EditOption(), arguments: index);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              // colors: [Colors.purple, Colors.redAccent],
              colors: [Colors.pinkAccent, Colors.redAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(250, 156, 229, 227),
              Color.fromARGB(100, 50, 229, 227),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => index! >= localData.localData.length
                    ? const Center(
                        child: Text('已沒有內容'),
                      )
                    : ListWheelScrollView.useDelegate(
                        controller: wheelController.scrollController,
                        overAndUnderCenterOpacity: 0.3,
                        physics: const NeverScrollableScrollPhysics(), //禁用手動旋轉
                        itemExtent: 50, // 高度
                        diameterRatio: 1, // 滾筒直徑,預設2.0
                        perspective: 0.008, // 3D 效果
                        useMagnifier: true,
                        magnification: 1.5,
                        childDelegate: ListWheelChildLoopingListDelegate(
                          children: [
                            for (final option
                                in localData.localData[index!].option)
                              Text(option,
                                  style:
                                      Theme.of(context).textTheme.displayLarge),
                          ],
                        ),
                      ),
              ),
            ),
            Obx(
              () => ElevatedButton(
                onPressed: wheelController.isButtonEnabled.value
                    ? wheelController.spinWheel
                    : null,
                child: Text(
                  wheelController.isButtonEnabled.value ? 'GO' : '抽獎中...',
                ),
              ),
            ),
            const SizedBox(height: 50),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  uniqueRandom.isSwitchOn.value
                      ? const Text('抽獎結果可重複') //on
                      : const Text('抽獎結果不重複'), //off
                  const SizedBox(width: 10),
                  Switch.adaptive(
                    value: uniqueRandom.isSwitchOn.value,
                    onChanged: (value) {
                      uniqueRandom.switchAvoidRepeats();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
