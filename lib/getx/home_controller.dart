import 'package:get/get.dart';
import 'package:help_you_decide/data/local_data.dart';

class HomeController extends GetxController {
  final LocalData localData = Get.find<LocalData>();

  @override
  void onInit() {
    super.onInit();
    loadLocalData();
  }

  Future<void> loadLocalData() async {
    await localData.loadLocalData();
  }

  Future<void> saveToLocal() async {
    await localData.saveToLocal();
  }

  Future<void> deletedLocalData() async {
    await localData.deletedLocalData();
  }

  void addLocalData(String item, List<String> options) {
    localData.addLocalData(item, options);
  }

  void updateLocalData(int index, dynamic item, RxList<dynamic> options) {
    localData.updateLocalData(index, item, options);
  }

  void removeLocalDataIndex(int index) {
    localData.removeLocalDataIndex(index);
  } //only for test

}

 // void updateItem(int index, String newValue) {
  //   // 更新指定索引的元素
  //   if (index >= 0 && index < decisions.length) {
  //     decisions[index].item = newValue;
  //   }
  // }

// void addItemWithOption() {
  //   print('1 $itemsWithOptions');
  //   final String item = itemController.text.trim();
  //   print('item = $item');
  //   final String option = optionController.text.trim();
  //   print('option = $option');
  //   if (item.isNotEmpty && option.isNotEmpty) {
  //     if (!itemsWithOptions.containsKey(item)) {
  //       itemsWithOptions[item] = [];
  //     }
  //     itemsWithOptions[item]!.add(option);
  //     optionController.clear(); // Clear option input for next input
  //     itemController.clear();
  //     print('2 $itemsWithOptions');
  //   }
  // }



 // var options = <String>[].obs;
  // var decision = ''.obs;

  // void addOption(String option) {
  //   if (option.isNotEmpty) {
  //     options.add(option);
  //   }
  // }

  // void makeDecision() {
  //   if (options.isNotEmpty) {
  //     final random = Random();
  //     int index = random.nextInt(options.length);
  //     decision.value = options[index];
  //   }
  // }

  // void clearDecision() {
  //   decision.value = '';
  // }

  // List<HelpDecide> decidedItem = const [
    //   HelpDecide(
    //     item: '飲料',
    //     option: ['麻古', '清心', '可不可', '清原'],
    //   ),
    //   HelpDecide(
    //     item: '早餐',
    //     option: ['碗粿', '三明治', '晨間', '克萊登'],
    //   ),
    //   HelpDecide(
    //     item: '午餐',
    //     option: ['肉燥飯', '炒麵', '泡麵'],
    //   ),
    //   HelpDecide(
    //     item: '晚餐',
    //     option: ['86', '池上', '雙醬', '炒飯'],
    //   ),
    //   HelpDecide(
    //     item: '宵夜',
    //     option: ['麥當勞', '肯德基', '老詹'],
    //   ),
    // ];

     // final TextEditingController itemController = TextEditingController();
  // final TextEditingController optionController = TextEditingController();

  // var decidedItem2 = {
  //   '飲料': ['麻古', '清心', '可不可', '清原'],
  //   '早餐': ['碗粿', '三明治', '晨間', '克萊登'],
  //   '午餐': ['肉燥飯', '炒麵', '泡麵'],
  //   '晚餐': ['86', '池上', '雙醬', '炒飯'],
  //   '宵夜': ['麥當勞', '肯德基', '老詹']
  // };

   // void editItem(int index, int itemIndex) {
  //   originalData.removeAt(itemIndex);
  //   originalData.refresh(); //刷新
  //   saveToLocal();
  // }

  // void editOption(int index, int optionIndex) {
  //   originalData[index].option.removeAt(optionIndex);
  //   originalData.refresh(); //刷新
  //   saveToLocal();
  // }