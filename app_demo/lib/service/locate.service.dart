import 'package:app_demo/http_client/api_ip.dart';
import 'package:app_demo/http_client/app_api.dart';
import 'package:app_demo/service/navigation.service.dart';
import 'package:app_demo/service/store.service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> setupLocator() async {
  //service
  getIt.registerSingleton<NavigationService>(NavigationService());
  getIt.registerSingleton<StoreService>(StoreService());
  getIt.registerSingleton<RestIpClient>(RestIpClient(AppApi.createDio()));
}
