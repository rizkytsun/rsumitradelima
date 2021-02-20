import 'package:flutter/material.dart';
import 'package:rsumitradelima/components.dart';
import 'package:rsumitradelima/page/daftar_poli.dart';

void main() {
  runApp(new MaterialApp(
    title: "jadwalDalam",
    home: new JadwalDalam(),
  ));
}

class JadwalDalam extends StatefulWidget {
  @override
  _JadwalDalamState createState() => _JadwalDalamState();
}

class _JadwalDalamState extends State<JadwalDalam> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.grey,
        title: new Text('Poliklinik Spesialis Penyakit Dalam'),
      ),
    );
  }
}
