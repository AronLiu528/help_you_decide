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
    print('options = $optionsList');
    return Container(
      height: Get.height * 0.75,
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('取消'),
              ),
              const Spacer(),
              TextButton(
                onPressed: _submitData,
                child: const Text('儲存'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _itemController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              labelText: '項目',
              hintText: '請輸入項目',
              floatingLabelAlignment: FloatingLabelAlignment.center,
              contentPadding: const EdgeInsets.all(20),
              border: const OutlineInputBorder(),
              fillColor: Colors.lightBlue[50],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _optionController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    labelText: '選項',
                    hintText: '請輸入選項',
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                  ),
                ),
              ),
              IconButton(
                onPressed: _addOption,
                icon: const Icon(Icons.add_circle),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Obx(
              () => ListView.builder(
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
      Get.defaultDialog(
        title: '請協助確認',
        titleStyle: const TextStyle(fontSize: 16.0, color: Colors.redAccent),
        content: const Text(
          '1.項目是否已正確輸入？\n2.選項是否已正確輸入？\n3.選項是否有(含)超過兩項？',
        ),
        confirm: ElevatedButton(
          child: const Text('OK'),
          onPressed: () {
            Get.back();
          },
        ),
      );
    }
  }
}
