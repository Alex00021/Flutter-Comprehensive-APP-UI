import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comprehensive_app_ui/data_json/digital_data.dart';
import 'package:flutter_comprehensive_app_ui/data_json/home_data.dart';
import 'package:flutter_comprehensive_app_ui/data_json/makeups_data.dart';
import 'package:flutter_comprehensive_app_ui/data_json/phone_data.dart';
import 'package:flutter_comprehensive_app_ui/data_json/play_data.dart';
import 'package:flutter_comprehensive_app_ui/data_json/shoe_data.dart';
import 'package:flutter_comprehensive_app_ui/data_json/shopping_data.dart';
import 'package:flutter_comprehensive_app_ui/view/category/product_details/phone_detail_page.dart';
import 'package:flutter_comprehensive_app_ui/view/category/product_details/play_detail-page.dart';
import 'package:flutter_comprehensive_app_ui/view/category/product_details/product_detail.dart';
import 'package:flutter_comprehensive_app_ui/view/category/product_details/shoe_detail_page.dart';
import '../category/product_details/digital_detail_page.dart';
import '../category/product_details/home_product_detail_page.dart';
import '../category/product_details/make_ups_detail_page.dart';

/// 分类
class ShoppingPage extends StatefulWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> with TickerProviderStateMixin {
  /// 搜索框输入控制器
  final searchController = TextEditingController();

  /// 分类栏控制器
  TabController? floorTabController;

  /// 搜索商品类型监听key
  final GlobalKey<FormState> inputRoomNumKey = GlobalKey<FormState>();

  /// 商品名称
  String? thingNames;

  /// 输入框表单验证商品名称输入
  final bool _validate = false;

  /// tab起始位置
  int activeMenu = 0;

  @override
  void initState() {
    floorTabController = TabController(length: menuItems.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    floorTabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: CupertinoColors.white,
        child: GestureDetector(
            child: Column(children: [
              Container(
                padding: const EdgeInsets.only(bottom: 30),
                width: double.infinity,
                color: Colors.redAccent,
                child: Stack(
                  children: [
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                      const SizedBox(height: 15),
                      Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    margin:
                                    const EdgeInsets.only(top: 25, left: 21, right: 21),
                                    height: 43,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30)),
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 3, bottom: 4, top: 5),
                                        //添加表单校验
                                        child: Form(
                                          key: inputRoomNumKey,
                                          autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                          child: TextFormField(
                                              textAlign: TextAlign.center,
                                              onSaved: (val) {
                                                //保存输入的商品名称
                                                thingNames = val;
                                              },
                                              autofocus: false,
                                              autocorrect: false,
                                              controller: searchController,
                                              // cursorColor:
                                              // ThemeColors.color_text_assist,
                                              decoration: InputDecoration(
                                                errorText: _validate ? "输入不能为空" : null,
                                                border: InputBorder.none,
                                                hintText: "搜索商品类型",
                                                hintStyle: const TextStyle(
                                                    fontSize: 13, color: Colors.grey),
                                              )),
                                        ))),
                                const SizedBox(height: 12),
                                Container(
                                  width: double.infinity,
                                  child: TabBar(
                                      onTap: (index) {
                                        //设置楼层TabBar栏监听方法
                                        _onTabChanged();
                                      },
                                      isScrollable: true,
                                      controller: floorTabController,
                                      indicator: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        shape: BoxShape.circle,
                                      ),
                                      tabs: List.generate(menuItems.length, (index) {
                                        return SizedBox(
                                            height: 36,
                                            child: Center(
                                              child: Text(menuItems[index],
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black)),
                                            ));
                                      })),
                                )
                              ]))
                    ]),
                    //设置搜索按钮
                    Positioned(
                        left: 20,
                        top: 4,
                        bottom: 12,
                        child: Container(
                          child: IconButton(
                              icon: const Icon(Icons.search),
                              color: Colors.grey,
                              onPressed: () {
                                setState(() {
                                  FocusScope.of(context).requestFocus(FocusNode());
                                });
                                getSearchNumber();
                              }),
                        )),

                    //设置清除搜索框信息按钮
                    Positioned(
                        right: 20,
                        top: 4,
                        bottom: 17,
                        child: IconButton(
                            icon: const Icon(Icons.cancel),
                            color: Colors.grey,
                            iconSize: 18.0,
                            onPressed: () {
                              setState(() {
                                //清除搜索框信息
                                searchController.clear();
                              });
                            }))
                  ],
                ),
              ),
              // SizedBox(height: 6),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: floorTabController,
                  children: [
                    //衣服
                    getShirt(),
                    //手机
                    getPhone(),
                    //运动
                    getPlay(),
                    //男鞋
                    getBoyShoe(),
                    //美妆
                    getMakeUps(),
                    //数码
                    getDigital(),
                    //家电
                    getHomeTri(),
                  ],
                ),
              )
            ])));
  }

  /// 设置类型选择监听
  _onTabChanged() {}

  /// 本地搜索商品
  void getSearchNumber() {}

  ///衣服
  Widget getShirt() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Wrap(
        children: List.generate(dataItems.length, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ProductDetailPage(
                        id: dataItems[index]['id'].toString(),
                        name: dataItems[index]["name"],
                        code: dataItems[index]["code"],
                        img: dataItems[index]["img"],
                        price: dataItems[index]["price"].toString(),
                        promotionPrice:
                        dataItems[index]["promotionPrice"].toString(),
                        size: dataItems[index]["size"],
                        color: dataItems[index]["color"],
                      )));
            },
            child: Card(
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Hero(
                      tag: dataItems[index]["id"].toString(),
                      child: Container(
                        width: (size.width - 16) / 2,
                        height: (size.width - 16) / 2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(dataItems[index]['img']),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        dataItems[index]["code"],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "${dataItems[index]["price"]} 元",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )),
          );
        }),
      ),
    );
  }

  ///手机
  Widget getPhone() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Wrap(
        children: List.generate(phoneDataItems.length, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => PhoneDetailPage(
                        id: phoneDataItems[index]['id'].toString(),
                        name: phoneDataItems[index]["name"],
                        code: phoneDataItems[index]["code"],
                        phoneImg: phoneDataItems[index]["phoneImg"],
                        price: phoneDataItems[index]["price"].toString(),
                        promotionPrice: phoneDataItems[index]
                        ["promotionPrice"]
                            .toString(),
                        size: phoneDataItems[index]["size"],
                      )));
            },
            child: Card(
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Hero(
                      tag: phoneDataItems[index]["id"].toString(),
                      child: Container(
                        width: (size.width - 16) / 2,
                        height: (size.width - 16) / 2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    phoneDataItems[index]['phoneImg']),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        phoneDataItems[index]["code"],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "${phoneDataItems[index]["price"]} 元",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )),
          );
        }),
      ),
    );
  }

  ///运动
  Widget getPlay() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Wrap(
        children: List.generate(playDataItems.length, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => PlayDetailPage(
                        id: playDataItems[index]['id'].toString(),
                        name: playDataItems[index]["name"],
                        code: playDataItems[index]["code"],
                        playImg: playDataItems[index]["playImg"],
                        price: playDataItems[index]["price"].toString(),
                        promotionPrice: playDataItems[index]
                        ["promotionPrice"]
                            .toString(),
                        size: playDataItems[index]["size"],
                      )));
            },
            child: Card(
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Hero(
                      tag: playDataItems[index]["id"].toString(),
                      child: Container(
                        width: (size.width - 16) / 2,
                        height: (size.width - 16) / 2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    playDataItems[index]['playImg']),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        playDataItems[index]["code"],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "${playDataItems[index]["price"]} 元",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )),
          );
        }),
      ),
    );
  }

  ///男鞋
  Widget getBoyShoe() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Wrap(
        children: List.generate(shoeDataItems.length, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ShoeDetailPage(
                        id: shoeDataItems[index]['id'].toString(),
                        name: shoeDataItems[index]["name"],
                        code: shoeDataItems[index]["code"],
                        shoeImg: shoeDataItems[index]["shoeImg"],
                        price: shoeDataItems[index]["price"].toString(),
                        promotionPrice: shoeDataItems[index]
                        ["promotionPrice"]
                            .toString(),
                        size: shoeDataItems[index]["size"],
                      )));
            },
            child: Card(
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Hero(
                      tag: shoeDataItems[index]["id"].toString(),
                      child: Container(
                        width: (size.width - 16) / 2,
                        height: (size.width - 16) / 2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    shoeDataItems[index]['shoeImg']),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        shoeDataItems[index]["code"],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "${shoeDataItems[index]["price"]} 元",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )),
          );
        }),
      ),
    );
  }

  ///家电
  Widget getHomeTri() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Wrap(
        children: List.generate(homeDataItems.length, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => homeProductDetailPage(
                        id: homeDataItems[index]['id'].toString(),
                        name: homeDataItems[index]["name"],
                        code: homeDataItems[index]["code"],
                        img: homeDataItems[index]["img"],
                        price: homeDataItems[index]["price"].toString(),
                        promotionPrice: homeDataItems[index]
                        ["promotionPrice"]
                            .toString(),
                        size: homeDataItems[index]["size"],
                      )));
            },
            child: Card(
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Hero(
                      tag: homeDataItems[index]["id"].toString(),
                      child: Container(
                        width: (size.width - 16) / 2,
                        height: (size.width - 16) / 2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                NetworkImage(homeDataItems[index]['img']),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        homeDataItems[index]["code"],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "${homeDataItems[index]["price"]} 元",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )),
          );
        }),
      ),
    );
  }

  /// 美妆
  Widget getMakeUps() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Wrap(
        children: List.generate(makeupsDataItems.length, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => MakeUpsDetailPage(
                        id: makeupsDataItems[index]['id'].toString(),
                        name: makeupsDataItems[index]["name"],
                        code: makeupsDataItems[index]["code"],
                        makeupsImg: makeupsDataItems[index]["makeupsImg"],
                        price: makeupsDataItems[index]["price"].toString(),
                        promotionPrice: makeupsDataItems[index]
                        ["promotionPrice"]
                            .toString(),
                        size: makeupsDataItems[index]["size"],
                      )));
            },
            child: Card(
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Hero(
                      tag: makeupsDataItems[index]["id"].toString(),
                      child: Container(
                        width: (size.width - 16) / 2,
                        height: (size.width - 16) / 2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    makeupsDataItems[index]['makeupsImg']),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        makeupsDataItems[index]["code"],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "${makeupsDataItems[index]["price"]} 元",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )),
          );
        }),
      ),
    );
  }

  /// 数码
  Widget getDigital() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Wrap(
        children: List.generate(digitalDataItems.length, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => DigitalDetailPage(
                        id: digitalDataItems[index]['id'].toString(),
                        name: digitalDataItems[index]["name"],
                        code: digitalDataItems[index]["code"],
                        digitalImg: digitalDataItems[index]["digitalImg"],
                        price: digitalDataItems[index]["price"].toString(),
                        promotionPrice: digitalDataItems[index]
                        ["promotionPrice"]
                            .toString(),
                        size: digitalDataItems[index]["size"],
                      )));
            },
            child: Card(
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Hero(
                      tag: digitalDataItems[index]["id"].toString(),
                      child: Container(
                        width: (size.width - 16) / 2,
                        height: (size.width - 16) / 2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    digitalDataItems[index]['digitalImg']),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        digitalDataItems[index]["code"],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "${digitalDataItems[index]["price"]} 元",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )),
          );
        }),
      ),
    );
  }
}