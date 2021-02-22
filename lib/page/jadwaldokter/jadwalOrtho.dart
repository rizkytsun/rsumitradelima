import 'package:flutter/material.dart';
import 'package:rsumitradelima/components.dart';
import 'package:rsumitradelima/page/daftar_poli.dart';

void main() {
  runApp(new MaterialApp(
    title: "jadwalKandungan",
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
        backgroundColor: MyConstants().colorJadwalDR,
        title: new Text('Poliklinik Spesialis Ortho'),
      ),
      backgroundColor: MyConstants().colorJadwalDR,
      body: new ListView(
        children: <Widget>[
          ListDokter(
            gambar: "assets/dokter/widiyanti.png",
            nama: "dr. Widiyanti, Sp.OG",
            jadwal: "Senin & Kamis",
            jadwala: " : 10.00 - Selesai",
            jadwal2: "Sabtu",
            jadwal2a: " : 12.00 - Selesai",
          ),
          ListDokter(
            gambar: "assets/dokter/widi.png",
            nama: "dr. Widi Hatmaka, Sp.OG",
            jadwal: "Senin & Kamis",
            jadwala: " : 10.00 - Selesai",
            jadwal2: "Sabtu",
            jadwal2a: " : 12.00 - Selesai",
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
      this.jadwal,
      this.jadwala,
      this.jadwal2,
      this.jadwal2a});

  final String gambar;
  final String nama;
  final String jadwal;
  final String jadwala;
  final String jadwal2;
  final String jadwal2a;

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
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
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                    child: CircleAvatar(
                      radius: 50,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage(gambar),
                      ),
                    ),),
            ),
          ],
        ),


      // child: new Row(
      //   mainAxisSize: MainAxisSize.max,
      //   children: <Widget>[
      //     Padding(
      //       padding: const EdgeInsets.all(1.0),
      //       child: CircleAvatar(
      //         radius: 40,
      //         child: CircleAvatar(
      //           radius: 40,
      //           backgroundImage: AssetImage(gambar),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(10.0),
      //       child: new Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: <Widget>[
      //           new Text(
      //             nama,
      //             style: new TextStyle(
      //                 fontSize: 16.0,
      //                 fontWeight: FontWeight.bold,
      //                 color: Colors.black),
      //           ),
      //           SizedBox(height: 10,),
      //           Row(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             mainAxisSize: MainAxisSize.max,
      //             children: <Widget>[
      //               new Text(
      //                 jadwal,
      //                 style: new TextStyle(
      //                     fontSize: 15.0, color: Colors.grey),
      //               ),
      //               // Expanded(),
      //               new Text(
      //                 jadwala, style: TextStyle(color: Colors.grey),
      //               )
      //             ],
      //           ),
      //           Row(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: <Widget>[
      //               new Text(
      //                 jadwal2, 
      //                 style: new TextStyle(
      //                     fontSize: 15.0, color: Colors.grey),
      //               ),
      //               new Text(
      //                 jadwal2a, style: TextStyle(color: Colors.grey),
      //               )
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
        // ],
      // ),
    );
  }
}
