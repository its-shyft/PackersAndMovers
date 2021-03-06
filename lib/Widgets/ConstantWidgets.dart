import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ConstantWidgets{
  static final appbarWithoutProfile = AppBar(
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Colors.black87,
    elevation: 1.0,
    centerTitle: true,
    title: Text("SHYFT",style: TextStyle(color: Colors.white,letterSpacing: 2.5,fontWeight: FontWeight.bold),),
  );
  static appbarWithProfile({Function SignOut})=> AppBar(
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Colors.black87,
    elevation: 1.0,
    centerTitle: true,
    title: Text("SHYFT",style: TextStyle(color: Colors.white,letterSpacing: 2.5,fontWeight: FontWeight.bold),),
    actions: <Widget>[IconButton(icon: Icon(Icons.person_pin), onPressed: (){
      SignOut();
     })],
  );
}