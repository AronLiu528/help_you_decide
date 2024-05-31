import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_you_decide/data/local_data.dart';

import 'package:help_you_decide/getx/home_controller.dart';
import 'package:help_you_decide/pages/wheel_page.dart';
import 'package:help_you_decide/widgets/add_decision_sheet.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController homeController = Get.put(HomeController());

  final LocalData localData = Get.find<LocalData>();

  final deletedItemController = TextEditingController();

  void _showAddDecisionSheet() {
    Get.bottomSheet(
      AddDecisionSheet(),
      backgroundColor: Colors.white,
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    print(localData.localData);
    return Scaffold(
      appBar: AppBar(
        title: Text('幫你做出選擇'),
        actions: [
          IconButton(
            onPressed: _showAddDecisionSheet,
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              // colors: [Colors.blue, Colors.purple],
              colors: [Colors.pinkAccent, Colors.red],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [
        //       Color.fromARGB(250, 156, 229, 227),
        //       Color.fromARGB(100, 50, 229, 227),
        //     ],
        //     begin: Alignment.topRight,
        //     end: Alignment.bottomLeft,
        //   ),
        // ),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => localData.localData.isEmpty
                    ? const Center(
                        child: Text('Oh oh...加點項目吧!!'),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.all(15),
                        physics: const NeverScrollableScrollPhysics(), //禁用滑動
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 60.0,
                          // childAspectRatio: 1.5,//長寬比
                          crossAxisCount: 3,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: localData.localData.length,
                        itemBuilder: (context, index) => ElevatedButton(
                          onPressed: () {
                            Get.to(() => WheelPage(), arguments: index);
                            debugPrint('送出索引：$index');
                          },
                          child: Text(
                            localData.localData[index].item,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.brown),
                          ),
                        ),
                      ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                homeController.forTestRemoveLocalDataItem(3);
              },
              child: const Text('僅供測試刪除項目用'),
            ), //only for test
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}



// final Map<String, List<String>> itemsWithOptions = {};

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

  // void _showDialog() {
  //   Get.dialog(
  //     Dialog(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(20),
  //       ), // 邊角形状
  //       child: Container(
  //         width: Get.width,
  //         height: Get.height,
  //         color: Colors.white,
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             TextField(
  //               controller: itemController,
  //               decoration: InputDecoration(labelText: 'Enter item'),
  //             ),
  //             TextField(
  //               controller: optionController,
  //               decoration: InputDecoration(labelText: 'Enter option'),
  //             ),
  //             Expanded(
  //                 child: ListView.builder(
  //                     itemCount: decidedItem[0].option.length,
  //                     itemBuilder: (context, index) {
  //                       return ListTile(
  //                           title: TextField(
  //                               controller: TextEditingController(
  //                                   text: decidedItem[index].option[index]),
  //                               onSubmitted: (newText) {
  //                                 decidedItem[index].option[index] = newText;
  //                               }));
  //                     })),
  //             ElevatedButton(
  //               onPressed: () {
  //                 controller.addOption(optionController.text);
  //                 // addItemWithOption();
  //                 //optionController.clear();
  //               },
  //               child: Text('保存選項'),
  //             ),
  //             const SizedBox(
  //               height: 20,
  //             )
  //           ],
  //         ),
  //       ),
  //       // actions: <Widget>[
  //       //   ElevatedButton(
  //       //     child: Text("保存"),
  //       //     onPressed: () {
  //       //       Get.back(); // 使用 Get.back() 来关闭对话框
  //       //     },
  //       //   ),
  //       // ],
  //     ),
  //     barrierDismissible: true, // 点击对话框外部时关闭对话框
  //   );
  // }

   // children: [
                    //  for (final item in decisionController.decisions)
                    //   Container(
                    //     padding: const EdgeInsets.all(5),
                    //     child: ElevatedButton(
                    //       onPressed: (){
                    //         editDecision(decisionController.decisions);
                    //       },
                    //       // () {
                    //       //   Get.to(() => const DecisionPage(),
                    //       //       arguments: item);
                    //       // },
                    //       child: Text(
                    //         item.item,
                    //         style: const TextStyle(fontSize: 20),
                    //       ),
                    //     ),
                    //   ),
                    // ],