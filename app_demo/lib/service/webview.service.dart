import 'dart:io';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebService {
  static Future<Cookie?> getCookie(Uri uri) async {
    CookieManager cookieManager = CookieManager.instance();
    Cookie? cookie = await cookieManager.getCookie(url: uri, name: "");
    return cookie;
  }
}
