import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_you_decide/data/local_data.dart';
import 'package:help_you_decide/getx/home_controller.dart';

class AddDecisionSheet extends StatelessWidget {
  AddDecisionSheet({super.key});

  final homeController = Get.find<HomeController>();

  final LocalData localData = Get.find<LocalData>();

  final _itemController = TextEditingController();
  final _optionController = TextEditingController();

  final optionsList = [].obs;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: Get.height * 0.8,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                CupertinoButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('取消'),
                ),
                const Spacer(),
                CupertinoButton(
                  onPressed: _submitData,
                  child: const Text('儲存'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _itemController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                labelText: '項目',
                hintText: '請輸入項目',
                floatingLabelAlignment: FloatingLabelAlignment.center,
                contentPadding: EdgeInsets.all(18),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Text('選項:'),
              title: TextField(
                controller: _optionController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: '請輸入選項',
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                ),
              ),
              trailing: IconButton(
                onPressed: _addOption,
                icon: const Icon(Icons.add_circle),
              ),
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.grey),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(
                () => optionsList.isEmpty
                    ? const Center(
                        child: Text(
                          '尚無內容',
                        ),
                      )
                    : ListView.builder(
                        itemCount: optionsList.length,
                        itemBuilder: (ctx, index) => ListTile(
                          leading: Text('選項 ${index + 1}.'),
                          title: Text(
                            optionsList[index],
                            textAlign: TextAlign.center,
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              optionsList.removeAt(index);
                            },
                            icon: const Icon(Icons.remove_circle),
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addOption() {
    if (_optionController.text.isNotEmpty) {
      optionsList.add(_optionController.text.trim());
      _optionController.clear();
    }
  }

  void _submitData() {
    if (_itemController.text.isNotEmpty && optionsList.length >= 2) {
      homeController.addLocalData(
          _itemController.text.trim(), List.from(optionsList));
      optionsList.clear();
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
}
