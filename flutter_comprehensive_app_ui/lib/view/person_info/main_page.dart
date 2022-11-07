import 'package:flutter/material.dart';
import '../circle_of_friends/friend_circle_page.dart';
import 'header_drawer_page.dart';

/*
///
朋友圈右滑界面出现个人信息栏
///
 */
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CircleFriendPage(),
    );
  }
}

class CircleFriendPage extends StatefulWidget {
  const CircleFriendPage({Key? key}) : super(key: key);

  @override
  _CircleFriendPageState createState() => _CircleFriendPageState();
}

class _CircleFriendPageState extends State<CircleFriendPage> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = const SharePage();
    } else if (currentPage == DrawerSections.contacts) {
      container = const SharePage();
    } else if (currentPage == DrawerSections.events) {
      container = const SharePage();
    } else if (currentPage == DrawerSections.notes) {
      container = const SharePage();
    } else if (currentPage == DrawerSections.settings) {
      container = const SharePage();
    } else if (currentPage == DrawerSections.notifications) {
      container = const SharePage();
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = const SharePage();
    } else if (currentPage == DrawerSections.send_feedback) {
      // 退出登录
      Navigator.pop(context);
    }
    return Scaffold(

        body: container,
        drawer: Drawer(
            child: SingleChildScrollView(
                child: Container(
                    child: Column(
                        children: [
                          const HeaderDrawerPage(),
                          MyDrawerList(),
                        ]
                    )
                )
            )
        )
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "朋友圈", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "头像", Icons.people_alt_outlined,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(3, "反馈", Icons.event,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "修改个人信息", Icons.notes,
              currentPage == DrawerSections.notes ? true : false),
          const Divider(),
          menuItem(5, "设置", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "通知", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          const Divider(),
          menuItem(7, "修改密码", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(8, "退出登录", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
