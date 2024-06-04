import 'dart:math';
import 'package:get/get.dart';

//隨機且不與上次結果重複class+switch開關
class UniqueRandom {
  final Random _random = Random();
  int? _oldNumber;
  var isSwitchOn = true.obs;

  void switchAvoidRepeats() {
    isSwitchOn.value = !isSwitchOn.value;
    print('隨機數不重複${isSwitchOn.value}');
  }//switch開關

  int nextInt(int length) {
    int newNumber;
    
    do {
      newNumber = _random.nextInt(length);
    } while (isSwitchOn.value && newNumber == _oldNumber);
    //至少會執行一次do，若判斷式為false則跳出while迴圈

    _oldNumber = newNumber;
    return newNumber;
  }
}