import 'dart:convert';

import 'package:get/get.dart';
import 'package:help_you_decide/models/help_decide.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  var localData = <HelpDecide>[].obs;

  // var localData = <HelpDecide>[
  //   HelpDecide(
  //     item: '飲料',
  //     option: ['麻古', '清心', '可不可', '清原'],
  //   ),
  //   HelpDecide(
  //     item: '早餐',
  //     option: ['碗粿', '三明治', '晨间', '克萊登', '甲尚堡'],
  //   ),
  // ].obs; //only for test

  final String _key = 'localData'; //本地儲存數據的key

  //讀取本地資料
  Future<void> loadLocalData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? storedData = prefs.getString(_key);

    if (storedData != null) {
      Iterable jsonData = json.decode(storedData);
      List<HelpDecide> loadedLocalData = List<HelpDecide>.from(
          jsonData.map((localData) => HelpDecide.fromJson(localData)));
      localData.assignAll(loadedLocalData);
    }
  }

  //儲存到本地
  Future<void> saveToLocal() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String jsonData = json.encode(
          localData.toList().map((localData) => localData.toJson()).toList());
      bool result = await prefs.setString(_key, jsonData);
      if (result) {
        print("數據保存本地成功");
      } else {
        print("數據保存本地失败");
      }
    } catch (e) {
      print('數據保存失败: $e');
    }
  }

  //刪除本地資料
  Future<void> deletedLocalData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('放_key');
  }

  void addLocalData(String item, List<String> options) {
    localData.add(HelpDecide(item: item, option: options));
    saveToLocal();
  } //主頁添加項目/選項

  void updateLocalData(int index, dynamic item, RxList<dynamic> options) {
    localData[index] = (HelpDecide(item: item, option: options));
    saveToLocal();
  } //轉輪頁修改項目/選項 

  void removeLocalDataIndex(int index) {
    localData.removeAt(index);
    // saveToLocal();
  } //only for test
}
