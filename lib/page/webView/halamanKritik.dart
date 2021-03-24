import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../components.dart';

class HalamanKritik extends StatefulWidget {
  final String selectedUrl;
  


  HalamanKritik({
    @required this.selectedUrl,
  });

  @override
  _HalamanKritikState createState() => _HalamanKritikState();
}

class _HalamanKritikState extends State<HalamanKritik> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  bool isLoading = true;

  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstants().colorJadwalDR,
        title: Text("KRITIK DAN SARAN"),
      ),

      body: Stack(
        children: <Widget>[
          WebView(
            key: _key,
            initialUrl: widget.selectedUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading ? Center(child: CircularProgressIndicator(backgroundColor: Colors.redAccent, valueColor: AlwaysStoppedAnimation(Colors.green),)) : Stack(),
        ],
      ),
    );
  }
}
