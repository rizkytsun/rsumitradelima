import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rsumitradelima/components.dart';
import 'package:rsumitradelima/page/webView/halamanPendaftaran.dart';
import 'package:url_launcher/url_launcher.dart';

class ListMenuDaftarOnline extends StatefulWidget {
  @override
  _ListMenuDaftarOnlineState createState() => _ListMenuDaftarOnlineState();
}

_launchWebApp() async {
  const url = 'https://wa.me/6281217442444?text=DAFTARPOLI';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class _ListMenuDaftarOnlineState extends State<ListMenuDaftarOnline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstants().colorJadwalDR,
        title: Text('LIST PENDAFTARAN ONLINE'),
      ),
      backgroundColor: MyConstants().colorRSMDbg,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonKotakDaftar(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => HalamanPendaftaran(
                                selectedUrl:
                                    "http://rsumitradelima.com:8080/webapps/epasien/login.php"))),
                    assetKeSvg: 'assets/home/www.svg',
                    text: 'DAFTAR VIA WEBSITE',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () => _launchWebApp(),
                    child: ButtonKotakDaftar(
                      assetKeSvg: 'assets/home/whatsapp.svg',
                      text: 'DAFTAR VIA WHATSAPP',
                    ),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}

class ButtonKotakDaftar extends StatelessWidget {
  ButtonKotakDaftar({this.onTap, this.assetKeSvg, this.text});

  final VoidCallback onTap;
  final String assetKeSvg;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      width: MediaQuery.of(context).size.width / 1 - 15.0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    child: SvgPicture.asset(
                  assetKeSvg,
                  width: (MediaQuery.of(context).size.width / 4) - 15.0 - 15.0,
                )),
                SizedBox(
                  height: 35,
                ),
                Flexible(
                    child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
