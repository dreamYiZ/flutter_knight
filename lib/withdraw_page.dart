import 'package:flutter/material.dart';

class WithdrawPage extends StatelessWidget {
  const WithdrawPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('提现'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '提现相关信息。',
              style: TextStyle(fontSize: 18),
            ),
            // Add more content here
          ],
        ),
      ),
    );
  }
}