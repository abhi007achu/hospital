import 'package:flutter/material.dart';
import 'package:hospital/screens/pat/book_doc.dart';
import 'package:hospital/screens/doc/doc_home.dart';
import 'package:hospital/screens/doc/doclogin.dart';
import 'package:hospital/screens/doc/docregister.dart';
import 'package:hospital/screens/pat/pat_doc.dart';
import 'package:hospital/screens/pat/pat_home.dart';
import 'package:hospital/screens/pat/patlogin.dart';
import 'package:hospital/screens/pat/pat_register.dart';
import 'package:hospital/screens/pat/moods.dart';
import 'package:hospital/screens/pat/pat_home.dart';
import 'package:hospital/screens/pat/pat_profile.dart';
import 'package:hospital/screens/pat/book_view.dart';


void main() => runApp(MyApp());

final routes = {
  '/login': (BuildContext context) => new LoginPage('','','',''),
  '/home': (BuildContext context) =>  pathome(),
  '/register': (BuildContext context) => new RegisterPage(),
  '/': (BuildContext context) => new LoginPage('','','',''),
  '/pathome':(BuildContext context) => new pathomescreen(),
  '/mood':(BuildContext context) => new MoodsSelector(),
  '/bookdoc':(BuildContext context) => new bookdoc(),
  '/viewdoc':(BuildContext context) => new viewdoc('',''),
  '/patprofile':(BuildContext context) => new patprofile('','','',''),
  '/l':(BuildContext context) => new LoginPage1('','','',''),
  '/register1':(BuildContext context) => new RegisterPage1(),
  '/home1':(BuildContext context) => new dochome('','','',''),




};

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Sqflite App',
      theme: new ThemeData(primarySwatch: Colors.teal),
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}