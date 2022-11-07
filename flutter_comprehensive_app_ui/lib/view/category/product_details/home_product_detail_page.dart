import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class homeProductDetailPage extends StatefulWidget {
  /// 设置序列ID
  final String id;

  /// 款式
  final String name;

  /// 编码
  final String code;

  /// 图示
  final String img;

  /// 优惠价格
  final String price;

  /// 原价
  final String promotionPrice;

  /// 型号
  final List size;

  const homeProductDetailPage(
      {Key? key,
        required this.id,
        required this.name,
        required this.code,
        required this.img,
        required this.price,
        required this.promotionPrice,
        required this.size,
        })
      : super(key: key);
  @override
  _homeProductDetailPageState createState() => _homeProductDetailPageState();
}

class _homeProductDetailPageState extends State<homeProductDetailPage> {
  int activeSize = 0;
  String activeImg = "";
  /// 选择数量
  int num = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      activeImg = widget.img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomSheet: getBottom(),
    );
  }

  Widget getBottom() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 60,
      width: size.width,
      child: FlatButton(
          color: Colors.blue,
          onPressed: () {
            // your add cart here
          },
          child: const Text(
            "加入购物车",
            style: TextStyle(fontSize: 18, color: Colors.white),
          )),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(Icons.arrow_back_ios)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 2,
                    child: Hero(
                      tag: widget.id.toString(),
                      child: Container(
                        height: 360,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(activeImg), fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "款式 :",
                          style: TextStyle(fontSize: 16, height: 1.5),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Text(
                            widget.name,
                            style: const TextStyle(fontSize: 16, height: 1.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "编码 :",
                          style: TextStyle(fontSize: 16, height: 1.5),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Flexible(
                          child: Text(
                            widget.code,
                            style: const TextStyle(fontSize: 16, height: 1.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            const Text("价格 :", style: TextStyle(fontSize: 16, height: 1.5)),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "${widget.promotionPrice} 元",
                              style: const TextStyle(fontSize: 16, height: 1.5),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "${widget.price} 元",
                              style: const TextStyle(
                                  fontSize: 20,
                                  height: 1.5,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.lineThrough),
                            )
                          ],
                        ),
                        // SizedBox(width: 20,),
                        // Flexible(
                        //     child: Row(children: <Widget>[
                        //       Text(widget.promotionPrice+" 元",style: TextStyle(
                        //           fontSize: 16,height: 1.5
                        //       ),),
                        //       SizedBox(width: 20,),
                        //       Text(widget.price+" 元",style: TextStyle(
                        //           fontSize: 20,height: 1.5,
                        //           color: Colors.blue,
                        //           fontWeight: FontWeight.w400,
                        //           decoration: TextDecoration.lineThrough
                        //       ),)
                        //     ],)
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(children: [
                              const Text(
                                "大小 :",
                                style: TextStyle(fontSize: 16, height: 1.5),
                              ),
                              const SizedBox(width: 6),
                              Wrap(
                                  children:
                                  List.generate(widget.size.length, (index) {
                                    return Padding(
                                        padding: const EdgeInsets.only(right: 20),
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                activeSize = widget.size[index]['id'];
                                              });
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      width: 2,
                                                      color: activeSize ==
                                                          widget.size[index]['id']
                                                          ? Colors.blue
                                                          : Colors.transparent,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(5)),
                                                child: Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 12,
                                                        bottom: 12,
                                                        right: 15,
                                                        left: 15),
                                                    child: Text(
                                                        widget.size[index]['value'],
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            height: 1.5))))));
                                  }))
                            ])
                          ])),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "数量 :",
                              style: TextStyle(fontSize: 16, height: 1.5),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Flexible(
                                child: Row(
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () {
                                          if (num > 1) {
                                            setState(() {
                                              num = --num;
                                            });
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.black12)),
                                          width: 35,
                                          height: 35,
                                          child: const Icon(
                                            LineIcons.minus,
                                            color: Colors.black12,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      Text(
                                        num.toString(),
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              num = ++num;
                                            });
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.black12)),
                                              width: 35,
                                              height: 35,
                                              child: const Icon(
                                                LineIcons.plus,
                                                color: Colors.black12,
                                              )
                                          )
                                      )
                                    ]
                                ))
                          ]
                      )
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ]
            )
        )
    );
  }
}

