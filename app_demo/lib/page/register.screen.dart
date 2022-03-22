import 'dart:convert';

import 'package:app_demo/http_client/api.dart';
import 'package:app_demo/models/user_simple.model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late var emailText = TextEditingController();
  late var passwordText = TextEditingController();
  late var confirmPasswordText = TextEditingController();
  @override
  void initState() {
    emailText = TextEditingController();
    passwordText = TextEditingController();
    confirmPasswordText = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Register",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
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
              height: 20.0,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)),
              child: TextFormField(
                controller: confirmPasswordText,
                obscureText: true,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    // contentPadding: EdgeInsets.only(left: 10.0),
                    hintText: "Confirm password",
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () async {
                  if (confirmPasswordText.text != passwordText.text) {
                    const snackBar = SnackBar(
                      content: Text('Verification password does not match!'),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    return;
                  }
                  if (!emailText.text.isValidEmail()) {
                    const snackBar = SnackBar(
                      content: Text('Email is not valid!'),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    return;
                  }

                  UserSimple userSimple = UserSimple(
                      username: emailText.text, password: passwordText.text);
                  // await storage.write(
                  //     key: "demo", value: json.encode(userSimple));
                  var rest = RestClient(Dio());
                  rest.registerUser(json.encode(userSimple));
                  const snackBar = SnackBar(
                    content: Text('Register success'),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: const Text('Register'),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                },
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
