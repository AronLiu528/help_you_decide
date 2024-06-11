import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_you_decide/data/local_data.dart';
import 'package:help_you_decide/pages/wheel_page.dart';
import 'package:help_you_decide/widgets/add_decision_sheet.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final LocalData localData = Get.find<LocalData>();

  void _showAddDecisionSheet() {
    Get.bottomSheet(
      AddDecisionSheet(),
      backgroundColor: Colors.white,
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('抽獎小幫手'),
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
              colors: [Colors.pinkAccent, Colors.redAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: _buildContainer(),
    );
  }

  Widget _buildContainer() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(250, 156, 229, 227),
            Color.fromARGB(100, 50, 229, 227),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Obx(
              () => localData.localData.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Oh oh...目前沒有項目!',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 50),
                          Text(
                            '新增個項目吧!',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(15),
                      physics: const NeverScrollableScrollPhysics(), //禁用滑動
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 70.0,
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
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.brown),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

