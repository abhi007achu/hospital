import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class docprofile extends StatefulWidget {
  final String name,username,gender,dept;
  const docprofile(this.name,this.username,this.gender,this.dept);
  @override
  _docprofileState createState() => _docprofileState();
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
const USER_IMAGE='https://cdn4.iconfinder.com/data/icons/people-avatar-flat-1/64/girl_chubby_beautiful_people_woman_lady_avatar-512.png';
const redGradient = LinearGradient(
  colors: <Color>[darkRedColor, lightRedColor],
  stops: [0.0, 1.0],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
class _docprofileState extends State<docprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.topCenter,
              overflow: Overflow.visible,
              children: <Widget>[
                _backBgCover(),
                _greetings()
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _specialistsCardInfo1(),
                    _specialistsCardInfo2(),
                    _specialistsCardInfo3(),
                    _specialistsCardInfo4(),
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
      height: 200.0,
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
      bottom: 30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(USER_IMAGE),
            backgroundColor: Color(0xFFD9D9D9),
            radius: 50.0,
          ),
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

              SizedBox(
                width: 10.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: 'Name\n',
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: widget.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
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
  Widget _specialistsCardInfo2() {
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

              SizedBox(
                width: 10.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: 'Username\n',
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: widget.username,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
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
  Widget _specialistsCardInfo3() {
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

              SizedBox(
                width: 10.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text:'Gender\n',
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: widget.gender,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
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
  Widget _specialistsCardInfo4() {
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

              SizedBox(
                width: 10.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: 'Department\n',
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: widget.dept,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
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

}
