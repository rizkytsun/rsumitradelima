import 'package:flutter/material.dart';
import 'package:rsumitradelima/components.dart';
import 'package:rsumitradelima/page/daftar_poli.dart';

void main() {
  runApp(new MaterialApp(
    title: "JadwalDalam",
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
        backgroundColor: MyConstants().colorJadwalDR,
        title: new Text('Poliklinik Penyakit Dalam'),
      ),
      backgroundColor: MyConstants().colorJadwalDR,
      body: new ListView(
        children: <Widget>[
          ListDokter(
            gambar: "assets/dokter/andi.png",
            nama: "dr. Andi Sulistyo Haribowo, Sp. PD",
            jadwal: "Sabtu : 08.00 - 10.00",
            jadwal2: "",
          ),
          ListDokter(
            gambar: "assets/dokter/ade.png",
            nama: "dr. Ade Nurshanty R. S., Sp. PD",
            jadwal: "Senin & Rabu : 18.30 - Selesai",
            jadwal2: "",
          ),
        ],
      ),
    );
  }
}

class ListDokter extends StatelessWidget {
  ListDokter({this.gambar, this.nama, this.jadwal, this.jadwal2});

  final String gambar;
  final String nama;
  final String jadwal;
  final String jadwal2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 4),
              )
            ]),
        child: new Center(
          child: new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: CircleAvatar(
                  radius: 40,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(gambar),
                  ),
                ),
              ),
              new Container(
                child: new Center(
                  child: new Column(
                    children: <Widget>[
                      new Text(
                        nama,
                        style: new TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      new Text(
                        jadwal,
                        style:
                            new TextStyle(fontSize: 15.0, color: Colors.grey),
                      ),
                      new Text(
                        jadwal2,
                        style:
                            new TextStyle(fontSize: 15.0, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
