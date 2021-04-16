import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:rsumitradelima/components.dart';
import 'package:rsumitradelima/page/daftarPoli.dart';

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
  void initState() {
    super.initState();
    getAPIaccess();
  }

  var listDokterAPI;

  Future getAPIaccess() async {
    final String url =
        'rsumitradelima.com:8080/api-rsmd/index.php/jadwal?fungsi=3&hari=senin&poli=ana';
    var response = await http
        .get(Uri.encodeFull(url), headers: {'accept': 'application/json'});

        setState(() {
      if (result.statusCode == 200) {
        var content = json.decode(result.body);
        if (content['result'] = true) {
          data = content['data'];
          isData = true;
        } 
      }
      isLoadingData = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // var listDokterAPI;
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: MyConstants().colorJadwalDR,
        title: new Text('Poliklinik Spesialis Anak'),
      ),
      backgroundColor: MyConstants().colorJadwalDR,
      body: new ListView.builder(
        itemCount: listDokterAPI.length,
        itemBuilder: (context, i) => ListDokter(
          nama: listDokterAPI[i]["nama"],
          hari_kerja: listDokterAPI[i]["hari_kerja"],
          jam_mulai: listDokterAPI[i]["jam_mulai"],
          jam_selesai: listDokterAPI[i]["jam_selesai"],
        ),
      ),
    );
  }
}

class ListDokter extends StatelessWidget {
  ListDokter(
      {this.gambar,
      this.nama,
      this.hari_kerja,
      this.jam_mulai,
      // this.jadwal2_hari,
      this.jam_selesai});

  final String gambar;
  final String nama;
  final String hari_kerja;
  final String jam_mulai;
  // final String jadwal2_hari;
  final String jam_selesai;

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
                        hari_kerja,
                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                      ),
                    ),
                    // Expanded(),
                    Text(
                      jam_mulai,
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
                        jam_selesai,
                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                      ),
                      // child: Text(
                      //   // jadwal2_hari,
                      //   style: TextStyle(fontSize: 14.0, color: Colors.grey),
                      // ),
                    ),
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
