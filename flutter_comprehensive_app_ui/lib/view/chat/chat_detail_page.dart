import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_comprehensive_app_ui/data_json/chat_data.dart';


class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({Key? key}) : super(key: key);

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _sendMessageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 触摸收起键盘,撤销编辑聚焦
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white70,
          elevation: 0,
          leading: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black45,
              )),
          title: Row(
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fnimg.ws.126.net%2F%3Furl%3Dhttp%253A%252F%252F"
                            "dingyue.ws.126.net%252F2021%252F0507%252Fb2382bb5j00qsp19k001qc000hs00dhg.jpg%26thumbnail%3D650x2147483647%26qualit"
                            "y%3D80%26type%3Djpg&refer=http%3A%2F%2Fnimg.ws.126"
                                ".net&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpe"
                                "g?sec=1642571696&t=e8cc08ce13b91680e04c1cfee08f3b86"),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    "鸿钧老祖",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "在忙",
                    style: TextStyle(color: Colors.black38, fontSize: 14),
                  )
                ],
              )
            ],
          ),
          actions: <Widget>[
            const Icon(
              LineIcons.phone,
              color: Colors.blueAccent,
              size: 32,
            ),
            const SizedBox(
              width: 15,
            ),
            const Icon(
              LineIcons.video,
              color: Colors.blueAccent,
              size: 35,
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              width: 13,
              height: 13,
              decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white38)),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        body: getBody(),
        bottomSheet: getBottom(),
      ),
    );
  }

  ///底部栏
  Widget getBottom() {
    return Container(
        height: 80,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.black12),
        child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 10, bottom: 10),
            child: Row(children: <Widget>[
              const SizedBox(width: 6),
              Container(
                  width: 60,
                  child: const Icon(
                    Icons.keyboard_voice,
                    size: 35,
                    color: Colors.blue,
                  )),
              const SizedBox(width: 10),
              Container(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Row(children: <Widget>[
                    Container(
                        width: 210,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: TextField(
                                cursorColor: Colors.white,
                                controller: _sendMessageController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "",
                                    suffixIcon: Icon(
                                      Icons.face,
                                      color: Colors.orangeAccent,
                                      size: 35,
                                    ))))),
                    const SizedBox(
                      width: 15,
                    ),
                    const Icon(
                      Icons.add_circle,
                      size: 35,
                      color: Colors.black54,
                    )
                  ]))
            ])));
  }

  ///聊天主体内容
  Widget getBody() {
    return ListView(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 80),
        children: List.generate(messages.length, (index) {
          return ChatBubble(
            isMe: messages[index]["isMe"],
            messageType: messages[index]["messageType"],
            message: messages[index]["message"],
            profileImg: messages[index]["profileImg"],
            userImage: messages[index]["userImage"],
            key: null,
          );
        }));
  }
}

class ChatBubble extends StatelessWidget {
  /// 是否本人
  final bool isMe;

  /// 对方头像
  final String profileImg;

  /// 己方头像
  final String userImage;

  ///聊天信息
  final String message;

  ///信息类型
  final int messageType;

  const ChatBubble({
    Key? key,
    required this.isMe,
    required this.profileImg,
    required this.message,
    required this.messageType,
    required this.userImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isMe) {
      return Padding(
        padding: const EdgeInsets.all(1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: getMessageType(messageType)),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(userImage), fit: BoxFit.cover)),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(1.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(profileImg), fit: BoxFit.cover)),
            ),
            const SizedBox(
              width: 15,
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: getMessageType(messageType)),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  ///展示聊天内容
  getMessageType(messageType) {
    if (isMe) {
      if (messageType == 1) {
        return const BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(5),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30));
      } else if (messageType == 2) {
        return const BorderRadius.only(
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(5),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30));
      } else if (messageType == 3) {
        return const BorderRadius.only(
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(30),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30));
      } else {
        return const BorderRadius.all(Radius.circular(30));
      }
    } else {
      if (messageType == 1) {
        return const BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(5),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30));
      } else if (messageType == 2) {
        return const BorderRadius.only(
            topLeft: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30));
      } else if (messageType == 3) {
        return const BorderRadius.only(
            topLeft: Radius.circular(5),
            bottomLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30));
      } else {
        return const BorderRadius.all(Radius.circular(30));
      }
    }
  }
}
