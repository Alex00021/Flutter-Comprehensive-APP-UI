import 'package:flutter/material.dart';

/// 个人信息栏---头部视图
class HeaderDrawerPage extends StatefulWidget {
  const HeaderDrawerPage({Key? key}) : super(key: key);

  @override
  _HeaderDrawerPageState createState() => _HeaderDrawerPageState();
}

class _HeaderDrawerPageState extends State<HeaderDrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[200],
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/images/long.jpg"),
              ),
            ),
          ),
          const Text(
            "Alex Fan",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            "Alex.LingFan@163.com",
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
