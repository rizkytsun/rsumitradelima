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
        backgroundColor: MyConstants().colorJadwalDR,
        title: new Text('Poliklinik Spesialis Syaraf'),
      ),
      backgroundColor: MyConstants().colorJadwalDR,
      body: new ListView(
        children: <Widget>[
          ListDokter(
            gambar: "assets/dokter/user.png",
            nama: "dr. Luky Santi E., Sp. S",
            jadwal1_hari: "Senin & Rabu",
            jadwal1_jam: "11.00 - 13.00",
            jadwal2_hari: "",
            jadwal2_jam: "",
          ),
          ListDokter(
            gambar: "assets/dokter/user.png",
            nama: "dr. Made Ayu, Sp. S",
            jadwal1_hari: "Rabu",
            jadwal1_jam: "10.30 - 12.00",
            jadwal2_hari: "Jum'at",
            jadwal2_jam: "09.00 - 11.00",
          ),
          ListDokter(
            gambar: "assets/dokter/user.png",
            nama: "dr. Ria Damaynti, Sp. S",
            jadwal1_hari: "Selasa & Kamis",
            jadwal1_jam: "14.00 - Selesai",
            jadwal2_hari: "Sabtu",
            jadwal2_jam: "08.00 - Selesai",
          ),
        ],
      ),
    );
  }
}

class ListDokter extends StatelessWidget {
  ListDokter(
      {this.gambar,
      this.nama,
      this.jadwal1_hari,
      this.jadwal1_jam,
      this.jadwal2_hari,
      this.jadwal2_jam});

  final String gambar;
  final String nama;
  final String jadwal1_hari;
  final String jadwal1_jam;
  final String jadwal2_hari;
  final String jadwal2_jam;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
        child: ListTile(
          leading: CircleAvatar(
              // backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(gambar)),
          title: Text(
            nama,
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        jadwal1_hari,
                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                      ),
                    ),
                    // Expanded(),
                    Text(
                      jadwal1_jam,
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    )
                  ],
                ),
                Divider(color: Colors.grey[600]),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        jadwal2_hari,
                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                      ),
                    ),
                    Text(
                      jadwal2_jam,
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
          ),
          dense: true,
        ),
      ),
    );
  }
}
