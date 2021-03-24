import 'package:rsumitradelima/page/webView/halamanPendaftaran.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "My App",
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MY App',
        home: HalamanPendaftaran(
          selectedUrl:
              "http://rsumitradelima.com:8080/webapps/epasien/login.php",
        ));
  }
}
