import 'package:flutter/material.dart';

class AllOrdersPage extends StatelessWidget {
  const AllOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> orders = [
      {
        'time': '2025-02-01 12:00',
        'amount': '¥26',
        'start': '张亮麻辣烫(佘山湾生活购物广场店)',
        'startAddress': '上海市松江区古楼公路1856弄12号1层1-1室',
        'end': '新凯家园(一期)松江-泗泾古楼公路1858弄.68号101室',
        'weight': '2kg',
        'quantity': '1件',
        'status': '已完成'
      },
      {
        'time': '2025-02-02 14:00',
        'amount': '¥30',
        'start': '肯德基(松江万达店)',
        'startAddress': '上海市松江区广富林路658号',
        'end': '松江大学城',
        'weight': '1.5kg',
        'quantity': '2件',
        'status': '已取消'
      },
      // Add more orders here
    ];

    // 按时间排序订单
    orders.sort((a, b) => b['time']!.compareTo(a['time']!));

    return Scaffold(
      appBar: AppBar(
        title: const Text('全部订单'),
      ),
      body: ListView(
        children: orders.map((order) => OrderCard(order: order)).toList(),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Map<String, String> order;

  const OrderCard({Key? key, required this.order}) : super(key: key);

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
                    color: order['status'] == '已完成' ? Colors.green : Colors.red,
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