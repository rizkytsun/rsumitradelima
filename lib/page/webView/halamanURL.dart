import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:rsumitradelima/page/webView/pendaftaranURL.dart';

class HalamanUtama extends StatelessWidget {
  final String selectedUrl;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  HalamanUtama({
    @required this.selectedUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PENDAFTARAN ONLINE"),
      ),
      body: WebView(
        initialUrl: selectedUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
