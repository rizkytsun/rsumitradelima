import 'package:flutter/material.dart';
import 'package:rsumitradelima/components.dart';
import 'package:rsumitradelima/page/daftar_poli.dart';

void main() {
  runApp(new MaterialApp(
    title: "jadwalJiwa",
    home: new JadwalJiwa(),
  ));
}

class JadwalJiwa extends StatefulWidget {
  @override
  _JadwalJiwaState createState() => _JadwalJiwaState();
}

class _JadwalJiwaState extends State<JadwalJiwa> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: MyConstants().colorJadwalDR,
        title: new Text('Poliklinik Spesialis Jiwa'),
      ),
      backgroundColor: MyConstants().colorJadwalDR,
      body: new ListView(
        children: <Widget>[
          ListDokter(
            gambar: "assets/dokter/widiyanti.png",
            nama: "dr. Tutik Nur Kasiana, Sp. KJ",
            jadwal1_hari: "Rabu",
            jadwal1_jam: "19.00 - Selesai",
            jadwal2_hari: "Sabtu",
            jadwal2_jam: "13.00 - 17.00",
            jadwal3_hari: "Minggu",
            jadwal3_jam: "14.00 - 16.00",
          ),
          // ListDokter(
          //   gambar: "assets/dokter/widi.png",
          //   nama: "dr. Widi Hatmaka, Sp. OG",
          //   jadwal1_hari: "Selasa, Rabu & Jum'at",
          //   jadwal1_jam: "16.30 - 18.00",
          //   jadwal2_hari: "Sabtu",
          //   jadwal2_jam: "10.00 - Selesai",
          // ),
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
      this.jadwal2_jam,
      this.jadwal3_hari,
      this.jadwal3_jam});

  final String gambar;
  final String nama;
  final String jadwal1_hari;
  final String jadwal1_jam;
  final String jadwal2_hari;
  final String jadwal2_jam;
  final String jadwal3_hari;
  final String jadwal3_jam;

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
                Divider(color: Colors.grey[600]),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        jadwal3_hari,
                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                      ),
                    ),
                    Text(
                      jadwal3_jam,
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
