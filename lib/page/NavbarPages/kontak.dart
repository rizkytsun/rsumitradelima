import 'package:flutter/material.dart';
import 'package:rsumitradelima/components.dart';
import 'package:url_launcher/url_launcher.dart';

class KontakPage extends StatefulWidget {
  @override
  _KontakPageState createState() => _KontakPageState();
}

_launchWebApp() async {
  const url = 'https://wa.me/6281217442444?text=DAFTARPOLI';
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

_launchMail_Humar() async {
  const url = 'mailto:rsumitradelimahumar@gmail.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launcWebsite() async {
  const url = 'http://rsumitradelima.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launcIG() async {
  const url = 'https://www.instagram.com/rsu_mitra_delima/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launcFB() async {
  const url =
      'https://www.facebook.com/pages/category/Hospital/RSU-Mitra-Delima-1125061737656176/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class _KontakPageState extends State<KontakPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstants().colorJadwalDR,
        title: Text("KONTAK"),
      ),
      backgroundColor: MyConstants().colorJadwalDR,
      body: ListView(
        children: <Widget>[
          InkWell(
            onTap: () => _launchMaps(),
            child: ListKontak(
              iconkiri: "assets/kontak/map.png",
              text: "Alamat",
              subtitle:
                  "Jl. Raya Bulupayung No.1B, Bulupayung, Krebet, Kec. Bululawang, Malang, Jawa Timur 65171",
              iconkanan: "assets/kontak/pin.png",
            ),
          ),
          InkWell(
            onTap: () => _launchWebApp(),
            child: ListKontak(
              iconkiri: "assets/kontak/information.png",
              text: "Informasi",
              subtitle: "+62 812-1744-2444 / (0341) 805183",
              iconkanan: "assets/kontak/call.png",
            ),
          ),
          ListKontak(
            iconkiri: "assets/kontak/ambulance.png",
            text: "Ambulan Gawat Darurat",
            subtitle: "+62 813-3369-9616",
            iconkanan: "assets/kontak/call.png",
          ),
          InkWell(
            onTap: () => _launchMail_Humar(),
            child: ListKontak(
              iconkiri: "assets/kontak/email.png",
              text: "Humas dan Marketing",
              subtitle: "rsumitradelimahumar@gmail.com",
              iconkanan: "assets/kontak/email2.png",
            ),
          ),
          InkWell(
            onTap: () => _launcIG(),
            child: ListKontak(
              iconkiri: "assets/kontak/ig.png",
              text: "Instagram",
              subtitle: "@rsu_mitra_delima",
              iconkanan: "assets/kontak/ig1.png",
            ),
          ),
          InkWell(
            onTap: () => _launcFB(),
            child: ListKontak(
              iconkiri: "assets/kontak/fb.png",
              text: "Facebook",
              subtitle: "RSU Mitra Delima",
              iconkanan: "assets/kontak/fb1.png",
            ),
          ),
          InkWell(
            onTap: () => _launcWebsite(),
            child: ListKontak(
              iconkiri: "assets/kontak/web.png",
              text: "Website",
              subtitle: "RSU Mitra Delima",
              iconkanan: "assets/kontak/web1.png",
            ),
          ),
        ],
      ),
    );
  }
}

class ListKontak extends StatelessWidget {
  ListKontak({this.iconkiri, this.text, this.subtitle, this.iconkanan});

  final String iconkiri;
  final String text;
  final String subtitle;
  final String iconkanan;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage(iconkiri)),
          title: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(fontSize: 12),
          ),
          dense: true,
          trailing: Image.asset(
            iconkanan,
            height: 20,
            width: 20,
          ),
        ),
        padding: EdgeInsets.all(5),
      ),
    );
  }
}
