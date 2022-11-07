import 'package:flutter/material.dart';
import 'package:flutter_comprehensive_app_ui/view/home/home_page.dart';
import 'package:flutter_comprehensive_app_ui/view/person_info/main_page.dart';
import 'package:flutter_comprehensive_app_ui/view/chat/message_page.dart';
import 'package:flutter_comprehensive_app_ui/view/category/shopping_page.dart';


/// 底部菜单栏
class AppRootPage extends StatefulWidget {
  const AppRootPage({Key? key}) : super(key: key);

  @override
  _AppRootPageState createState() => _AppRootPageState();
}

class _AppRootPageState extends State<AppRootPage> with SingleTickerProviderStateMixin {
  ///当前页面
  late int currentIndex;

  bool isSelect = false;
  ///bottomTab栏控制器
  late TabController bottomTabController;

  ///视图view
  final pageControllers = [
    //首页
    const HomePage(),
    //分类页
    const ShoppingPage(),
    //信息放页
    const MessagePage(),
    //我的页面
    const CircleFriendPage()
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  void dispose() {
    super.dispose();
  }

  ///@description: 切换页面
  ///@program: {int index}
  void changePage(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 12,
          unselectedFontSize: 10,
          items: bottomNavItems,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            changePage(index);
          }),
      body: pageControllers[currentIndex],
    );
  }

  /// 底部导航图标
  final List<BottomNavigationBarItem> bottomNavItems = [
    //首页
    const BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.home,
          size: 26,
          color: Colors.redAccent,
        ),
        icon: Icon(
          Icons.home,
          size: 26,
          color: Colors.grey,
      ),
        label: "首页"),
    //分类页
    const BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.chat_bubble_outline,
          size: 26,
          color: Colors.redAccent,
        ),
        icon: Icon(
          Icons.menu,
          size: 26,
          color: Colors.grey,
        ),
        label: "分类"),
    //信息页
    const BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.play_arrow,
          size: 26,
          color: Colors.redAccent,
        ),
        icon: Icon(
          Icons.chat,
          size: 26,
          color: Colors.grey,
        ),
        label: "信息"),
    //"我的"页
    const BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.account_circle,
          size: 26,
          color: Colors.redAccent,
        ),
        icon: Icon(
          Icons.account_box,
          size: 26,
          color: Colors.grey
        ),
        label: "我的"
    )
  ];
}
