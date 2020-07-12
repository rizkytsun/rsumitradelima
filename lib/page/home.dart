import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:rsumitradelima/components.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rsumitradelima/page/NavbarPages/beranda.dart';
import 'package:rsumitradelima/page/NavbarPages/berita.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
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
      'Index 3: Tentang',
      style: optionStyle,
    ),
  ];

  _getBody(int i) {
    switch (i) {
      case 0: return BerandaPage();
      case 1: return BeritaPage();
        
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstants().colorBPJSbg,
      body: _getBody(_selectedIndex) ,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: GNav(
                  gap: 8,
                  activeColor: Colors.white,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  duration: Duration(milliseconds: 800),
                  tabBackgroundColor: Colors.grey[800],
                  tabs: [
                    GButton(
                      icon: LineAwesomeIcons.home,
                      text: 'Beranda',
                    ),
                    GButton(
                      icon: LineAwesomeIcons.globe,
                      text: 'Berita',
                    ),
                    GButton(
                      icon: LineAwesomeIcons.phone,
                      text: 'Kontak',
                    ),
                    GButton(
                      icon: LineAwesomeIcons.user,
                      text: 'Profil',
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
