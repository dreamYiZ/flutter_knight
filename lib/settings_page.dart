import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('账户设置'),
      ),
      body: const Center(
        child: Text('账户设置页面内容'),
      ),
    );
  }
}