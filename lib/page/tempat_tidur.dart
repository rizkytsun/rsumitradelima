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

    getData();
  }

  var listKelasTempatTidur;
  bool isLoading = true;

  getData() async {
    var list = await http.get(Uri.encodeFull('https://new-api.bpjs-kesehatan.go.id/aplicaresws/rest/bed/read/0187R010/1/100'), headers: {
      'X-cons-id':'18716' ,
      'X-timestamp':'1616477238' ,
      'X-signature':'CYgUJ2Z7DE1/vVydKu9fpv8KqSUvSL4FsKD8iNRqQiA=' ,
    });

    setState(() {
      listKelasTempatTidur = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyConstants().colorJadwalDR,
          title: Text('DAFTAR TEMPAT TIDUR'),
        ),
        backgroundColor: MyConstants().colorJadwalDR,
        body: isLoading ? Center(child: CircularProgressIndicator()) : ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: listKelasTempatTidur.length,
          itemBuilder: (context, i) => ListTempatTidur(
            kelas: listKelasTempatTidur[i]["kelas"],
            tersedia: listKelasTempatTidur[i]["tersedia"],
            total_tt: listKelasTempatTidur[i]["total_tt"],
            update: listKelasTempatTidur[i]["update"],
          ),
        ));
  }
}

class ListTempatTidur extends StatelessWidget {
  ListTempatTidur({this.kelas, this.tersedia, this.total_tt, this.update});

  final String kelas;
  final String tersedia;
  final String total_tt;
  final String update;

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
                    Text(kelas,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13.0)),
                    Text(
                      tersedia,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                  Text(total_tt),
                ]),
                Row(children: <Widget>[
                  Icon(Icons.hotel),
                  Text("Tempat Tidur Tersedia"),
                  Expanded(child: Container()),
                  Text(tersedia),
                ]),
                Row(children: <Widget>[
                  Icon(Icons.update),
                  Text("Terakhir Update"),
                  Expanded(child: Container()),
                  Flexible(child: Text(update)),
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
