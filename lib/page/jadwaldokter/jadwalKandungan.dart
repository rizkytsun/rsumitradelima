import 'package:flutter/material.dart';
import 'package:rsumitradelima/components.dart';
import 'package:rsumitradelima/page/daftar_poli.dart';

void main() {
  runApp(new MaterialApp(
    title: "jadwalKandungan",
    home: new JadwalKandungan(),
  ));
}

class JadwalKandungan extends StatefulWidget {
  @override
  _JadwalKandunganState createState() => _JadwalKandunganState();
}

class _JadwalKandunganState extends State<JadwalKandungan> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.grey,
        title: new Text('Poliklinik Spesialis Kandungan'),
      ),
    );
  }
}
