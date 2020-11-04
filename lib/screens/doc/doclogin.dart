import 'package:flutter/material.dart';
import 'doc_home.dart';
import 'docpassword.dart';
import 'docregister.dart';
class doc_Login extends StatefulWidget {
  @override
  _doc_LoginState createState() => _doc_LoginState();
}

class _doc_LoginState extends State<doc_Login> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0,110.0,0.0,0.0),
                        child: Text(
                            'Hello',
                            style: TextStyle(
                                fontSize: 80.0, fontWeight: FontWeight.bold)
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(16.0,175.0,0.0,0.0),
                        child: Text(
                            'There',
                            style: TextStyle(
                                fontSize: 80.0, fontWeight: FontWeight.bold)
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(220.0,175.0,0.0,0.0),
                        child: Text(
                            '.',
                            style: TextStyle(
                                fontSize: 80.0, fontWeight: FontWeight.bold, color: Colors.blueAccent)
                        ),
                      )
                    ]
                )
            ),
            Container(
              padding: EdgeInsets.only(top: 35.0,left: 20.0,right: 20.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'NAME',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.black87
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.greenAccent)
                        )
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.black87
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.greenAccent)
                        )
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 5.0,),
                  Container(
                    alignment: Alignment(1.0, 0.0),
                    padding: EdgeInsets.only(top: 15.0,left: 20.0),
                    child: InkWell(
                      onTap:() {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>doc_Password())
                        );
                      },
                      child: Text('Forgot Password',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,
                            decoration: TextDecoration.underline
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    height: 50.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.blueAccent,
                      color: Colors.blue,
                      elevation: 7.0,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>dochome()),);
                        },
                        child: Center(
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'New Doctor ?',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                  ),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap:() {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>doc_Register()),
                    );
                  },
                  child: Text('Register',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        decoration: TextDecoration.underline
                    ),
                  ),
                )
              ],
            )
          ],
        )
    );
  }
}
