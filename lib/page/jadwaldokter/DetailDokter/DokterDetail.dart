import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rsumitradelima/component/ContainerAndButtons.dart';
import 'package:rsumitradelima/component/Dialogs.dart';
import 'package:http/http.dart' as http;
import 'package:rsumitradelima/page/menuDaftarOnline.dart';
import 'package:url_launcher/url_launcher.dart';

class DokterDetailPage extends StatefulWidget {

  DokterDetailPage({this.idDokter});

  final String idDokter;

  @override
  _DokterDetailPageState createState() => _DokterDetailPageState();
}

class _DokterDetailPageState extends State<DokterDetailPage>
    with SingleTickerProviderStateMixin {
      
  TabController _tabController;

  getDataDokter() {
    Map<String, String> qParams = {
     'kd_dokter': widget.idDokter,
    };
  }

  @override
  void initState() {
    super.initState();
    getAPIaccess();
    _tabController = TabController(length: 3, vsync: this);
  }

  var data;
  bool isLoadingData = true;
  bool isData = false;

  var listDokterAPI;

  Future getAPIaccess() async {
    final String url = 'http://rsumitradelima.com:8080/api-rsmd/index.php/dokter?fungsi=6&kd_dokter='+widget.idDokter;
    var result = await http
        .get(Uri.encodeFull(url), headers: {'accept': 'application/json'});

    setState(() {
      if (result.statusCode == 200) {
        var content = json.decode(result.body);
        if (content['status'] == 'sukses') {
          listDokterAPI = content['data'];
          isData = true;
          print(listDokterAPI);
        }
      }
      isLoadingData = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  
  _launchWebApp() async {
    const url = 'https://wa.me/6281217442444?text=awal';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: MyConstants2().colorJadwalDR,
            child: Material(
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  SafeArea(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // Search Bar
                        Container(
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  LineIcons.arrow_left,
                                  color: Colors.white,
                                ),
                                onPressed: () => Navigator.pop(context),
                                splashColor: Colors.black26,
                                focusColor: Colors.black38,
                                highlightColor: Colors.black12,
                              ),
                              Text(
                                'Kembali',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),

                        //Actions Bar
                        Row(
                          children: <Widget>[
                            Icon(
                              LineIcons.share,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Icon(
                              LineIcons.ellipsis_v,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage('assets/rsmd_logo.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Flexible(
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                              isLoadingData
                                  ? 'Sedang Memuat...'
                                  : listDokterAPI[0]["nm_dokter"],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                                ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    LineIcons.map_marker,
                                    size: 15.0,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    ' Malang',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.white,
                    labelColor: Colors.white,
                    tabs: <Widget>[
                      Tab(
                        child: Text('Informasi'),
                      ),
                      Tab(
                        child: Text('Afiliasi'),
                      ),
                      Tab(
                        child: Text('Jadwal Praktik'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                controller: _tabController,
                children: <Widget>[
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'Profil',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          MyContainer(
                            width: double.infinity,
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Tentang dokter',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  isLoadingData ? 'Sedang Memuat...' : listDokterAPI[0]["tentang"] == null ? " - " : listDokterAPI[0]["tentang"],
                                  style: TextStyle(
                                    color: Colors.grey
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Pendidikan Terakhir',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  isLoadingData ? 'Sedang Memuat...' : listDokterAPI[0]["pendidikan"] == null ? " - " : listDokterAPI[0]["pendidikan"],
                                  style: TextStyle(
                                    color: Colors.grey
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Spesialis',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  isLoadingData ? 'Sedang Memuat...' : listDokterAPI[0]["pendidikan"]  == null ? " - " : listDokterAPI[0]["pendidikan"],
                                  style: TextStyle(
                                    color: Colors.grey
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'Catatan pelayanan',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          MyContainer(
                            width: double.infinity,
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Pengalaman',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  isLoadingData ? 'Sedang Memuat...' : listDokterAPI[0]["lama_kerja"]  == null ? " - " : listDokterAPI[0]["lama_kerja"],
                                  style: TextStyle(
                                    color: Colors.grey
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Pasien Tertangani',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  isLoadingData ? 'Sedang Memuat...' : listDokterAPI[0]["jml_pasien"]  == null ? " - " : listDokterAPI[0]["jml_pasien"],
                                  style: TextStyle(
                                    color: Colors.grey
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Surat Izin Prakter',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  isLoadingData ? 'Sedang Memuat...' : listDokterAPI[0]["no_ijn_praktek"]  == null ? " - " : listDokterAPI[0]["no_ijn_praktek"],
                                  style: TextStyle(
                                    color: Colors.grey
                                  ),
                                ),
                                // Material(
                                //   color: Colors.transparent,
                                //   child: InkWell(
                                //     onTap: () => showDialog(
                                //         barrierDismissible: true,
                                //         context: context,
                                //         builder: (_) => FunkyOverlay(
                                //                 'Halaman/fitur ini masih dalam tahap konstruksi, mohon ditunggu ya~ \n^_^)/',
                                //                 [
                                //                   FlatButton(
                                //                       onPressed: () =>
                                //                           Navigator.pop(
                                //                               context),
                                //                       child: Text('OK'))
                                //                 ])),
                                //     child: Padding(
                                //       padding: EdgeInsets.all(5.0),
                                //       child: Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceBetween,
                                //         children: <Widget>[
                                //           Text('Lihat Surat Izin Prakter',
                                //               style: TextStyle(
                                //                   color: Colors.grey)),
                                //           Icon(LineIcons.chevron_circle_right,
                                //               color: Colors.grey)
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 15.0,
                          ),
                          MyContainer(
                            width: double.infinity,
                            padding: EdgeInsets.all(10.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 20.0,
                                backgroundImage:
                                    AssetImage('assets/rsmd_logo.png'),
                              ),
                              title: Text('RSU Mitra Delima'),
                              subtitle:
                                  Text('Jl. Raya Bulupayung 1B Krebet, Kecamatan Bululawang, Kabupaten Malang'),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Scaffold(
                    body: isLoadingData
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: listDokterAPI.length,
                            itemBuilder: (context, i) => ListDokter(
                              nama: listDokterAPI[i]["nm_dokter"],
                              listJadwal: listDokterAPI[i]["det_dokter"],
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                        width: 1,
                        color: Colors.grey[350],
                        style: BorderStyle.solid))),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: FlatButton(
                        color: MyConstants2().colorJadwalDR,
                        onPressed: () => _launchWebApp(),
                        child: Text('Hubungi Informasi',
                            style: TextStyle(color: Colors.white)))),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: FlatButton(
                        color: MyConstants2().colorJadwalDR,
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ListMenuDaftarOnline())),
                        
                        // showDialog(
                        //     barrierDismissible: true,
                        //     context: context,
                        //     builder: (_) => FunkyOverlay(
                        //             'Halaman/fitur ini masih dalam tahap konstruksi, mohon ditunggu ya~ \n^_^)/',
                        //             [
                        //               FlatButton(
                        //                   onPressed: () =>
                        //                       Navigator.pop(context),
                        //                   child: Text('OK'))
                        //             ])),

                        child: Text('Daftar Poliklinik',
                            style: TextStyle(color: Colors.white)))),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ListDokter extends StatelessWidget {
  ListDokter({this.nama, this.listJadwal});

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
