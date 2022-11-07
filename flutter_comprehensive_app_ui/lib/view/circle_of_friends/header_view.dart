import 'package:flutter/material.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      color: const Color(0XFFFEFFFE),
      child: Stack(
        children: <Widget>[
          Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 40,
              //朋友圈用户主背景图
              child: Image.network(
                "https://img1.baidu.com/it/u=2551177149,3913402940&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500",
                fit: BoxFit.fill,
              )),
          Positioned(
            right: 15,
            bottom: 20,
            child: Container(
                width: 60,
                height: 60,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    //朋友圈用户主头像
                    child: Image.network(
                      "https://img0.baidu.com/it/u=1617976905,2519736209&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
                      fit: BoxFit.cover,
                    ))),
          ),
          const Positioned(
            right: 100,
            bottom: 50,
            //朋友圈用户主昵称
            child: Text(
              "Alex.凌",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  shadows: [Shadow(color: Colors.black, offset: Offset(1, 1))]),
            ),
          )
        ],
      ),
    );
  }
}
