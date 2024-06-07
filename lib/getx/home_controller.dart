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
  }

  @override
  void onClose() {
    super.onClose();
    print('HomeController dispose');
  }
}
