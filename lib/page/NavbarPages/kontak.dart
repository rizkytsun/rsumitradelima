import 'package:flutter/material.dart';
import 'package:rsumitradelima/components.dart';

class KontakPage extends StatefulWidget {
  @override
  _KontakPageState createState() => _KontakPageState();
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
          ListKontak(
            iconkiri: "assets/kontak/map.png",
            text: "Alamat",
            subtitle: "Jl. Raya Bulupayung No.1B, Bulupayung, Krebet, Kec. Bululawang, Malang, Jawa Timur 65171",
            iconkanan: "assets/kontak/pin.png",
          ),
          ListKontak(
            iconkiri: "assets/kontak/information.png",
            text: "Informasi",
            subtitle: "+62 812-1744-2444 / (0341) 805183",
            iconkanan: "assets/kontak/call.png",
          ),
          ListKontak(
            iconkiri: "assets/kontak/ambulance.png",
            text: "Ambulan Gawat Darurat",
            subtitle: "+62 813-3369-9616",
            iconkanan: "assets/kontak/call.png",
          ),
          ListKontak(
            iconkiri: "assets/kontak/email.png",
            text: "Humas dan Marketing",
            subtitle: "rsumitradelimahumar@gmail.com",
            iconkanan: "assets/kontak/email2.png",
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
          leading: CircleAvatar(
                backgroundImage: AssetImage(iconkiri)),
          title: Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),), 
          subtitle: Text(subtitle, style: TextStyle(fontSize: 12),),
          dense: true,
          trailing: Image.asset(iconkanan, height: 20, width: 20,),
        ),
        
      ),
    );
  }
}
