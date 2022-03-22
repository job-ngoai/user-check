import 'package:hive/hive.dart';

String cookieBox = 'cookie_box';
String cookieKey = 'cookieKey';
Box? box;

class StoreService {
  StoreService instance() {
    return StoreService();
  }

  Future<void> init() async {
    box = await Hive.openBox(cookieBox);
  }

  Future<void> setValue(String key, dynamic value) async {
    await box!.put(key, value);
  }

  Future<dynamic> getValue(String key) async {
    return await box!.get(key);
  }
}
