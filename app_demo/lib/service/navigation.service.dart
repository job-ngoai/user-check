import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  // bool pop() {
  //   return _navigationKey.currentState!.canPop();
  // }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> push(Widget nameScreen) {
    return _navigationKey.currentState!
        .push(MaterialPageRoute(builder: (BuildContext context) => nameScreen));
  }

  Future<dynamic> pushReplace(Widget nameScreen) {
    return _navigationKey.currentState!.pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => nameScreen));
  }

  Future<dynamic> replaceTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  dynamic pop() {
    return _navigationKey.currentState!.pop();
  }
}
