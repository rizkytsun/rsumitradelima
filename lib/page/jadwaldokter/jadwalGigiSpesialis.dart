import 'dart:async';
import 'dart:convert';
// import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rsumitradelima/components.dart';

void main() {
  runApp(new MaterialApp(
    title: "JadwalGigiSpesialis",
    home: new JadwalGigiSpesialis(),
  ));
}

class JadwalGigiSpesialis extends StatefulWidget {
  @override
  _JadwalGigiSpesialisState createState() => _JadwalGigiSpesialisState();
}

class _JadwalGigiSpesialisState extends State<JadwalGigiSpesialis> {
  @override
  void initState() {
    super.initState();
    getAPIaccess();
  }

  List<String> listAsset = [
    "assets/dokter/lukman.png",
    "assets/dokter/aan.png",
  ];

  var data;
  bool isLoadingData = true;
  bool isData = false;

  var listDokterAPI;

  Future getAPIaccess() async {
    final String url =
        'http://rsumitradelima.com:8080/api-rsmd/index.php/dokter?fungsi=5&kd_poli=gs';
    var result = await http
        .get(Uri.encodeFull(url), headers: {'accept': 'application/json'});

    setState(() {
      if (result.statusCode == 200) {
        var content = json.decode(result.body);
        if (content['status'] == 'sukses') {
          listDokterAPI = content['data'];
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
        title: new Text('Poliklinik Spesialis Gigi'),
      ),
      backgroundColor: MyConstants().colorJadwalDR,
      body: isLoadingData
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: listDokterAPI.length,
              itemBuilder: (context, i) => ListDokter(
                gambar: listAsset[i],
                nama: listDokterAPI[i]["nm_dokter"],
                listJadwal: listDokterAPI[i]["det_dokter"],
              ),
            ),
    );
  }
}

class ListDokter extends StatelessWidget {
  ListDokter({this.gambar, this.nama, this.listJadwal});

  final String gambar;
  final String nama;
  final List<dynamic> listJadwal;

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
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(gambar),
              ),
            ),
          ),
          title: Column(
            children: <Widget>[
              Text(
                nama,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Divider(color: Colors.grey),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: listJadwal.length,
              itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        listJadwal[i]['hari_kerja'],
                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                      ),
                    ),
                    Text(
                      listJadwal[i]['jam_mulai'] +
                          " - " +
                          listJadwal[i]['jam_selesai'],
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
          ),
          dense: true,
        ),
      ),
    );
  }
}
