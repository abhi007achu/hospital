import 'package:flutter/material.dart';
import 'package:hospital/screens/pat/book_doc.dart';
import 'package:hospital/screens/pat/book_view.dart';
import 'package:hospital/screens/pat/pat_doc.dart';
import 'package:hospital/screens/pat/pat_profile.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';



class pathome extends StatefulWidget {
  final String pname,pusername,pgender,pdept;
  pathome({ this.pname,this.pusername,this.pgender,this.pdept}) ;



  @override
  _pathomeState createState() => _pathomeState();
}

class _pathomeState extends State<pathome> {
  int _selectedIndex = 0;
  final List<Widget>_children = [
    pathomescreen(),
    bookdoc(),
    patprofile('','','','')

  ];


  void onTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                LineAwesomeIcons.home,
                size: 30.0,
              ),
              title: Text('1')),
          BottomNavigationBarItem(
              icon: Icon(
                LineAwesomeIcons.book,
                size: 30.0,
              ),
              title: Text('2')),
          BottomNavigationBarItem(
              icon: Icon(
                LineAwesomeIcons.male,
                size: 30.0,
              ),
              title: Text('3')),
        ],
        onTap: onTapped,
      ),
    );
  }

}