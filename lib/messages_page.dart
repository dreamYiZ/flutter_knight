import 'package:flutter/material.dart';
import 'message_detail_page.dart'; // Import the message detail page

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  final List<Map<String, String>> messages = const [
    {'title': '消息 1', 'content': '这是消息 1 的内容'},
    {'title': '消息 2', 'content': '这是消息 2 的内容'},
    {'title': '消息 3', 'content': '这是消息 3 的内容'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('消息'),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(messages[index]['title']!),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MessageDetailPage(
                        title: messages[index]['title']!,
                        content: messages[index]['content']!,
                      ),
                    ),
                  );
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.95, // 设置宽度为80%
                child: const Divider(
                  color: Colors.grey, // 设置分割线颜色
                  height: 1, // 设置分割线高度
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

