import 'package:flutter/material.dart';

class AppealPage extends StatelessWidget {
  const AppealPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('违规申诉'),
      ),
      body: const Center(
        child: Text('违规申诉页面内容'),
      ),
    );
  }
}