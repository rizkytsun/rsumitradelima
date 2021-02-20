import 'package:flutter/material.dart';

//Constants
class MyConstants {
  final Color colorRSMDblue = Color(0xFF284b8c);
  final Color colorRSMDgreen = Color(0xFF00a859);
  final Color colorRSMDbg = Color(0xFFd7d7f4);
  final Color colorJadwalDR = Color(0xFF8DD1EA);
  final Color colorBeranda = Color(0xFFA15757);
}

class MyAppBar extends StatelessWidget {
  MyAppBar({@required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
            // IconButton(
            //   icon: Icon(LineAwesomeIcons.angle_left),
            //   onPressed: () => Navigator.pop(context),
            // ),
            Text(title)
          ],
        ),
      ),
    );
  }
}

// Button dengan background color
// Panjang button langsung menyesuaikan/full

class MyButton extends StatelessWidget {
  MyButton({
    @required this.onTap,
    @required this.fullRounded,
    @required this.color,
    @required this.text,
  });

  final VoidCallback onTap;
  final bool fullRounded;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(fullRounded ? 35.0 : 15.0),
        color: color,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(fullRounded ? 35.0 : 15.0),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Container
// Panjang container langsung menyesuaikan/full

class MyContainer extends StatelessWidget {
  MyContainer({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(15.0),
      child: child != null ? child : null,
    );
  }
}

// Bigunakan untuk meng-aktivasi dropdown
// Panjang button langsung menyesuaikan/full

class MyActionButton extends StatelessWidget {
  MyActionButton({this.text, this.onTap, this.icon});

  final String text;
  final VoidCallback onTap;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.0),
        color: Colors.grey[200],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(35.0),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                    child: Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                )),
                icon,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Digunakan untuk form saat login
// Panjang text field langsung menyesuaikan/full

class MyTextField extends StatelessWidget {
  MyTextField({this.controller, this.labelText});

  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            color: MyConstants().colorRSMDblue,
            height: double.infinity,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: InputBorder.none, labelText: labelText),
            ),
          )
        ],
      ),
    );
  }
}
