import 'package:flutter/material.dart';

class PendingPickupList extends StatefulWidget {
  const PendingPickupList({Key? key}) : super(key: key);

  @override
  _PendingPickupListState createState() => _PendingPickupListState();
}

class _PendingPickupListState extends State<PendingPickupList> {
  final List<Map<String, String>> tasks = [
    {
      'time': '30',
      'amount': '¥20',
      'start': '麦当劳(人民广场店)',
      'startAddress': '上海市黄浦区南京东路123号',
      'end': '上海博物馆',
      'weight': '1kg',
      'quantity': '1件'
    },
    // Add more tasks here
  ];

  Future<void> _refresh() async {
    // 模拟网络请求或其他异步操作
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      // 模拟数据变化
      tasks.add({
        'time': '40',
        'amount': '¥25',
        'start': '星巴克(南京西路店)',
        'startAddress': '上海市静安区南京西路456号',
        'end': '静安寺',
        'weight': '1.2kg',
        'quantity': '2件'
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
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
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '剩余时间：',
                              style: DefaultTextStyle.of(context).style,
                            ),
                            TextSpan(
                              text: task['time']!,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '分钟',
                              style: DefaultTextStyle.of(context).style,
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '金额：',
                              style: DefaultTextStyle.of(context).style,
                            ),
                            TextSpan(
                              text: task['amount']!,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text('出发地：${task['start']}', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('地址: ${task['startAddress']}'),
                  const SizedBox(height: 8.0),
                  Text('目的地：${task['end']}', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8.0),
                  Text('货品信息：重量 ${task['weight']}，件数 ${task['quantity']}'),
                  const SizedBox(height: 8.0),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8, // 设置按钮宽度为80%
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange, // 设置按钮背景色为更深的黄色
                          foregroundColor: Colors.black, // 设置按钮字体颜色为黑色
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('确认取货吗？'),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '剩余时间：',
                                            style: DefaultTextStyle.of(context).style,
                                          ),
                                          TextSpan(
                                            text: task['time']!,
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '分钟',
                                            style: DefaultTextStyle.of(context).style,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '金额：',
                                            style: DefaultTextStyle.of(context).style,
                                          ),
                                          TextSpan(
                                            text: task['amount']!,
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text('出发地：${task['start']}', style: TextStyle(fontWeight: FontWeight.bold)),
                                    Text('地址: ${task['startAddress']}'),
                                    const SizedBox(height: 8.0),
                                    Text('目的地：${task['end']}', style: TextStyle(fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 8.0),
                                    Text('货品信息：重量 ${task['weight']}，件数 ${task['quantity']}'),
                                  ],
                                ),
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
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.red, // 设置按钮字体颜色为红色
                                    ),
                                    child: Text('确认'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text('已取货'),
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