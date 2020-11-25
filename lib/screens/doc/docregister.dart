import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital/data/database-helper.dart';
import 'package:hospital/models/user1.dart';

import 'doclogin.dart';
import 'doclogin.dart';

class RegisterPage1 extends StatefulWidget {
  @override
  _RegisterPage1State createState() => new _RegisterPage1State();
}

class _RegisterPage1State  extends State<RegisterPage1> {
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _name, _username, gender, dept, _password;

  int phno, age;


  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var loginBtn =  Padding(
      padding: const EdgeInsets.all(8.0),
      child: ButtonTheme(
        padding: EdgeInsets.only(),
        buttonColor: Colors.white70,
        height: 50,
        minWidth: 350,
        child: RaisedButton(
          child: Text(
            'Register',
            style: TextStyle(
              color: Colors.teal[800],
              fontSize: 20,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          onPressed: () {
            _submit();

          },
        ),
      ),
    );


    var loginForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Text(
          "\n Register",
          style: GoogleFonts.lato(
              textStyle:TextStyle(
                color: Colors.teal[800],
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )
          ),
          textScaleFactor: 2.0,
        ),
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  keyboardType: TextInputType.text,
                  onSaved: (val) => _name = val,
                  decoration: new InputDecoration(labelText: "Name"),
                  validator: (String name) {
                    if (name.isEmpty)
                      return 'Enter your name';
                    else
                      return null;
                  },
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(

                  onSaved: (val) => _username = val,
                  decoration: new InputDecoration(labelText: "User Name"),
                  validator: (String name) {
                    if (name.isEmpty)
                      return 'Enter your name';
                    else
                      return null;
                  },
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _password = val,
                  decoration: new InputDecoration(labelText: "Password"),
                  validator: (String _password) {
                    if (_password.length < 8 )
                      return 'Invalid Password';
                    else
                      return null;
                  },

                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  keyboardType: TextInputType.text,
                  onSaved: (val) => gender = val,
                  decoration: new InputDecoration(labelText: "Gender"),
                  validator: (String gender) {
                    if (gender.isEmpty)
                      return 'Please enter your gender';
                    else
                      return null;
                  },
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (val) => age = int.parse(val),
                  decoration: new InputDecoration(labelText: "age"),
                  validator: (String age) {
                    if (age.isEmpty)
                      return 'Enter your age';
                    else
                      return null;
                  },
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (val) => phno = int.parse(val),
                  decoration: new InputDecoration(labelText: "phone Number"),
                  validator: (String phno) {
                    if (phno.length != 10 )
                      return 'Invalid mobile number';
                    else
                      return null;
                  },
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  keyboardType: TextInputType.text,
                  onSaved: (val) => dept = val,
                  decoration: new InputDecoration(labelText: "Department"),
                  validator: (String dept) {
                    if (dept.isEmpty)
                      return 'Invalid Department';
                    else
                      return null;
                  },
                ),
              ),
            ],
          ),
        ),
        loginBtn
      ],
    );

    return new Scaffold(
        resizeToAvoidBottomInset: false,

        key: scaffoldKey,
        body: SingleChildScrollView(
          child: new Container(
            child: new Center(
              child: loginForm,
            ),
          ),
        )
    );
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  void _submit(){
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        var user1 = new User1(_name, _username, _password,phno,dept, null);
        var db = new DatabaseHelper();
        db.saveUser1(user1);
        _isLoading = false;
        //Navigator.of(context).pushNamed("/l");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage1(_name,_username,gender,dept)),);
        if (formKey.currentState.validate()) {}
      });
    }
  }
}