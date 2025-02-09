import 'package:flutter/material.dart';
import 'all_orders_page.dart';
import 'appeal_page.dart';
import 'invite_rewards_page.dart';
import 'profile_page.dart';
import 'settings_page.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.yellow[800],
            ),
            accountName: Text(
              '用户名',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            accountEmail: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '总余额: ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: '¥1000',
                    style: TextStyle(
                      fontSize: 20, // 增大字体
                      fontWeight: FontWeight.bold, // 加粗字体
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'U',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0), // 这里添加一点点距离
          ListTile(
            leading: Icon(Icons.list),
            title: Text('全部订单'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AllOrdersPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.report),
            title: Text('违规申诉'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AppealPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.card_giftcard),
            title: Text('邀请奖励'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InviteRewardsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('个人资料'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('账户设置'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}