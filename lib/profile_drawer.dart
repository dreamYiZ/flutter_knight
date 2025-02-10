import 'package:flutter/material.dart';
import 'all_orders_page.dart';
import 'appeal_page.dart';
import 'invite_rewards_page.dart';
import 'profile_page.dart';
import 'settings_page.dart';
import 'withdraw_page.dart'; // Import the withdraw page

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75, // 设置宽度为屏幕宽度的75%
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.yellow[800],
            ),
            accountName: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    'U',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  '用户名',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            accountEmail: Row(
              children: [
                RichText(
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
                const SizedBox(width: 28),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const WithdrawPage()),
                    );
                  },
                  child: const Text('提现'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.yellow[800],
                    backgroundColor: Colors.white,
                    textStyle: TextStyle(fontSize: 14),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), // 调整按钮的内边距
                    minimumSize: Size(0, 0), // 设置按钮的最小尺寸
                  ),
                ),
              ],
            ),
            // currentAccountPicture: CircleAvatar(
            //   backgroundColor: Colors.white,
            //   child: Text(
            //     'U',
            //     style: TextStyle(
            //       fontSize: 40.0,
            //       color: Colors.blue,
            //     ),
            //   ),
            // ),
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