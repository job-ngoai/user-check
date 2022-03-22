import 'package:app_demo/jsfunction/jsFunction.dart';
import 'package:app_demo/page/ads_page/liked.screen.dart';
import 'package:app_demo/page/ads_page/overview.screen.dart';
import 'package:app_demo/page/facebook.screen.dart';
import 'package:app_demo/page/login.screen.dart';
import 'package:flutter/material.dart';

class NonePage extends StatefulWidget {
  const NonePage({Key? key}) : super(key: key);

  @override
  _NonePageState createState() => _NonePageState();
}

class _NonePageState extends State<NonePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    OverviewScreen(
      isNotActive: true,
    ),
    LikeScreen(
      isNotActive: true,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Ads Optimize suite'),
        actions: [
          InkWell(
              onTap: () async {
                await storage.delete(key: "user");
                await storage.write(key: "isLogin", value: "false");
                await JsFunction.clearCookie(cookieManager);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => LoginScreen()));
              },
              child: Icon(Icons.logout)),
          const SizedBox(
            width: 10.0,
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Overview',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Area',
            backgroundColor: Colors.green,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
