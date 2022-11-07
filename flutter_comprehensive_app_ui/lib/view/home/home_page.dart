import 'package:flutter/material.dart';
import 'page_view_indicator.dart';

/// 首页
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  ///搜索框输入控制器
  final searchController = TextEditingController();

  ///搜索监听key
  final GlobalKey<FormState> inputNumKey = GlobalKey<FormState>();

  ///商品名称
  String? thingName;

  ///输入框表单验证商品名称输入
  final bool _validate = false;

  ///控制切换生活/户外家居的控制器
  TabController? _tabController;

  ///初始化一个偏移量为1000 向上偏移的1000
  ScrollController gridViewController = ScrollController(initialScrollOffset: 1000);

  /// 设置判断是否置顶
  var _flag = false;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
    gridViewController.addListener((){
      //更新状态
      setState(() {
        _flag = gridViewController.offset >= 10;
      });
      print("监听滚动的位置 ${gridViewController.offset}");

    });
  }

  @override
  void dispose() {
    super.dispose();
    gridViewController.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //全屏宽度和高度
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    //扣除安全区域外的高度（扣掉刘海屏和底部按钮栏高度）
    var padding = MediaQuery.of(context).padding;
    return Scaffold(
        body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minHeight: 200.0,
                    ),
                    child: Container(
                        width: width,
                        height: height,
                        color: Colors.white,
                        child: Column(children: [
                          Container(
                            width: double.infinity,
                            height: 108,
                            color: Colors.redAccent,
                            child:
                            Stack(alignment: Alignment.center, children: [
                              Container(
                                  margin: const EdgeInsets.only(
                                      top: 21, left: 21, right: 21),
                                  height: 43,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 3, bottom: 4, top: 5),
                                      child: Form(
                                        key: inputNumKey,
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        child: TextFormField(
                                            textAlign: TextAlign.center,
                                            onSaved: (val) {
                                              thingName = val;
                                            },
                                            autofocus: false,
                                            autocorrect: false,
                                            controller: searchController,
                                            decoration: InputDecoration(
                                              errorText:
                                              _validate ? "输入不能为空" : null,
                                              border: InputBorder.none,
                                              hintText: "搜索商品类型",
                                              hintStyle: const TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey),
                                            )),
                                      ))),
                              //设置搜索按钮
                              Positioned(
                                  left: 20,
                                  top: 26,
                                  bottom: 0,
                                  child: Container(
                                    child: IconButton(
                                        icon: const Icon(Icons.search),
                                        color: Colors.grey,
                                        onPressed: () {
                                          setState(() {
                                            FocusScope.of(context)
                                                .requestFocus(FocusNode());
                                          });
                                          getSearchNumber();
                                        }),
                                  )),

                              //设置清除搜索框信息按钮
                              Positioned(
                                  right: 20,
                                  top: 20,
                                  bottom: 1,
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
                            ]),
                          ),
                          const SizedBox(height: 10),
                          const PageViewIndicator(),
                          _flag == true
                          ? Container()
                              : Container(
                            padding: const EdgeInsets.all(10.0),
                            height: 120,
                            width: double.infinity,
                            color: Colors.white,
                            child: GridView.builder(
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  //一行的Widget数量
                                  crossAxisCount: 4,
                                  //水平子Widget之间间距
                                  crossAxisSpacing: 10.0,
                                  //垂直子Widget之间间距
                                  mainAxisSpacing: 10.0,
                                  //子Widget宽高比例
                                  childAspectRatio: 3.0,
                                ),
                                itemCount: 8,
                                itemBuilder: (context, pos) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: const DecorationImage(
                                        image: NetworkImage(
                                          "https://img0.baidu.com/it/u=664918127,3260197401&fm=253&fmt=auto&app=120&f=JPEG?w=1422&h=800"
                                        ),
                                        fit: BoxFit.cover
                                      )
                                    ),
                                  );
                                }),),
                          const SizedBox(height: 10),
                          Container(
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey, blurRadius: 15.0)
                                  ],
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular((55.0))),
                              margin: const EdgeInsets.only(left: 30, right: 30),
                              child: Stack(
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        // 可添加tabbar的点击事件
                                        },
                                      child: TabBar(
                                          controller: _tabController,
                                          indicator: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.orangeAccent,
                                                  width: 1.0),
                                              color: Colors.orange,
                                              borderRadius:
                                              BorderRadius.circular(55)),
                                          //选中TabBar时显示的字体颜色
                                          labelColor: Colors.white,
                                          //未选中TabBar显示的字体颜色
                                          unselectedLabelColor: Colors.black,
                                          tabs: const [
                                            SizedBox(
                                                height: 40,
                                                width: 56,
                                                child: Align(
                                                    child: Text("生活家居",
                                                        style: TextStyle(
                                                            fontSize: 14)))),
                                            SizedBox(
                                                height: 40,
                                                width: 56,
                                                child: Align(
                                                    child: Text("户外家居",
                                                        style:
                                                        TextStyle(fontSize: 14))))
                                          ]),
                                    )
                                  ]
                              )
                          ),
                          const SizedBox(height: 10),
                          Expanded(flex: 1,
                              child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    getInSide(),
                                    getOutSide(),
                                  ])),
                          const SizedBox(height: 10),
                        ]))))));
  }

  ///本地搜索商品名称
  void getSearchNumber() {}

  ///生活家居
  Widget getInSide() {
    return Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        color: Colors.white,
        child: GridView.builder(
          controller: gridViewController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //一行的Widget数量
              crossAxisCount: 2,
              //水平子Widget之间间距
              crossAxisSpacing: 10.0,
              //垂直子Widget之间间距
              mainAxisSpacing: 10.0,
              //子Widget宽高比例
              childAspectRatio: 4/3,
            ),
            itemCount: 100,
            itemBuilder: (context, pos) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.win4000."
                                "com%2Fwallpaper%2F2%2F543f6fbc5ed84.jpg&refer=http%3A%2F%2Fpic1."
                                "win4000.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec="
                                "1670398833&t=a714819187a1136c590766930b943e4b"
                        ),
                        fit: BoxFit.cover
                    )
                ),
              );
            }));
  }

  /// 户外家居
  Widget getOutSide() {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      color: Colors.white, //GestureDetector
      child: GridView.builder(
          controller: gridViewController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //一行的Widget数量
            crossAxisCount: 3,
            //水平子Widget之间间距
            crossAxisSpacing: 10.0,
            //垂直子Widget之间间距
            mainAxisSpacing: 10.0,
            //子Widget宽高比例
            childAspectRatio: 3/4,
          ),
          itemCount: 100,
          itemBuilder: (context, pos) {
            return GestureDetector(
              onTap: () {
                print("来计算的佛");
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://img2.baidu.com/it/u=968728915,3768339552&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
                      ),
                    fit: BoxFit.cover
                  )
                ),
              ),
            );
          }),
    );
  }
}
