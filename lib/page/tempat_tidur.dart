import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rsumitradelima/components.dart';

class TempatTidur extends StatefulWidget {
  @override
  _TempatTidurState createState() => _TempatTidurState();
}

class _TempatTidurState extends State<TempatTidur> {
  var listKelasTempatTidur = [
    {
      "kelas": "VIP",
      "tersedia": "5",
      "total_tt": "10",
      "update": "12-03-2021 12:50",
    },
    {
      "kelas": "KELAS 1",
      "tersedia": "2",
      "total_tt": "10",
      "update": "12-03-2021 12:50",
    },
    {
      "kelas": "KELAS 2",
      "tersedia": "10",
      "total_tt": "10",
      "update": "12-03-2021 12:50",
    },
    {
      "kelas": "KELAS 3",
      "tersedia": "4",
      "total_tt": "10",
      "update": "12-03-2021 12:50",
    },
    {
      "kelas": "RUANG BERSALIN",
      "tersedia": "5",
      "total_tt": "10",
      "update": "12-03-2021 12:50",
    },
    {
      "kelas": "RUANG ISOLASI",
      "tersedia": "5",
      "total_tt": "10",
      "update": "12-03-2021 12:50",
    },
  ];

  get http => null;

  Future<Album> fetchAlbum() async {
      final response = await http.get(
        'https://new-api.bpjs-kesehatan.go.id/aplicaresws/rest/bed/read/0187R010/1/100',
        headers: {HttpHeaders.authorizationHeader: "Nhtin37dTtfgoYcoZLXIgQ1OySVk55USRW/C06azVV0="},
      );
      final responseJson = jsonDecode(response.body);
    
      return Album.fromJson(responseJson);
        }
        
        class Album {
          final int userId;
          final int id;
          final String title;
        
          Album({this.userId, this.id, this.title});
        
          factory Album.fromJson(Map<String, dynamic> json) {
            return Album(
              userId: json['userId'],
              id: json['id'],
              title: json['title'],
            );
          }
        }
        
        
          @override
          Widget build(BuildContext context) {
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: MyConstants().colorJadwalDR,
                  title: Text('Tempat Tidur'),
                ),
                backgroundColor: MyConstants().colorJadwalDR,
                body: ListView.builder(
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
  
  mixin Album {
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
