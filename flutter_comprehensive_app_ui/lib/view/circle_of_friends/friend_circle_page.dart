import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'friend_cell.dart';
import 'friend_model.dart';
import 'header_view.dart';


///
class SharePage extends StatefulWidget {
  const SharePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SharePageState();
  }
}

class SharePageState extends State<SharePage> {
  final ScrollController _scrollController = ScrollController();
  double _opacity = 0;

  FriendModel _friendModel = FriendModel(data: []);

  //请求朋友圈数据--可以设置延迟
  Future<String> loadAsset() async {
    return await rootBundle.loadString("assets/images/Data.json");
  }

  @override
  void initState() {
    super.initState();

    loadAsset().then((value) {
      var json = jsonDecode(value);
      _friendModel = FriendModel.fromJson(json);
      setState(() {});
    });

    //设置滚动监听
    _scrollController.addListener(() {
      double alph = _scrollController.offset / 200;
      if (alph < 0) {
        alph = 0;
      } else if (alph > 1) {
        alph = 1;
      }
      setState(() {
        _opacity = alph;
      });
    });
  }

  Widget _mainListViewBuidler(BuildContext context, int index) {
    return FriendCell(
      model: _friendModel.data[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
            padding: const EdgeInsets.only(top: 0),
            controller: _scrollController,
            children: <Widget>[
              //朋友圈头部视图
              const HeaderView(),
              //主体内容
              ListView.builder(
                padding: const EdgeInsets.only(top: 0),
                itemBuilder: _mainListViewBuidler,
                itemCount: _friendModel.data.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              )
            ]
          ),

          //朋友圈头部视图标题
          Opacity(
            opacity: _opacity,
            child: const CupertinoNavigationBar(
              middle: Text("朋友圈"),
            )
          )
        ]
      )
    );
  }
}
