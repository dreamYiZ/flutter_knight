import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isPhoneNumberHidden = true;

  final String _name = '张三';
  final String _phoneNumber = '13812345678';
  final double _totalMileage = 1234.56; // 总里程数
  final int _totalOrders = 100; // 总单量
  final double _totalIncome = 5000.00; // 总收入

  String get _displayPhoneNumber {
    if (_isPhoneNumberHidden) {
      return _phoneNumber.replaceRange(3, 7, '****');
    } else {
      return _phoneNumber;
    }
  }

  void _togglePhoneNumberVisibility() {
    setState(() {
      _isPhoneNumberHidden = !_isPhoneNumberHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('个人资料'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: Text(
                  _name[0],
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Text(
                _name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 32.0),
            ListTile(
              leading: Icon(Icons.phone),
              title: GestureDetector(
                onTap: _togglePhoneNumberVisibility,
                child: Text(
                  '电话号码: $_displayPhoneNumber',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.directions_car),
              title: Text(
                '总里程数: $_totalMileage km',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text(
                '总单量: $_totalOrders 单',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text(
                '总收入: ¥$_totalIncome',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}