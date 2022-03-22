import 'dart:io';

import 'package:app_demo/dto/user.dto.dart';
import 'package:app_demo/models/user.model.dart';
import 'package:app_demo/page/init.screen.dart';
import 'package:app_demo/service/locate.service.dart';
import 'package:app_demo/service/navigation.service.dart';
import 'package:app_demo/service/store.service.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive
    ..init(directory.path)
    ..registerAdapter(UserAdapter())
    ..registerAdapter(UserDtoAdapter());

  await setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: getIt.get<NavigationService>().navigationKey,
      title: 'Ads Business Suite',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                // overlayColor: MaterialStateProperty.all<Color>(
                //     Colors.blue1Color),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.yellow),
                // shadowColor: MaterialStateProperty.all<Color>(
                //     Colors.blue1Color),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4))))),
        primarySwatch: Colors.blue,
      ),
      home: IntroScreen(),
    );
  }
}
