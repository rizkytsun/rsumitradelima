import 'package:flutter/material.dart';
import 'package:rsumitradelima/components.dart';
import 'package:rsumitradelima/page/jadwaldokter/DetailDokter/DokterDetail.dart';
import 'package:rsumitradelima/page/jadwaldokter/jadwalAnak.dart';
import 'package:rsumitradelima/page/jadwaldokter/jadwalBedah.dart';
import 'package:rsumitradelima/page/jadwaldokter/jadwalBedahPlastik.dart';
import 'package:rsumitradelima/page/jadwaldokter/jadwalDalam.dart';
import 'package:rsumitradelima/page/jadwaldokter/jadwalJantung.dart';
import 'package:rsumitradelima/page/jadwaldokter/jadwalKGA.dart';
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
      backgroundColor: MyConstants().colorRSMDbg,
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
                    MaterialPageRoute(builder: (_) => JadwalBedah()),
                  ),
              child: ListJadwal(
                gambar: 'assets/jadwaldokter/bedah.png',
                klinik: 'Klinik Spesialis Bedah',
              )),
          InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => JadwalBedahPlastik()),
                  ),
              child: ListJadwal(
                gambar: 'assets/jadwaldokter/bedahplastik.png',
                klinik: 'Klinik Spesialis Bedah Plastik',
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
                    MaterialPageRoute(builder: (_) => JadwalKGA()),
                  ),
              child: ListJadwal(
                gambar: 'assets/jadwaldokter/gigi.png',
                klinik: 'Klinik Kedokteran Gigi Anak',
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
                    MaterialPageRoute(builder: (_) => JadwalJantung()),
                  ),
              child: ListJadwal(
                gambar: 'assets/jadwaldokter/jantung.png',
                klinik: 'Klinik Spesialis Jantung',
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
                    MaterialPageRoute(builder: (_) => DokterDetailPage()),
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
    return new Container(
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 0,
              offset: Offset(0, 0),
            )
          ]),
      padding: new EdgeInsets.all(10),
      child: new Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: new Row(
            children: <Widget>[
              Image.asset(
                gambar,
                width: (MediaQuery.of(context).size.width / 10) - 5.0,
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
