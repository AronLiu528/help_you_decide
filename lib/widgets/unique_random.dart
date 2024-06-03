//隨機且不與上次結果重複class
import 'dart:math';

import 'package:get/get.dart';

class UniqueRandom {
  final Random _random = Random();
  int? _previousNumber;
  var isSwitchOn = true.obs;

  void switchAvoidRepeats() {
    isSwitchOn.value = !isSwitchOn.value;
    print('亂數不重複${isSwitchOn.value}');
  }

  int nextInt(int length) {
    int newNumber;
    do {
      newNumber = _random.nextInt(length);
    } while (isSwitchOn.value && newNumber == _previousNumber);

    _previousNumber = newNumber;
    return newNumber;
  }
}