import 'package:flutter/material.dart';

class AllOrdersPage extends StatelessWidget {
  const AllOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('全部订单'),
      ),
      body: const Center(
        child: Text('全部订单页面内容'),
      ),
    );
  }
}