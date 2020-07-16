import 'package:flutter/material.dart';
import 'package:rsumitradelima/page/jadwal_dokter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BerandaPage extends StatefulWidget {
  @override
  _BerandaPageState createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {

static int timelinePage = 1;

  final PageController controller = PageController(
    initialPage: timelinePage,
  );

  static int beritaPage = 1;

  final PageController controller2 = PageController(
    initialPage: beritaPage,
  );

    _launchURL() async {
    const url = 'http://rsumitradelima.com:85/webapps/pendaftaran/login.php';
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
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(35.0))
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Center(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/rsmd_logo.png', width: (MediaQuery.of(context).size.width / 5) - 35.0,),
                    Text(" RSU MITRA DELIMA", style: TextStyle(fontSize: 15, fontFamily: 'BauhausReguler'),)
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                    child: Text('TimeLine', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200.0,
                          child: PageView.builder(
                            controller: controller,
                            onPageChanged: (index) => setState(() => timelinePage = index + 1),
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.0),
                                child: Image.asset('assets/timeline.png', width: double.infinity,),
                              );
                            },
                            physics: BouncingScrollPhysics(),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(5.0), child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 10.0,
                              height: 10.0,
                              decoration: BoxDecoration(
                                color: timelinePage == 1 ? Colors.grey[700] : Colors.grey,
                                borderRadius: BorderRadius.circular(5)
                              ),
                            ),SizedBox(width: 20.0,),
                            Container(
                              width: 10.0,
                              height: 10.0,
                              decoration: BoxDecoration(
                                color: timelinePage == 2 ? Colors.grey[700] : Colors.grey,
                                borderRadius: BorderRadius.circular(5)
                              ),
                            ),SizedBox(width: 20.0,),
                            Container(
                              width: 10.0,
                              height: 10.0,
                              decoration: BoxDecoration(
                                color: timelinePage == 3 ? Colors.grey[700] : Colors.grey,
                                borderRadius: BorderRadius.circular(5)
                              ),
                            ),
                          ],
                        ),)
                      ],
                    ),
                  ),

                  SizedBox(height: 20,),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: () => _launchURL(),
                      child: ButtonKotakHome(assetKeSvg: 'assets/home/pendaftaran.svg', text: 'Pendaftaran Online',)
                    ),
                    InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => JadwalDokter()),),
                      child: ButtonKotakHome(assetKeSvg: 'assets/home/jadwal-dokter.svg', text: 'Jadwal Dokter',)
                    ),
                    ButtonKotakHome(assetKeSvg: 'assets/home/tempat-tidur.svg', text: 'Tempat Tidur',),
                    ButtonKotakHome(assetKeSvg: 'assets/home/bantuan-layanan.svg', text: 'Bantuan Layanan',),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}


class ButtonKotakHome extends StatelessWidget {
  ButtonKotakHome({
    this.assetKeSvg, this.text
  });

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
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 4,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]
      ),
      width: MediaQuery.of(context).size.width / 4 - 10.0,
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(child: SvgPicture.asset(assetKeSvg, 
            width: MediaQuery.of(context).size.width / 4 - 50.0,
              )),


        SizedBox(height: 10,),
          Flexible(child: Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold ),)),
        ],
      ),
    );
  }
}