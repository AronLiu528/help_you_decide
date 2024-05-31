// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:help_you_decide/getx/decision_controller.dart';
// import 'package:help_you_decide/getx/wheel_controller.dart';

// import 'package:help_you_decide/widgets/edit_option.dart';

// class TestPage extends StatelessWidget {
//   TestPage({super.key});

//   final lotteryPageController = Get.find<DecisionController>();

//   final int index = Get.arguments;

//   // void showEditingOptions(int index) {
//   //   Get.dialog(EditOption(), arguments: index);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final WheelController wheelController = Get.put(
//       WheelController(lotteryPageController.originalData[index].option),
//     );

//     return Scaffold(
//       appBar: AppBar(
//         title: Obx(() =>
//             Text('抽獎項目：${lotteryPageController.originalData[index].item}')),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Get.dialog(EditOption(), arguments: index);
//             },
//             icon: const Icon(Icons.settings),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           children: [
//             Expanded(
//               child: Obx(() => ListWheelScrollView.useDelegate(
//                     controller: wheelController.scrollController,
//                     overAndUnderCenterOpacity: 0.3,
//                     physics: const NeverScrollableScrollPhysics(), //禁用手動旋轉
//                     itemExtent: 60, // 高度
//                     diameterRatio: 1, // 滾筒直徑,預設2.0
//                     perspective: 0.008, // 3D 效果
//                     useMagnifier: true,
//                     magnification: 1.5,
//                     childDelegate: ListWheelChildLoopingListDelegate(
//                       children: [
//                         for (final option
//                             in lotteryPageController.originalData[index].option)
//                           Text(
//                             option,
//                             style: const TextStyle(fontSize: 25),
//                           ),
//                       ],
//                     ),
//                   )),
//             ),
//             Container(
//               padding: const EdgeInsets.all(10),
//               child: ElevatedButton(
//                 onPressed: wheelController.spinWheel,
//                 child: const Text(
//                   '抽獎',
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 200),
//           ],
//         ),
//       ),
//     );
//   }
// }
