import 'package:flutter/material.dart';

class AppealPage extends StatelessWidget {
  const AppealPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> appealOrders = [
      {
        'time': '2025-02-03 16:00',
        'amount': '¥28',
        'start': '麦当劳(人民广场店)',
        'startAddress': '上海市黄浦区南京东路123号',
        'end': '上海博物馆',
        'weight': '1.2kg',
        'quantity': '1件',
        'status': '待申诉'
      },
      {
        'time': '2025-02-04 18:00',
        'amount': '¥35',
        'start': '星巴克(南京西路店)',
        'startAddress': '上海市静安区南京西路456号',
        'end': '静安寺',
        'weight': '1.5kg',
        'quantity': '2件',
        'status': '待申诉'
      },
      // Add more appeal orders here
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('违规申诉'),
      ),
      body: ListView(
        children: appealOrders.map((order) => AppealOrderCard(order: order)).toList(),
      ),
    );
  }
}

class AppealOrderCard extends StatelessWidget {
  final Map<String, String> order;

  const AppealOrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                Text(
                  '时间：${order['time']}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  order['status']!,
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text('出发地：${order['start']}', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('地址: ${order['startAddress']}'),
            const SizedBox(height: 8.0),
            Text('目的地：${order['end']}', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Text('货品信息：重量 ${order['weight']}，件数 ${order['quantity']}'),
            const SizedBox(height: 8.0),
            Text('金额：${order['amount']}', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}