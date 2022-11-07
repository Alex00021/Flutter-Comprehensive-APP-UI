import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ProductDetailPage extends StatefulWidget {
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

  /// 大小
  final List size;
  /// 颜色
  final List? color;

  const ProductDetailPage(
      {Key? key,
       required this.id,
      required this.name,
       required this.code,
      required this.img,
      required this.price,
      required this.promotionPrice,
      required this.size,
        this.color})
      : super(key: key);
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int activeSize = 0;
  int activeColor = 0;
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
          child: Text(
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
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.arrow_back_ios)),
              ),
            ),
            SizedBox(
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
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "款式 :",
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Text(
                      widget.name,
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "编码 :",
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Flexible(
                    child: Text(
                      widget.code,
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Text("价格 :", style: TextStyle(fontSize: 16, height: 1.5)),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        widget.promotionPrice + " 元",
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        widget.price + " 元",
                        style: TextStyle(
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
            SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(children: [
                        Text(
                          "大小 :",
                          style: TextStyle(fontSize: 16, height: 1.5),
                        ),
                        SizedBox(width: 6),
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
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  height: 1.5))))));
                        }))
                      ])
                    ])),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Color :",
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Wrap(
                          children: List.generate(widget.color!.length, (index) {
                        return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    activeColor = widget.color![index]["id"];
                                    activeImg = widget.color![index]["value"];
                                  });
                                },
                                child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                widget.color![index]["value"]),
                                            fit: BoxFit.cover),
                                        border: Border.all(
                                          width: 2,
                                          color: activeColor ==
                                                  widget.color![index]["id"]
                                              ? Colors.blue
                                              : Colors.transparent,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5)))));
                      }))
                    ])),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "数量 :",
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  SizedBox(
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
                          child: Icon(
                            LineIcons.minus,
                            color: Colors.black12,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        num.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
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
                          child: Icon(
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
            SizedBox(
              height: 20,
            )
          ]
        )
      )
    );
  }
}
