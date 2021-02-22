import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rsumitradelima/component/ContainerAndButtons.dart';
import 'package:rsumitradelima/component/Dialogs.dart';

class DokterDetailPage extends StatefulWidget {
  @override
  _DokterDetailPageState createState() => _DokterDetailPageState();
}

class _DokterDetailPageState extends State<DokterDetailPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.orange[400],
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
                          width: 100.0,
                          height: 100.0,
                          child: CircleAvatar(
                            radius: 20.0,
                            backgroundImage: NetworkImage(
                                'https://tecnobella.com/wp-content/uploads/2018/11/our-team-04.jpg'),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Megumi Kobayashi',
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  LineIcons.user,
                                  size: 15.0,
                                  color: Colors.white,
                                ),
                                Text(
                                  ' 123 Pengikut',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  LineIcons.check,
                                  size: 15.0,
                                  color: Colors.white,
                                ),
                                Text(
                                  ' Terpercaya',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
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
                        child: Text('Penilaian'),
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
                                  'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Pendidikan terakhir',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'S2-Kedokteran UB',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Spesialis',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Kucing',
                                  style: TextStyle(color: Colors.grey),
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
                                  '2 tahun',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Tertangani',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '23 hewan tertangani',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Sertifikat',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () => showDialog(
                                        barrierDismissible: true,
                                        context: context,
                                        builder: (_) => FunkyOverlay(
                                                'Halaman/fitur ini masih dalam tahap konstruksi, mohon ditunggu ya~ \n^_^)/',
                                                [
                                                  FlatButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context),
                                                      child: Text('OK'))
                                                ])),
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text('Lihat sertifikat',
                                              style: TextStyle(
                                                  color: Colors.grey)),
                                          Icon(LineIcons.chevron_circle_right,
                                              color: Colors.grey)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Penilaian rata-rata',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      LineIcons.star,
                                      color: Colors.yellow[600],
                                    ),
                                    Icon(
                                      LineIcons.star,
                                      color: Colors.yellow[600],
                                    ),
                                    Icon(
                                      LineIcons.star,
                                      color: Colors.yellow[600],
                                    ),
                                    Icon(
                                      LineIcons.star,
                                      color: Colors.yellow[600],
                                    ),
                                    Icon(
                                      LineIcons.star_half,
                                      color: Colors.yellow[600],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
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
                                backgroundImage: NetworkImage(
                                    'https://tecnobella.com/wp-content/uploads/2018/11/our-team-04.jpg'),
                              ),
                              title: Text('Shelter Kucing Aminah Malang'),
                              subtitle: Text('Dieng, Malang'),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          MyContainer(
                            width: double.infinity,
                            padding: EdgeInsets.all(10.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 20.0,
                                backgroundImage: NetworkImage(
                                    'https://tecnobella.com/wp-content/uploads/2018/11/our-team-04.jpg'),
                              ),
                              title: Text('Cattery Arjosari'),
                              subtitle: Text('Arjosari, Malang'),
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
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      LineIcons.star,
                                      color: Colors.yellow[600],
                                      size: 15.0,
                                    ),
                                    Icon(
                                      LineIcons.star,
                                      color: Colors.yellow[600],
                                      size: 15.0,
                                    ),
                                    Icon(
                                      LineIcons.star,
                                      color: Colors.yellow[600],
                                      size: 15.0,
                                    ),
                                    Icon(
                                      LineIcons.star,
                                      color: Colors.yellow[600],
                                      size: 15.0,
                                    ),
                                    Icon(
                                      LineIcons.star,
                                      color: Colors.grey,
                                      size: 15.0,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'oleh ',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      'Tsukasa Kawagoto',
                                    ),
                                    Text(
                                      ' 5 bulan lalu',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          MyContainer(
                            width: double.infinity,
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      LineIcons.star,
                                      color: Colors.yellow[600],
                                      size: 15.0,
                                    ),
                                    Icon(
                                      LineIcons.star,
                                      color: Colors.yellow[600],
                                      size: 15.0,
                                    ),
                                    Icon(
                                      LineIcons.star,
                                      color: Colors.yellow[600],
                                      size: 15.0,
                                    ),
                                    Icon(
                                      LineIcons.star,
                                      color: Colors.grey,
                                      size: 15.0,
                                    ),
                                    Icon(
                                      LineIcons.star,
                                      color: Colors.grey,
                                      size: 15.0,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'oleh ',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      'Willer Gross',
                                    ),
                                    Text(
                                      ' 1 bulan lalu',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          MyContainer(
                            width: double.infinity,
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      LineIcons.star,
                                      color: Colors.yellow[600],
                                      size: 15.0,
                                    ),
                                    Icon(
                                      LineIcons.star,
                                      color: Colors.yellow[600],
                                      size: 15.0,
                                    ),
                                    Icon(
                                      LineIcons.star,
                                      color: Colors.yellow[600],
                                      size: 15.0,
                                    ),
                                    Icon(
                                      LineIcons.star,
                                      color: Colors.yellow[600],
                                      size: 15.0,
                                    ),
                                    Icon(
                                      LineIcons.star,
                                      color: Colors.grey,
                                      size: 15.0,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'oleh ',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      'Ahmad Bahrudin',
                                    ),
                                    Text(
                                      ' 2 minggu lalu',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                  style: TextStyle(color: Colors.grey),
                                ),
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
                        color: Colors.orange[400],
                        onPressed: () => showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (_) => FunkyOverlay(
                                    'Halaman/fitur ini masih dalam tahap konstruksi, mohon ditunggu ya~ \n^_^)/',
                                    [
                                      FlatButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text('OK'))
                                    ])),
                        child: Text('Chat Dokter',
                            style: TextStyle(color: Colors.white)))),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: FlatButton(
                        color: Colors.orange[400],
                        onPressed: () => showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (_) => FunkyOverlay(
                                    'Halaman/fitur ini masih dalam tahap konstruksi, mohon ditunggu ya~ \n^_^)/',
                                    [
                                      FlatButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text('OK'))
                                    ])),
                        child: Text('Pemesanan',
                            style: TextStyle(color: Colors.white)))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
