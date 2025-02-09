import 'package:flutter/material.dart';

class MessageDetailPage extends StatelessWidget {
  final String title;
  final String content;

  const MessageDetailPage({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(content),
      ),
    );
  }
}