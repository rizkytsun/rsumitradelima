import 'package:flutter/material.dart';
import 'package:rsumitradelima/components.dart';

class KuisionerPasien extends StatefulWidget {
  @override
  _KuisionerPasienState createState() => _KuisionerPasienState();
}

class _KuisionerPasienState extends State<KuisionerPasien> {
  String dropdownValue = 'Rawat Inap';
  String dropdownValue1 = 'Anggrek';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstants().colorJadwalDR,
        title: Text("Kuisioner Pasien"),
      ),
      backgroundColor: MyConstants().colorJadwalDR,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "1. DATA PENGISI KUISIONER",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      color: Colors.grey[600],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Nama Anda",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue[200],
                              fontSize: 17,
                              fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black87)),
                            prefixIcon: Icon(
                              Icons.person,
                              size: 30,
                            ),
                            hintText: "Masukkan Nama Anda",
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: "Nama Anda",
                            labelStyle: TextStyle(color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Nomor Rekam Medis",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue[200],
                              fontSize: 17,
                              fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black87)),
                            prefixIcon: Icon(
                              Icons.list,
                              size: 30,
                            ),
                            hintText: "Masukkan No RM",
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: "Nomor Rekam Medis",
                            labelStyle: TextStyle(color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Alamat",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue[200],
                              fontSize: 17,
                              fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black87)),
                            prefixIcon: Icon(
                              Icons.home,
                              size: 30,
                            ),
                            hintText: "Masukkan Alamat",
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: "Alamat Lengkap",
                            labelStyle: TextStyle(color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Nomor Telepon",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue[200],
                              fontSize: 17,
                              fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black87)),
                            prefixIcon: Icon(
                              Icons.call,
                              size: 30,
                            ),
                            hintText: "Masukkan No Telepon",
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: "Nomor Telepon",
                            labelStyle: TextStyle(color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Jenis Pelayanan",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.lightBlue[200],
                                fontSize: 17,
                                fontStyle: FontStyle.italic),
                          ),
                          // ignore: missing_required_param
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.grey),
                          underline: Container(
                            height: 2,
                            color: Colors.grey,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>['Rawat Inap', 'Rawat Jalan']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    Divider(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Unit Perawatan",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue[200],
                              fontSize: 17,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        DropdownButton<String>(
                          value: dropdownValue1,
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.grey),
                          underline: Container(
                            height: 2,
                            color: Colors.grey,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue1 = newValue;
                            });
                          },
                          items: <String>[
                            'Anggrek',
                            'Bougenville',
                            'Cempaka',
                            'Mawar',
                            'Tulip',
                            'Kamar Bersalin',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ]),
                )),
          )
        ],
      ),
    );
  }
}
