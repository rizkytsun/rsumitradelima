import 'package:flutter/material.dart';
import 'package:rsumitradelima/components.dart';
import 'package:rsumitradelima/page/daftar_poli.dart';

void main() {
  runApp(new MaterialApp(
    title: "jadwalAnak",
    home: new JadwalAnak(),
  ));
}

class JadwalAnak extends StatefulWidget {
  @override
  _JadwalAnakState createState() => _JadwalAnakState();
}

class _JadwalAnakState extends State<JadwalAnak> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: MyConstants().colorJadwalDR,
        title: new Text('Poliklinik Spesialis Anak'),
      ),
      backgroundColor: MyConstants().colorJadwalDR,
      body: new ListView(
        children: <Widget>[
          ListDokter(
            gambar: "assets/jadwaldokter/anak.png",
            nama: "dr. Ni Luh Putu Herli Mastuti, Sp.A",
            jadwal: "Senin, Kamis & Jum'at : 15.00 - 17.00",
            jadwal2: "Sabtu : 13.00 - 15.00",
          ),
          ListDokter(
            gambar: "assets/jadwaldokter/anak.png",
            nama: "dr. Dewi Nurindah, Sp.A. M.Biomed",
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
              Image.asset(
                gambar,
                width: (MediaQuery.of(context).size.width / 3) - 35.0,
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
