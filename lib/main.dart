import 'package:flutter/material.dart';
import 'new_task_list.dart'; // Import the external component
import 'pending_pickup_list.dart'; // Import the pending pickup component
import 'in_delivery_list.dart'; // Import the in delivery component
import 'refresh_button.dart'; // Import the in delivery component
import 'messages_page.dart';
import 'route_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '饱了么',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '饱了么众包APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  bool isOnline = true;
  bool isMenuOpen = false;
  late TabController _tabController;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool hasUnreadNotifications = true; // 模拟有未读消息

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void toggleStatus() {
    setState(() {
      isOnline = !isOnline;
    });
  }

  void toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  Widget buildBottomBar() {
    if (_tabController.index == 0) {
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('接单设置'),
            ),
            ElevatedButton(
              onPressed: toggleStatus,
              child: Text(isOnline ? '上线' : '下线'),
            ),
          ],
        ),
      );
    } else if (_tabController.index == 1 || _tabController.index == 2) {
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('接单设置'),
            ),
            RefreshButton(onPressed: () => {}),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Row(
          children: <Widget>[
            IconButton(
              icon: isOnline
                  ? const Icon(Icons.check)
                  : const Icon(Icons.remove_circle),
              color: isOnline ? Colors.green : Colors.red,
              onPressed: toggleStatus,
            ),
            Text(isOnline ? '上线' : '下线中'),
            PopupMenuButton<String>(
              icon: Icon(
                  isMenuOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down),
              onSelected: (String result) {
                setState(() {
                  isOnline = result == '上线';
                  isMenuOpen = false;
                });
              },
              onCanceled: () {
                setState(() {
                  isMenuOpen = false;
                });
              },
              onOpened: () {
                setState(() {
                  isMenuOpen = true;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                if (!isOnline)
                  const PopupMenuItem<String>(
                    value: '上线',
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.check, color: Colors.green),
                        SizedBox(width: 8),
                        Text('上线'),
                      ],
                    ),
                  ),
                if (isOnline)
                  const PopupMenuItem<String>(
                    value: '下线中',
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.remove_circle, color: Colors.red),
                        SizedBox(width: 8),
                        Text('下线'),
                      ],
                    ),
                  ),
              ],
              offset: const Offset(0, 40), // 菜单显示在按钮下方并左对齐
            ),
          ],
        ),
        actions: <Widget>[
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  setState(() {
                    hasUnreadNotifications =
                        !hasUnreadNotifications; // 模拟点击后清除未读消息
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MessagesPage()),
                  );
                },
              ),
              if (hasUnreadNotifications)
                Positioned(
                  right: 11,
                  top: 11,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: const Text(
                      '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '新任务'),
            Tab(text: '待取货'),
            Tab(text: '配送中'),
            Tab(text: '路线'),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Column(
            children: [
              const Expanded(
                child: NewTaskList(), // Use the external component here
              ),
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.build), // 扳手图标
                      label: const Text('接单设置'),
                    ),
                    const SizedBox(width: 16.0), // 设置按钮之间的距离
                    if (!isOnline)
                      ElevatedButton(
                        onPressed: toggleStatus,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 36), // 设置按钮的最小宽度和高度
                        ),
                        child: Text(isOnline ? '下线' : '上线'),
                      ),
                    if (isOnline) RefreshButton(onPressed: () => {}),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Expanded(
                child: PendingPickupList(), // Use the external component here
              ),
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.build), // 扳手图标
                      label: const Text('接单设置'),
                    ),
                    const SizedBox(width: 16.0), // 设置按钮之间的距离
                    RefreshButton(onPressed: () => {}),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Expanded(
                child: InDeliveryList(), // Use the external component here
              ),
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.build), // 扳手图标
                      label: const Text('接单设置'),
                    ),
                    const SizedBox(width: 16.0), // 设置按钮之间的距离
                    RefreshButton(onPressed: () => {}),
                  ],
                ),
              ),
            ],
          ),
          const RoutePage(),
        ],
      ),
    );
  }
}
