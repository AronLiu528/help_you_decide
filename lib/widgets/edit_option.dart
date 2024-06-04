import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_you_decide/data/local_data.dart';
import 'package:help_you_decide/getx/home_controller.dart';
import 'package:help_you_decide/pages/home_page.dart';
import 'package:help_you_decide/widgets/unique_random.dart';

class EditOption extends StatelessWidget {
  EditOption({super.key});

  final editOptionPageController = Get.find<HomeController>();

  final LocalData localData = Get.find<LocalData>();

  final int localDataIndex = Get.arguments; //localData的索引

  final uniqueRandom = Get.find<UniqueRandom>();

  @override
  Widget build(BuildContext context) {
    var editedList = localData.localData[localDataIndex].option.obs;
    var editedItem = localData.localData[localDataIndex].item.obs;

    print('初始：$editedList');

    var newItemController = TextEditingController(text: editedItem.value);
    var newOptionController = TextEditingController();

    void saveOptionList() {
      if (newItemController.text.isNotEmpty && editedList.length >= 2) {
        debugPrint('項目修改後：${newItemController.text}');
        debugPrint('選項修改後：$editedList');
        editOptionPageController.updateLocalData(
            localDataIndex, newItemController.text.trim(), editedList);
        Get.back();
      } else {
        Get.dialog(
          CupertinoAlertDialog(
            title: const Text('請協助確認 :'),
            content: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text('1.項目是否已正確輸入？'),
                  SizedBox(height: 10),
                  Text('2.選項是否已正確輸入？'),
                  SizedBox(height: 10),
                  Text('3.選項是否(含)超過兩項？'),
                ],
              ),
            ),
            actions: [
              CupertinoButton(
                child: const Text('OK'),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
        );
      }
    }

    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Material(
        child: Column(
          children: [
            Row(
              children: [
                CupertinoButton(
                  onPressed: Get.back,
                  child: const Text('取消'),
                ),
                const Spacer(),
                CupertinoButton(
                  onPressed: saveOptionList,
                  child: const Text('儲存'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: newItemController,
              decoration: const InputDecoration(
                labelText: '項目:',
                hintText: '請輸入項目',
                border: OutlineInputBorder(),
              ),
              textAlign: TextAlign.center,
            ),
            ListTile(
              leading: const Text('新增:'),
              title: TextField(
                controller: newOptionController,
                textAlign: TextAlign.center,
              ),
              trailing: IconButton(
                onPressed: () {
                  if (newOptionController.text.isNotEmpty) {
                    editedList.add(newOptionController.text);
                    newOptionController.clear();
                  }
                },
                icon: const Icon(Icons.add_circle),
              ),
            ),
            const SizedBox(height: 10),
            // Obx(
            //   () => Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       uniqueRandom.isSwitchOn.value
            //           ? const Text('不與前次抽獎結果相同')
            //           : const Text('可與前次抽獎結果相同'),
            //       const SizedBox(width: 20),
            //       Switch.adaptive(
            //         value: uniqueRandom.isSwitchOn.value,
            //         onChanged: (value) {
            //           uniqueRandom.switchAvoidRepeats();
            //         },
            //       ),
            //     ],
            //   ),
            // ),
            const Divider(color: Colors.grey),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() => editedList.isEmpty
                  ? const Center(
                      child: Text('沒有選項'),
                    )
                  : ListView.builder(
                      itemCount: editedList.length,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          leading: Text('選項 ${index + 1}.'),
                          title: Text(
                            editedList[index],
                            textAlign: TextAlign.center,
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              editedList.removeAt(index);
                            },
                            icon: const Icon(Icons.remove_circle),
                          ),
                        );
                      }),
                    )),
            ),
            const Divider(color: Colors.grey),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              // color: Colors.redAccent,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: Colors.red,
                gradient: const LinearGradient(
                  colors: [Colors.red, Colors.red],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: CupertinoButton(
                onPressed: () {
                  Get.dialog(
                    CupertinoAlertDialog(
                      content: const Text(
                        '是否確定刪除本項目',
                        style: TextStyle(fontSize: 18),
                      ),
                      actions: [
                        CupertinoButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('取消'),
                        ),
                        CupertinoButton(
                          onPressed: () {
                            Get.offAll(() => HomePage());
                            editOptionPageController
                                .removeLocalDataIndex(localDataIndex);
                          },
                          child: const Text('確定'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text(
                  '刪除此項目',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
