import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FriendPage extends StatefulWidget {
  const FriendPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FriendPageState();
  }
}

class _FriendPageState extends State<FriendPage> {

  final ScrollController _scrollController = ScrollController();

  double _alpha = 0;


  @override
  void initState() {
    super.initState();

    _scrollController.addListener((){

      double  alpha = _scrollController.offset/200;

      if (alpha < 0) {
        alpha  = 0;
      } else if (alpha > 1) {
        alpha = 1;
      }

      setState(() {
        _alpha = alpha;
      });


    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
            controller: _scrollController,
            padding: const EdgeInsets.only(top: 0),
            children: <Widget>[
              //朋友圈用户主背景图
              Image.network("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg"
                  "%2F1113%2F052420110515%2F200524110515-11-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&siz"
                  "e=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1642646816&t=a597fb6de00e6e19afcfdf35d5193297"),
              const Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
              Text("666"),
            ],
          ),
          Opacity(
            opacity: _alpha,
            child: const CupertinoNavigationBar(
              middle: Text("朋友圈"),
            ),
          )
        ],
      ),
    );
  }
}
