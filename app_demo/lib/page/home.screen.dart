import 'package:app_demo/jsfunction/jsFunction.dart';
import 'package:app_demo/page/ads_page/comment.screen.dart';
import 'package:app_demo/page/ads_page/liked.screen.dart';
import 'package:app_demo/page/ads_page/overview.screen.dart';

import 'package:app_demo/page/facebook.screen.dart';
import 'package:app_demo/page/loading.screen.dart';
import 'package:app_demo/page/login.screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    // ListProductScreen(),
    OverviewScreen(),
    LikeScreen(),
    CommentScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 62, 112),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 62, 112),
        title: const Text('Ads Optimize suite'),
        actions: [
          InkWell(
              onTap: () async {
                await storage.delete(key: "user");
                await storage.write(key: "isLogin", value: "false");
                await JsFunction.clearCookie(cookieManager);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => LoaddingScreen()));
              },
              child: Icon(Icons.logout)),
          const SizedBox(
            width: 10.0,
          )
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Color.fromARGB(255, 0, 62, 112),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              // color: Colors.white,
            ),
            label: 'Overview',
            backgroundColor: Color.fromARGB(255, 0, 62, 112),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up),
            label: 'Like',
            backgroundColor: Color.fromARGB(255, 0, 62, 112),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: 'Comment',
            backgroundColor: Color.fromARGB(255, 0, 62, 112),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
