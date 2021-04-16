import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:rsumitradelima/components.dart';

class TempatTidur extends StatefulWidget {
  @override
  _TempatTidurState createState() => _TempatTidurState();
}

class _TempatTidurState extends State<TempatTidur> {
  @override
  void initState() {
    super.initState();

    getAPIaccess();
    // getData();
  }

  var listKelasTempatTidur;
  bool isLoading = true;

  String timestamp;
  String signature;

  Future getAPIaccess() async {
    final String url = 'http://rsumitradelima.com/signature.php';
    var response = await http
        .get(Uri.encodeFull(url), headers: {'accept': 'application/json'});

    if (response.statusCode == 200 || response.statusCode == 404) {
      var data = json.decode(response.body);
      timestamp = data["X-timestamp"];
      signature = data["X-signature"];

      getData();
    } else {
      return {
        'result': false,
        'data': 'Terjadi kesalahan | -> getData <-',
      };
    }
    // print(signature);
  }

  getData() async {
    var list = await http.get(
        Uri.encodeFull(
            'https://new-api.bpjs-kesehatan.go.id/aplicaresws/rest/bed/read/0187R010/1/100'),
        headers: {
          'X-cons-id': '18716',
          'X-timestamp': timestamp,
          'X-signature': signature,
          // 'X-timestamp': '1616766605',
          // 'X-signature': 'cgUpk9g6bO0Ua7fTMQGftM2gP4pyF75EVGmBg9AEU3U=',
        });

    var responseBody;
    var data;

    setState(() {
      responseBody = json.decode(list.body);
      // print(responseBody);
      data = responseBody["response"];
      listKelasTempatTidur = data["list"];

      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyConstants().colorJadwalDR,
          title: Text('KETERSEDIAAN KAMAR'),
        ),
        backgroundColor: MyConstants().colorJadwalDR,
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                backgroundColor: Colors.redAccent,
                valueColor: AlwaysStoppedAnimation(Colors.green),
              ))
            : ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: listKelasTempatTidur.length,
                itemBuilder: (context, i) => ListTempatTidur(
                  namakelas: listKelasTempatTidur[i]["namakelas"],
                  tersedia: listKelasTempatTidur[i]["tersedia"],
                  kapasitas: listKelasTempatTidur[i]["kapasitas"],
                  lastupdate: listKelasTempatTidur[i]["lastupdate"],
                  namaruang: listKelasTempatTidur[i]["namaruang"],
                ),
              ));
  }
}

class ListTempatTidur extends StatelessWidget {
  ListTempatTidur(
      {this.namakelas,
      this.tersedia,
      this.kapasitas,
      this.lastupdate,
      this.namaruang});

  final String namakelas;
  final int tersedia;
  final int kapasitas;
  final String lastupdate;
  final String namaruang;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 2),
                )
              ]),
          padding: EdgeInsets.all(10.0),
          child: Row(children: <Widget>[
            Container(
                width: 85.0,
                height: 85.0,
                decoration: BoxDecoration(
                  color: Colors.teal[300],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Text(ListTempatTidur[0]['namakelas'],
                    Text(namakelas,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13.0)),
                    // Text(kelas,
                    //     textAlign: TextAlign.center,
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.bold, fontSize: 13.0)),
                    Text(
                      namaruang.toString(),
                      // ListTempatTidur[0]['tersedia'],
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(children: <Widget>[
                Row(children: <Widget>[
                  Icon(Icons.check),
                  Text("Total tempat tidur"),
                  Expanded(child: Container()),
                  Text(
                    kapasitas.toString(),
                    // ListTempatTidur[0]['kapasitas'],
                  )
                ]),
                Row(children: <Widget>[
                  Icon(Icons.hotel),
                  Text("Tempat Tidur Tersedia"),
                  Expanded(child: Container()),
                  Text(
                    tersedia.toString(),
                    // ListTempatTidur[0]['tersedia'],
                  )
                ]),
                Row(children: <Widget>[
                  Icon(Icons.update),
                  Text("Terakhir Update"),
                  Expanded(child: Container()),
                  Flexible(
                    child: Text(
                      lastupdate, style: TextStyle(fontSize: 10),
                      // ListTempatTidur[0]['lastupdate'],
                    ),
                  )
                ]),
              ]),
            ))
          ]),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }
}
