// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:help_you_decide/getx/decision_controller.dart';
// import 'package:help_you_decide/models/help_decide.dart';

// class EditOption2 extends StatelessWidget {
//   EditOption2({super.key});

//   final editOptionPageController = Get.find<DecisionController>();

//   final HelpDecide data = Get.arguments;

//   @override
//   Widget build(BuildContext context) {
//     var editedList = data.obs;
//     print(editedList.value.item);

//     var itemController = TextEditingController(
//       text: editedList.value.item,
//     );
//     var optionController = TextEditingController();

//     // void save(String item) {
//     //   editOptionPageController.updateDecision(1, item, ['1', '2', '3']);
//     // }

//     return Container(
//       margin: const EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 50),
//       padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Colors.white,
//       ),
//       child: Material(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 TextButton(
//                   onPressed: () {
//                     Get.back();
//                   },
//                   child: const Text('取消'),
//                 ),
//                 const Spacer(),
//                 TextButton(
//                   onPressed: () {
                    
//                     Get.back(result: itemController.text);
//                   },
//                   child: const Text('儲存'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               controller: itemController,
//               decoration: const InputDecoration(
//                 labelText: '項目',
//                 hintText: '請輸入項目',
//                 border: OutlineInputBorder(),
//               ),
//               textAlign: TextAlign.center,
//               // onSubmitted: (newValue) {
//               //   editedList.value.item = newValue;
//               // },
//             ),
//             ListTile(
//               // leading: Text('新增：'),
//               title: TextField(
//                 controller: optionController,

//                 textAlign: TextAlign.center,
//                 // onSubmitted: (newValue) {
//                 //   editedList.value.item = newValue;
//                 // },
//               ),
//               trailing: IconButton(
//                 onPressed: () {
//                   editedList.refresh();
//                 },
//                 icon: const Icon(Icons.add_circle),
//               ),
//             ),
//             Expanded(
//               child: Obx(() => ListView.builder(
//                     itemCount: editedList.value.option.length,
//                     itemBuilder: ((context, index) {
//                       return ListTile(
//                         leading: Text('${index + 1}.'),
//                         title: Text(
//                           editedList.value.option[index],
//                           textAlign: TextAlign.center,
//                         ),
//                         trailing: IconButton(
//                           onPressed: () {
//                             editedList.value.option.removeAt(index);
//                             editedList.refresh();
//                           },
//                           icon: const Icon(Icons.remove_circle),
//                         ),
//                       );
//                     }),
//                   )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void saveOptionList(int index, String item, List<String> option) {
//     editOptionPageController.originalData[index] =
//         HelpDecide(item: item, option: option);
//     Get.back();
//   }
// }
