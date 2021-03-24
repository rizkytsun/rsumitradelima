import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../components.dart';

class HalamanJurnal extends StatefulWidget {
  final String selectedUrl;
  


  HalamanJurnal({
    @required this.selectedUrl,
  });

  @override
  _HalamanJurnalState createState() => _HalamanJurnalState();
}

class _HalamanJurnalState extends State<HalamanJurnal> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  bool isLoading = true;

  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstants().colorJadwalDR,
        title: Text("ELEKTRONIK JURNAL"),
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
