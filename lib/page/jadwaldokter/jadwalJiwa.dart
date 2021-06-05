import 'dart:async';
import 'dart:convert';
// import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rsumitradelima/components.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:rsumitradelima/page/jadwaldokter/DetailDokter/DokterDetail.dart';

void main() {
  runApp(new MaterialApp(
    title: "JadwalJiwa",
    home: new JadwalJiwa(),
  ));
}

class JadwalJiwa extends StatefulWidget {
  @override
  _JadwalJiwaState createState() => _JadwalJiwaState();
}

class _JadwalJiwaState extends State<JadwalJiwa> {
  @override
  void initState() {
    super.initState();
    getAPIaccess();
  }

  List<String> listAsset = [
    "assets/dokter/tutik.png",
    "assets/dokter/user.png",
  ];

  var data;
  bool isLoadingData = true;
  bool isData = false;

  var listDokterAPI;

  Future getAPIaccess() async {
    final String url =
        'http://rsumitradelima.com:8080/api-rsmd/index.php/dokter?fungsi=5&kd_poli=jw';
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
        title: new Text('Poliklinik Spesialis Jiwa'),
      ),
      backgroundColor: MyConstants().colorRSMDbg,
      body: isLoadingData
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: listDokterAPI.length,
              itemBuilder: (context, i) => GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DokterDetailPage(idDokter: listDokterAPI[i]["kd_dokter"],))),
                  child: ListDokter(
                  gambar: listAsset[i],
                  nama: listDokterAPI[i]["nm_dokter"],
                  listJadwal: listDokterAPI[i]["det_dokter"],
                ),
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
    return new Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 0,
              offset: Offset(0, 0),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              nama,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            // Divider(color: Colors.grey),
          ],
        ),
        // subtitle: Padding(
        //   padding: const EdgeInsets.only(top: 10.0),
        //   child: ListView.builder(
        //     shrinkWrap: true,
        //     physics: NeverScrollableScrollPhysics(),
        //     itemCount: listJadwal.length,
        //     itemBuilder: (context, i) => Padding(
        //       padding: const EdgeInsets.all(5.0),
        //       child: Row(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         mainAxisSize: MainAxisSize.max,
        //         children: <Widget>[
        //           // Flexible(
        //           //   child: Text(
        //           //     listJadwal[i]['hari_kerja'],
        //           //     style: TextStyle(fontSize: 14.0, color: Colors.grey),
        //           //   ),
        //           // ),
        //           // Text(
        //           //   listJadwal[i]['jam_mulai'] +
        //           //       " - " +
        //           //       listJadwal[i]['jam_selesai'],
        //           //   style: TextStyle(fontSize: 14.0, color: Colors.grey),
        //           // ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        dense: true,
      ),
    );
  }
}
