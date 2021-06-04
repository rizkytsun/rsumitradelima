import 'package:flutter/material.dart';
import 'package:rsumitradelima/main.dart';
import 'package:rsumitradelima/page/daftarPoli.dart';
import 'package:rsumitradelima/page/webView/halamanJurnal.dart';
import 'package:rsumitradelima/page/webView/halamanKritik.dart';
import 'package:rsumitradelima/page/webView/halamanKuisioner.dart';
import 'package:rsumitradelima/page/webView/halamanPendaftaran.dart';
import 'package:rsumitradelima/page/kuisioner.dart';
import 'package:rsumitradelima/page/tempat_tidur.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rsumitradelima/components.dart';
import '../menuDaftarOnline.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BerandaPage extends StatefulWidget {
  @override
  _BerandaPageState createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  static final List<String> imgSlider = [
    'assets/berita/igd.jpeg'
        'assets/timeline.png'
  ];
  static int timelinePage = 1;

  final PageController controller = PageController(
    initialPage: timelinePage,
  );

  static int beritaPage = 1;

  final PageController controller2 = PageController(
    initialPage: beritaPage,
  );

  get callbackFunction => null;

  _launchWebApp() async {
    const url = 'https://wa.me/6281217442444?text=DAFTARPOLI';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchWA_Hotline() async {
    const url = 'https://wa.me/%3C6281340001415%3E';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchMail_Humar() async {
    const url = 'mailto:rsumitradelimahumar@gmail.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchMaps() async {
    const url = 'https://goo.gl/maps/VSq3rNQtqHZRBtLy9';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchJurnal() async {
    const url =
        'http://www.rsumitradelima.com/#cbp=http://www.rsumitradelima.com/index.php/Tampil/tampebook';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Home AppBar
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: MyConstants().colorJadwalDR,
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(0.0))),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(1.0),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Image.asset(
                  //   'assets/header.png',
                  //   width: (MediaQuery.of(context).size.width / 1) - 2.0,
                  // ),
                  // Text(
                  //   " RSU MITRA DELIMA",
                  //   style:
                  //       TextStyle(fontSize: 30, fontFamily: 'BauhausReguler'),
                  // )
                ],
              )),
            ),
          ),
        ),

        // Content Timeline
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  color: MyConstants().colorJadwalDR,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.notifications_none,
                                color: Colors.white,
                                size: 25,
                              ),
                              onPressed: () {},
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: MyConstants().colorRSMDbg,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 8.0),
                                child: Text(
                                  'TIMELINE',
                                  style: TextStyle(
                                    color: MyConstants().colorJadwalDR,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.info_outline,
                                color: Colors.white,
                                size: 25,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CarouselSlider(
                          options: CarouselOptions(
                            height: 250,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 1000),
                            viewportFraction: 0.6,
                            initialPage: 5,
                          ),
                          items: [
                            // "assets/timeline.png",
                            // "assets/timeline.png",
                            // "assets/timeline.png",
                            // "assets/timeline.png",
                            // "assets/timeline.png",
                            "http://www.rsumitradelima.com/assets/timeline/gratis_bayi.png",
                            "http://www.rsumitradelima.com/assets/timeline/WhatsApp_Image_2021-05-19_at_07_53_43.jpeg",
                            "http://www.rsumitradelima.com/assets/timeline/WhatsApp_Image_2021-05-21_at_07_37_59.jpeg",
                          ].map((i) {
                            return Builder(builder: (BuildContext context) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: DecorationImage(
                                    image: NetworkImage(i),
                                  ),
                                ),
                              );
                            });
                          }).toList()),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(), // TODO Dots Indicator
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 35.0,
                        decoration: BoxDecoration(
                            color: MyConstants().colorRSMDbg,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30.0))),
                      )
                    ],
                  ),
                ),
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MyConstants().colorRSMDbg,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20.0)),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ButtonKotakHome(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ListMenuDaftarOnline())),
                              // builder: (_) => HalamanUtama(
                              //     selectedUrl:
                              //         "http://rsumitradelima.com:8080/webapps/epasien/login.php"))),
                              assetKeSvg: 'assets/home/pendaftaran.svg',
                              text: 'Pendaftaran Online',
                            ),
                            ButtonKotakHome(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => DaftarPoliklinik()),
                              ),
                              assetKeSvg: 'assets/home/jadwal-dokter.svg',
                              text: 'Daftar Poliklinik',
                            ),
                            ButtonKotakHome(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => TempatTidur()),
                              ),
                              assetKeSvg: 'assets/home/tempat-tidur.svg',
                              text: 'Ketersediaan Kamar',
                            ),
                            ButtonKotakHome(
                              assetKeSvg: 'assets/home/health-check.svg',
                              text: 'Periksa Mandiri',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              ButtonKotakHome(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => HalamanKuisioner(
                                            selectedUrl:
                                                "https://docs.google.com/forms/d/e/1FAIpQLSfzGqp_Ji1faeTCuGeMIb8C95CbREFQrau1J7pvCG3tJlS7NQ/viewform?usp=sf_link"))),
                                assetKeSvg: 'assets/home/rating.svg',
                                text: 'Kuisioner Rawat Inap',
                              ),
                              ButtonKotakHome(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => HalamanKritik(
                                            selectedUrl:
                                                "https://docs.google.com/forms/d/e/1FAIpQLScbi1HxOjwlLmYIu4kLhQ0qQj_PTtkJh0vxvEEnctV27mMg8A/viewform?usp=sf_link"))),
                                assetKeSvg: 'assets/home/email.svg',
                                text: 'Kritik dan Saran',
                              ),
                              ButtonKotakHome(
                                onTap: () => _launchMaps(),
                                assetKeSvg: 'assets/home/rate.svg',
                                text: 'Rate Kepuasan',
                              ),
                              ButtonKotakHome(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => HalamanJurnal(
                                            selectedUrl:
                                                "http://www.rsumitradelima.com/index.php/jurnal"))),
                                assetKeSvg: 'assets/home/library.svg',
                                text: 'Elektronik Jurnal',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ButtonKotakHome extends StatelessWidget {
  ButtonKotakHome({this.onTap, this.assetKeSvg, this.text});

  final VoidCallback onTap;
  final String assetKeSvg;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ]),
      width: MediaQuery.of(context).size.width / 4 - 15.0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    child: SvgPicture.asset(
                  assetKeSvg,
                  width: (MediaQuery.of(context).size.width / 4) - 10.0 - 30.0,
                )),
                SizedBox(
                  height: 5,
                ),
                Flexible(
                    child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
