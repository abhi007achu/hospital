import 'package:flutter/material.dart';
import 'package:hospital/screens/doc/doc_pat.dart';
import 'package:hospital/screens/doc/doc_profile.dart';
import 'package:hospital/screens/doc/presc_pat.dart';
import 'package:hospital/screens/pat/pat_profile.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import 'med_presc.dart';



class dochome extends StatefulWidget {

  final String name,username,gender,dept;
  const dochome(this.name,this.username,this.gender,this.dept);
  @override
  _dochomeState createState() => _dochomeState();
}

class _dochomeState extends State<dochome> {
  int _selectedIndex = 0;
  String uname,dname,dgen,ddept;
  final List<Widget>_children = [
    docpat(),
    medpresc(),
    docprofile('',' ',' ','')
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