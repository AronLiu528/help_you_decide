import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_you_decide/data/local_data.dart';
import 'dart:math';

class WheelController extends GetxController {
  WheelController({required this.localDataIndex});

  final scrollController = FixedExtentScrollController();

  final LocalData localData = Get.find<LocalData>();

  final int localDataIndex; //localData的索引

  var isButtonEnabled = true.obs;

  void spinWheel() {
    final int length = localData.localData[localDataIndex].option.length;

    if (isButtonEnabled.isTrue) {
      isButtonEnabled.value = false; // 轉動時禁用按钮

      final randomIndex = Random().nextInt(length);
      final scrollIndex = randomIndex + length * 5;
      debugPrint('隨機數字 = $randomIndex');

      if (scrollController.selectedItem != 0) {
        scrollController.jumpToItem(0);
        debugPrint('列表索引歸0');
      } //若列表的位置如不為0，重置到索引[0]的位置。
      scrollController
          .animateToItem(scrollIndex,
              duration: const Duration(seconds: 3),
              curve: Curves.fastEaseInToSlowEaseOut)
          .then((_) {
        isButtonEnabled.value = true;
        Future.delayed(const Duration(milliseconds: 500), () {
          Get.defaultDialog(
            title: '抽獎结果',
            middleText:
                '${localData.localData[localDataIndex].option[randomIndex]}',
            confirm: ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                Get.back();
              },
            ),
          );
        });
      });
    }
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
    print('scrollController dispose');
  }
}
