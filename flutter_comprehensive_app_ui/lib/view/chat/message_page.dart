import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_comprehensive_app_ui/data_json/chat_data.dart';
import 'chat_detail_page.dart';

/// 信息
class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  /// 搜索联系人输入框控制器
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: getBody(),
      ),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Finews.gtimg.com%2Fnewsapp_match%2"
                                  "F0%2F10830965447%2F0.jpg&refer=http%3A%2F%2Finews.gtimg.com&app=2002&size=f9999,10000&q=a8"
                                  "0&n=0&g=0n&fmt=jpeg?sec=1642571140&t=66a31747a40ad68487b091a6c23d081b"),
                          fit: BoxFit.cover)),
                ),
                const Text(
                  "聊天",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.edit)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(15)),
              child: TextField(
                autofocus: false,
                autocorrect: false,
                cursorColor: Colors.black,
                controller: _searchController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      LineIcons.search,
                      color: Colors.black,
                    ),
                    hintText: "搜索联系人",
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black12),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              size: 43,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          width: 75,
                          child: Align(
                              child: Text(
                                "添加朋友",
                                overflow: TextOverflow.ellipsis,
                              )),
                        )
                      ],
                    ),
                  ),
                  Row(
                      children: List.generate(userStories.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 75,
                                height: 75,
                                child: Stack(
                                  children: <Widget>[
                                    userStories[index]["story"]
                                        ? Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.blue, width: 3)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Container(
                                          width: 75,
                                          height: 75,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      userStories[index]["img"]),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                    )
                                        : Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  userStories[index]["img"]),
                                              fit: BoxFit.cover)),
                                    ),
                                    userStories[index]["online"]
                                        ? Positioned(
                                      top: 48,
                                      left: 52,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.white, width: 3)),
                                      ),
                                    )
                                        : Container()
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 75,
                                child: Align(
                                    child: Text(
                                      userStories[index]["name"],
                                      overflow: TextOverflow.ellipsis,
                                    )),
                              )
                            ],
                          ),
                        );
                      }))
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: List.generate(userMessages.length, (index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const ChatDetailPage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 75,
                          height: 75,
                          child: Stack(
                            children: <Widget>[
                              userMessages[index]["story"]
                                  ? Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.blue, width: 3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    width: 75,
                                    height: 75,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                userMessages[index]["img"]),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              )
                                  : Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            userMessages[index]["img"]),
                                        fit: BoxFit.cover)),
                              ),
                              userMessages[index]["online"]
                                  ? Positioned(
                                top: 48,
                                left: 52,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white, width: 3)),
                                ),
                              )
                                  : Container()
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              userMessages[index]["name"],
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 135,
                              child: Text(
                                userMessages[index]["message"] +
                                    " - " +
                                    userMessages[index]["created_at"],
                                style: const TextStyle(fontSize: 15, color: Colors.black),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ));
  }
}
