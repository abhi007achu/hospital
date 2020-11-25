import 'package:flutter/material.dart';
import 'package:hospital/data/database-helper.dart';
import 'package:hospital/models/user.dart';
import 'med_presc.dart';
import 'package:sqflite/sqflite.dart';
import 'mood.dart';
class docpat extends StatefulWidget {
  @override
  _docpatState createState() => _docpatState();
}
const mainBgColor = Color(0xFFf2f2f2);
const darkColor = Color(0xFF2A0B35);
const midColor = Color(0xFF522349);
const lightColor = Color(0xFFA52C4D);
const darkRedColor = Color(0xFFFA695C);
const lightRedColor = Color(0xFFFD685A);

const purpleGradient = LinearGradient(
  colors: <Color>[darkColor, midColor, lightColor],
  stops: [0.0, 0.5, 1.0],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const redGradient = LinearGradient(
  colors: <Color>[darkRedColor, lightRedColor],
  stops: [0.0, 1.0],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const USER_IMAGE='https://cdn4.iconfinder.com/data/icons/people-avatar-flat-1/64/girl_chubby_beautiful_people_woman_lady_avatar-512.png';
class _docpatState extends State<docpat> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<User> userlist=new List();
  int count=0;
  void initState() {
    super.initState();

    databaseHelper.getAllUser().then((users) {
      setState(() {
        users.forEach((user) {
          userlist.add(User.fromMap(user));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (userlist == null) {
      userlist = List<User>();
    }
    return Scaffold(
      backgroundColor: mainBgColor,
      body: SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.topCenter,
              overflow: Overflow.visible,
              children: <Widget>[
                _backBgCover(),
                _greetings(),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _areaSpecialistsText(),
                    _specialistsCardInfo1(),
                    showpatients(),

                  ],
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
  Container _backBgCover() {
    return Container(
      height: 260.0,
      decoration: BoxDecoration(
        gradient: purpleGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
    );
  }

  Positioned _greetings() {
    return Positioned(
      left: 20,
      bottom: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hi ',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'See your Patients',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }




  Column _iconBuilder(icon, title) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 28,
          color: Colors.black,
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
      ],
    );
  }


  Widget _areaSpecialistsText() {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Patients',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          //    Text(
          //   'See All',
          ////  style: TextStyle(
          // fontSize: 14,
          //   fontWeight: FontWeight.w500,
          //   color: midColor,
          //),
          // ),
        ],
      ),
    );
  }
  Widget _specialistsCardInfo1() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
      margin: EdgeInsets.only(
        bottom: 20.0,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1.0,
              blurRadius: 6.0,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Color(0xFFD9D9D9),
                backgroundImage: NetworkImage(USER_IMAGE),
                radius: 36.0,
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: '\n',
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'pat1',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text:  '\n' ,
                          style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: 'dept',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                ],
              ),
            ],
          ),
          //Icon(
          // LineAwesomeIcons.heart,
          //  color: lightColor,
          //  size: 36,
          //),
        ],
      ),
    );
  }
  ListView showpatients() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.amber,

            ),
            title: Text(this.userlist[position].name,
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(this.userlist[position].dept),
          ),
        );
      },
    );
  }




}
