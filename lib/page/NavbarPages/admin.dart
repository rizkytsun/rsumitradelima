import 'package:flutter/material.dart';

import 'package:rsumitradelima/components.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    Text("Halaman Ini Khusus Admin", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                    SizedBox(height: 20,),

                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color : Colors.black87)
                        ),
                        prefixIcon: Icon(Icons.person, size: 30,),
                        hintText: "Masukkan Nomor RM",
                        hintStyle: TextStyle(color: Colors.grey),
                        labelText: "Nomor RM",
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
                        hintText: "Masukkan NIK KTP",
                        hintStyle: TextStyle(color: Colors.grey),
                        labelText: "NIK KTP",
                        labelStyle: TextStyle(color: Colors.black87),
                      ),
                    ),

                    SizedBox(height: 20,),

                    MyButton(
                      onTap: (){},
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
        );
  }
}