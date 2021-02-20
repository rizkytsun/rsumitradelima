import 'package:flutter/material.dart';
import 'package:rsumitradelima/components.dart';
import 'package:rsumitradelima/page/daftar_poli.dart';

void main() {
  runApp(new MaterialApp(
    title: "jadwalRehab",
    home: new JadwalRehab(),
  ));
}

class JadwalRehab extends StatefulWidget {
  @override
  _JadwalRehabState createState() => _JadwalRehabState();
}

class _JadwalRehabState extends State<JadwalRehab> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.grey,
        title: new Text('Poliklinik Rehabilitasi Medik'),
      ),
    );
  }
}
