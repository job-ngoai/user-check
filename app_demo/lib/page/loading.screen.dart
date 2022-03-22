import 'package:app_demo/http_client/api.dart';
import 'package:app_demo/page/login.screen.dart';
import 'package:app_demo/page/login_with_fb.screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoaddingScreen extends StatefulWidget {
  const LoaddingScreen({Key? key}) : super(key: key);

  @override
  _LoaddingScreenState createState() => _LoaddingScreenState();
}

class _LoaddingScreenState extends State<LoaddingScreen> {
  bool showLogin = true;
  var rest = RestClient(Dio());

  @override
  void initState() {
    getConfig();
    super.initState();
  }

  Future<void> getConfig() async {
    var res = await rest.getConfig(5);
    if (res.isNotEmpty) {
      showLogin = res[0].showLogin!;
      if (showLogin) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginWithFbScreen()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
