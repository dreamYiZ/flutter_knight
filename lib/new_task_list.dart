import 'package:flutter/material.dart';

class NewTaskList extends StatelessWidget {
  const NewTaskList({Key? key}) : super(key: key);

  Future<void> _refresh() async {
    // 模拟网络请求或其他异步操作
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: ListView.builder(
        itemCount: 10, // Replace with the actual number of tasks
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('剩余时间：36分钟', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('金额：¥10.8', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text('出发地：麦当劳', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('广州市天河区天河路123号'),
                  const SizedBox(height: 8.0),
                  Text('目的地：客户地址', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('广州市天河区天河北路456号'),
                  const SizedBox(height: 8.0),
                  Text('货品信息：重量 2kg，件数 1件'),
                  const SizedBox(height: 8.0),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8, // 设置按钮宽度为80%
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('确认接单吗？'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('取消'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // Handle order acceptance
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('确认'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text('接单'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

