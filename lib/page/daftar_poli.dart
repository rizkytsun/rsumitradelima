import 'package:flutter/material.dart';
import 'package:rsumitradelima/components.dart';
import 'package:rsumitradelima/page/jadwaldokter/jadwalAnak.dart';
import 'package:rsumitradelima/page/jadwaldokter/jadwalDalam.dart';
import 'package:rsumitradelima/page/jadwaldokter/jadwalKandungan.dart';
import 'package:rsumitradelima/page/jadwaldokter/jadwalOrtho.dart';
import 'package:rsumitradelima/page/jadwaldokter/jadwalRehab.dart';
import 'package:rsumitradelima/page/jadwaldokter/jadwalSyaraf.dart';
import 'package:rsumitradelima/page/jadwaldokter/jadwalMata.dart';
import 'package:rsumitradelima/page/jadwaldokter/jadwalGigi.dart';
import 'package:rsumitradelima/page/jadwaldokter/jadwalGigiSpesialis.dart';
import 'package:rsumitradelima/page/jadwaldokter/jadwalParu.dart';
import 'package:rsumitradelima/page/jadwaldokter/jadwalUrologi.dart';
import 'package:rsumitradelima/page/jadwaldokter/jadwalTHT.dart';
import 'package:rsumitradelima/page/jadwaldokter/jadwalJiwa.dart';
import 'package:rsumitradelima/page/jadwaldokter/jadwalKulit.dart';
import 'package:rsumitradelima/page/jadwaldokter/jadwalPatologi.dart';

void main() {
  runApp(new MaterialApp(
    title: "DaftarPoliklinik",
    home: new DaftarPoliklinik(),
  ));
}

class DaftarPoliklinik extends StatefulWidget {
  @override
  _DaftarPoliklinikState createState() => _DaftarPoliklinikState();
}

class _DaftarPoliklinikState extends State<DaftarPoliklinik> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: MyConstants().colorJadwalDR,
        title: new Text('DAFTAR POLIKLINIK'),
      ),
      backgroundColor: MyConstants().colorJadwalDR,
      body: new ListView(
        children: <Widget>[
          Container(
            child: InkWell(
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => JadwalAnak()),
                    ),
                child: ListJadwal(
                  gambar: 'assets/jadwaldokter/anak.png',
                  klinik: 'Klinik Spesialis Anak',
                )),
          ),
          InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => JadwalKandungan()),
                  ),
              child: ListJadwal(
                gambar: 'assets/jadwaldokter/kandungan.png',
                klinik: 'Klinik Spesialis Kandungan',
              )),
          InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => JadwalDalam()),
                  ),
              child: ListJadwal(
                gambar: 'assets/jadwaldokter/dalam.png',
                klinik: 'Klinik Spesialis Penyakit Dalam',
              )),
          InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => JadwalSyaraf()),
                  ),
              child: ListJadwal(
                gambar: 'assets/jadwaldokter/syaraf.png',
                klinik: 'Klinik Spesialis Syaraf',
              )),
          InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => JadwalRehab()),
                  ),
              child: ListJadwal(
                gambar: 'assets/jadwaldokter/rehab.png',
                klinik: 'Klinik Rehabilitasi Medik',
              )),
          InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => JadwalOrtho()),
                  ),
              child: ListJadwal(
                gambar: 'assets/jadwaldokter/ortho.png',
                klinik: 'Klinik Spesialis Orthopedi',
              )),
          InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => JadwalMata()),
                  ),
              child: ListJadwal(
                gambar: 'assets/jadwaldokter/mata.png',
                klinik: 'Klinik Spesialis Mata',
              )),
          InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => JadwalGigi()),
                  ),
              child: ListJadwal(
                gambar: 'assets/jadwaldokter/gigi.png',
                klinik: 'Klinik Gigi',
              )),
          InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => JadwalGigiSpesialis()),
                  ),
              child: ListJadwal(
                gambar: 'assets/jadwaldokter/gigi.png',
                klinik: 'Klinik Gigi Spesialis',
              )),
          InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => JadwalParu()),
                  ),
              child: ListJadwal(
                gambar: 'assets/jadwaldokter/paru.png',
                klinik: 'Klinik Spesialis paru',
              )),
          InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => JadwalUrologi()),
                  ),
              child: ListJadwal(
                gambar: 'assets/jadwaldokter/urologi.png',
                klinik: 'Klinik Spesialis Urologi',
              )),
          InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => JadwalTHT()),
                  ),
              child: ListJadwal(
                gambar: 'assets/jadwaldokter/tht.png',
                klinik: 'Klinik Spesialis THT',
              )),
          InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => JadwalJiwa()),
                  ),
              child: ListJadwal(
                gambar: 'assets/jadwaldokter/jiwa.png',
                klinik: 'Klinik Spesialis Jiwa',
              )),
          InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => JadwalKulit()),
                  ),
              child: ListJadwal(
                gambar: 'assets/jadwaldokter/kulit.png',
                klinik: 'Klinik Spesialis Kulit',
              )),
          InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => JadwalPatologi()),
                  ),
              child: ListJadwal(
                gambar: 'assets/jadwaldokter/patologi.png',
                klinik: 'Klinik Spesialis Patologi Anatomi',
              )),
        ],
      ),
    );
  }
}

class ListJadwal extends StatelessWidget {
  ListJadwal({this.gambar, this.klinik});

  final String gambar;
  final String klinik;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 2),
              )
            ]),
        padding: new EdgeInsets.all(10),
        child: new Center(
          child: new Row(
            children: <Widget>[
              Image.asset(
                gambar,
                width: (MediaQuery.of(context).size.width / 4) - 35.0,
              ),
              SizedBox(
                height: 20,
              ),
              new Container(
                padding: new EdgeInsets.all(20.0),
                child: new Center(
                    child: new Column(
                  children: <Widget>[
                    new Text(
                      klinik,
                      style: new TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    // new Text(
                    //   "Ini adalah Deskripsi ",
                    //   style: new TextStyle(fontSize: 15.0, color: Colors.grey),
                    // )
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
