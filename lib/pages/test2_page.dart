// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:help_you_decide/getx/decision_controller.dart';
// import 'package:help_you_decide/getx/wheel_controller.dart';
// import 'package:help_you_decide/models/help_decide.dart';

// import 'package:help_you_decide/widgets/edit_option.dart';
// import 'package:help_you_decide/widgets/edit_option2.dart';

// class Test2Page extends StatelessWidget {
//   Test2Page({super.key});

//   final lotteryPageController = Get.find<DecisionController>();

  
  
//   var data = Get.arguments;

  

//   void showEditingOptions(HelpDecide data) async {
//     final result = await Get.dialog(EditOption2(), arguments: data);
//     if (result != null) {
//       data.item = result;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final WheelController wheelController = Get.put(
//       WheelController(data.option),
//     );

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('抽獎項目：${data.item}'),
//         actions: [
//           IconButton(
//             onPressed: () {
//               showEditingOptions(data);
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
//               child: ListWheelScrollView.useDelegate(
//                 controller: wheelController.scrollController,
//                 overAndUnderCenterOpacity: 0.3,
//                 physics: const NeverScrollableScrollPhysics(), //禁用手動旋轉
//                 itemExtent: 60, // 高度
//                 diameterRatio: 1, // 滾筒直徑,預設2.0
//                 perspective: 0.008, // 3D 效果
//                 useMagnifier: true,
//                 magnification: 1.5,
//                 childDelegate: ListWheelChildLoopingListDelegate(
//                   children: [
//                     for (final option in data.option)
//                       Text(
//                         option,
//                         style: const TextStyle(fontSize: 25),
//                       ),
//                   ],
//                 ),
//               ),
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
