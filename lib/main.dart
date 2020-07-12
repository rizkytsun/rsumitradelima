import 'package:rsumitradelima/page/home.dart';
import 'package:rsumitradelima/components.dart';
import 'package:flutter/material.dart';

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
      home: Login(

      ),
    );
  }
}

  class Login extends StatefulWidget {
    @override
    _LoginState createState() => _LoginState();
  }
  
  class _LoginState extends State<Login> {
    @override
    Widget build(BuildContext context) {
      return Scaffold( backgroundColor: Color(0xFFd7d7f4),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(child: Image.asset('assets/rsmd_logo.png', width: (MediaQuery.of(context).size.width / 3 ) - 25.0,)),
                      Align(
                        alignment: Alignment.center,
                        child: Text("RSU MITRA DELIMA", style: TextStyle(fontSize: 35, fontFamily: 'BauhausReguler'),),
                      ),
                    ],
                  ),
                ),

                Column(
                  children: <Widget>[
                    Text("Selamat Datang Di RSU Mitra Delima, Silakan Login Terlebih Dahulu,"),

                    SizedBox(height: 20,),

                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color : Colors.black87)
                        ),
                        prefixIcon: Icon(Icons.person, size: 30,),
                        hintText: "Masukkan Nama Lengkap",
                        hintStyle: TextStyle(color: Colors.grey),
                        labelText: "Masukkan Nama Lengkap",
                        labelStyle: TextStyle(color: Colors.black87),
                      ),
                    ),

                    SizedBox(height: 10,),

                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color : Colors.black87)
                        ),
                        prefixIcon: Icon(Icons.lock, size: 30,),
                        hintText: "Masukkan Nomor Rekam Medis",
                        hintStyle: TextStyle(color: Colors.grey),
                        labelText: "Masukkan Nomor Rekam Medis",
                        labelStyle: TextStyle(color: Colors.black87),
                      ),
                    ),

                    SizedBox(height: 20,),

                    MyButton(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()),),
                      text: "Login",
                      fullRounded: false,
                      color: Colors.black87,
                    ),
                  ],
                ),
                
                Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Copyright ©2020, By :", style: TextStyle(fontSize: 15,),),
                        Text(" IT RSMD ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),),
                        Text("Support ByTech_ID", style: TextStyle(fontSize: 15,),),

                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

