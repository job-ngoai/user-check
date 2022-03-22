import 'package:app_demo/jsfunction/jsFunction.dart';
import 'package:app_demo/page/home.screen.dart';
import 'package:app_demo/page/loading.screen.dart';
import 'package:app_demo/page/login.screen.dart';
import 'package:app_demo/service/locate.service.dart';
import 'package:app_demo/service/navigation.service.dart';
import 'package:stacked/stacked.dart';

class InitScreenViewModel extends BaseViewModel {
  bool isLogin = false;

  Future<void> checkLogin() async {
    var isLoginTmp = await storage.read(key: "isLogin");
    if (isLoginTmp == "true") {
      isLogin = true;

      getIt.get<NavigationService>().pushReplace(HomeScreen());
    } else {
      var isFirstTmp = await storage.read(key: "isFirst");
      if (isFirstTmp == "true") {
        getIt.get<NavigationService>().pushReplace(LoaddingScreen());
      } else {
        await storage.delete(key: "isFirst");
      }
    }
  }
}
