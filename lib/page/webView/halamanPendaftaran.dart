import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rsumitradelima/components.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:rsumitradelima/page/webView/pendaftaranURL.dart';

class HalamanUtama extends StatelessWidget {
  final String selectedUrl;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  HalamanUtama({
    @required this.selectedUrl,
  });

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstants().colorJadwalDR,
        title: Text("PENDAFTARAN ONLINE"),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : WebView(
              initialUrl: selectedUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
            ),
    );
  }
}
