import 'package:flutter/material.dart';
import 'package:rsumitradelima/components.dart';
import 'package:rsumitradelima/page/daftar_poli.dart';

void main() {
  runApp(new MaterialApp(
    title: "jadwalSyaraf",
    home: new JadwalSyaraf(),
  ));
}

class JadwalSyaraf extends StatefulWidget {
  @override
  _JadwalSyarafState createState() => _JadwalSyarafState();
}

class _JadwalSyarafState extends State<JadwalSyaraf> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.grey,
        title: new Text('Poliklinik Spesialis Syaraf'),
      ),
    );
  }
}
