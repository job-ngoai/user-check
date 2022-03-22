import 'dart:convert';

import 'package:app_demo/dto/base_response.dart';
import 'package:app_demo/http_client/api.dart';
import 'package:app_demo/jsfunction/jsFunction.dart';
import 'package:app_demo/page/facebook.screen.dart';
import 'package:app_demo/page/home.screen.dart';
import 'package:app_demo/page/register.screen.dart';
import 'package:app_demo/service/locate.service.dart';
import 'package:app_demo/service/navigation.service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginWithFbScreen extends StatefulWidget {
  const LoginWithFbScreen({Key? key}) : super(key: key);

  @override
  _LoginWithFbScreenState createState() => _LoginWithFbScreenState();
}

class _LoginWithFbScreenState extends State<LoginWithFbScreen> {
  late var emailText = TextEditingController();
  late var passwordText = TextEditingController();
  bool showLogin = true;
  var rest = RestClient(Dio());
  @override
  void initState() {
    emailText = TextEditingController();
    passwordText = TextEditingController();
    getConfig();
    super.initState();
  }

  Future<void> getConfig() async {
    var res = await rest.getConfig(1);
    if (res.isNotEmpty) {
      setState(() {
        showLogin = res[0].showLogin!;
        print("show:" + showLogin.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(showLogin);
    Widget loginForm() {
      return Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey)),
            child: TextFormField(
              controller: emailText,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  // contentPadding: EdgeInsets.only(left: 10.0),
                  hintText: "Email",
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey)),
            child: TextFormField(
              controller: passwordText,
              obscureText: true,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  // contentPadding: EdgeInsets.only(left: 10.0),
                  hintText: "password",
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () async {
                if (emailText.text.isEmpty || passwordText.text.isEmpty) {
                  const snackBar = SnackBar(
                    content: Text('Please complete all information!'),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return;
                }
                var restClient = RestClient(Dio());
                BaseResponse baseResponse = await restClient.loginUser(json
                    .encode({
                  'username': emailText.text,
                  'password': passwordText.text
                }));

                if (baseResponse.statusCode == 200) {
                  await storage.write(key: "isLogin", value: "true");
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                } else {
                  const snackBar = SnackBar(
                    content: Text('Wrong information!'),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text(
                'Login',
              ),
            ),
          ),
          InkWell(
            onTap: () {
              getIt.get<NavigationService>().push(RegisterScreen());
            },
            child: Text(
              'Dont have account , register here!',
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            "OR",
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 100.0,
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 62, 112),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('assets/le_anh.png')),
                  border: Border.all(color: Colors.white, width: 5),
                  borderRadius: BorderRadius.circular(30)),
            ),
            const SizedBox(
              height: 40,
            ),
            // showLogin ? loginForm() : const SizedBox(),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (BuildContext context) => FacebookScreen()))
                      .then((value) async {
                    // print(json.encode(value));
                    // User user = User.fromJson(value);

                    if (value != null) {
                      // var restClient = RestClient(Dio());
                      // restClient.postUser(json.encode(value));
                      // await storage.write(key: "isLogin", value: "true");
                      const snackBar = SnackBar(
                        content: Text('Login success........!'),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      await Future.delayed(const Duration(milliseconds: 1000));
                      getIt.get<NavigationService>().pushReplace(HomeScreen());
                    }
                  });
                },
                child: const Text('Login with Facebook'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
