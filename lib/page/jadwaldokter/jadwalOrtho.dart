import 'package:flutter/material.dart';
import 'package:rsumitradelima/components.dart';
import 'package:rsumitradelima/page/daftar_poli.dart';

void main() {
  runApp(new MaterialApp(
    title: "jadwalOrtho",
    home: new JadwalOrtho(),
  ));
}

class JadwalOrtho extends StatefulWidget {
  @override
  _JadwalOrthoState createState() => _JadwalOrthoState();
}

class _JadwalOrthoState extends State<JadwalOrtho> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.grey,
        title: new Text('Poliklinik Spesialis Orthopedi'),
      ),
    );
  }
}
