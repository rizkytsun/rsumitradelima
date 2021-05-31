import 'package:rsumitradelima/components.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rsumitradelima/page/NavbarPages/admin.dart';
import 'package:rsumitradelima/page/NavbarPages/beranda.dart';
import 'package:rsumitradelima/page/NavbarPages/berita.dart';
import 'package:rsumitradelima/page/NavbarPages/kontak.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // untuk navbar
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Beranda',
      style: optionStyle,
    ),
    Text(
      'Index 1: Berita',
      style: optionStyle,
    ),
    Text(
      'Index 2: Kontak',
      style: optionStyle,
    ),
    Text(
      'Index 3: Admin',
      style: optionStyle,
    ),
  ];

  _getBody(int i) {
    switch (i) {
      case 0:
        return BerandaPage();
      case 1:
        return BeritaPage();
      case 2:
        return KontakPage();
      case 3:
        return SumberData();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstants().colorRSMDbg,
      body: _getBody(_selectedIndex),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(5),
                child: GNav(
                    gap: 5,
                    activeColor: Colors.white,
                    iconSize: 20,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    duration: Duration(milliseconds: 800),
                    tabBackgroundColor: MyConstants().colorJadwalDR,
                    tabs: [
                      GButton(
                        icon: LineAwesomeIcons.home,
                        iconSize: 20,
                        text: 'Beranda',
                      ),
                      GButton(
                        icon: LineAwesomeIcons.globe,
                        iconSize: 20,
                        text: 'Berita',
                      ),
                      GButton(
                        icon: LineAwesomeIcons.phone,
                        iconSize: 20,
                        text: 'Kontak',
                      ),
                      GButton(
                        icon: LineAwesomeIcons.key,
                        iconSize: 20,
                        text: 'Admin',
                      ),
                    ],
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    })),
          ),
        ),
      ),
    );
  }
}
