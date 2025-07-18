import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String url;

  const WebViewScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true
        ,title: Text('الخبر')),
      body: WebViewWidget(
        controller: WebViewController()..loadRequest(Uri.parse(url)),
      ),
    );
  }
}
