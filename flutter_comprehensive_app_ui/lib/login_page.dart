import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comprehensive_app_ui/view/app_root_page.dart';


///
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FlatButton(
          shape: const StadiumBorder(),
          color: Colors.orange,
          minWidth: 180,
          height: 80,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) => const AppRootPage()));
          },
          child: const Text("登  录", style: TextStyle(fontSize: 21, color: CupertinoColors.white),),
        )
      )
    );
  }
}

