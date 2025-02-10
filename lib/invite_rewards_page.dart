import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class InviteRewardsPage extends StatelessWidget {
  const InviteRewardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('邀请奖励'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '邀请新人下载注册',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: QrImageView(
                data: 'This is a simple QR code',
                version: QrVersions.auto,
                size: 320,
                gapless: false,
              ),
            ),
            const SizedBox(height: 32.0),
            const Text(
              '邀请奖励规则',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '1. 每邀请一位新人注册并完成首单，可获得¥10奖励。\n'
              '2. 新人注册时需使用您的邀请码。\n'
              '3. 奖励将在新人完成首单后发放至您的账户余额中。\n'
              '4. 每位用户最多可邀请10位新人。',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}