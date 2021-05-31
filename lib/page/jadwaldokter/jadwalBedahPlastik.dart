import 'dart:async';
import 'dart:convert';
// import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rsumitradelima/components.dart';
import 'package:full_screen_image/full_screen_image.dart';

void main() {
  runApp(new MaterialApp(
    title: "JadwalBedahPlastik",
    home: new JadwalBedahPlastik(),
  ));
}

class JadwalBedahPlastik extends StatefulWidget {
  @override
  _JadwalBedahPlastikState createState() => _JadwalBedahPlastikState();
}

class _JadwalBedahPlastikState extends State<JadwalBedahPlastik> {
  @override
  void initState() {
    super.initState();
    getAPIaccess();
  }

  List<String> listAsset = [
    "assets/dokter/badariyatud.png",
    "assets/dokter/user.png",
  ];

  var data;
  bool isLoadingData = true;
  bool isData = false;

  var listDokterAPI;

  Future getAPIaccess() async {
    final String url =
        'http://rsumitradelima.com:8080/api-rsmd/index.php/dokter?fungsi=5&kd_poli=bp';
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
        title: new Text('Poliklinik Spesialis Bedah Plastik'),
      ),
      backgroundColor: MyConstants().colorRSMDbg,
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
          leading: FullScreenWidget(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(gambar),
                  ),
                ),
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
