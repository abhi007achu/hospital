import 'package:flutter/material.dart';
import 'package:hospital/data/database-helper.dart';
import 'package:hospital/models/user.dart';
import 'package:hospital/screens/doc/doclogin.dart';
import 'package:hospital/screens/pat/loginpresenter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital/screens/pat/pat_home.dart';
import 'package:hospital/screens/pat/pat_profile.dart';

class LoginPage extends StatefulWidget {
  final String name,username,gender,dept;
  const LoginPage(this.name,this.username,this.gender,this.dept);
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageContract {
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String _email, _password;

  LoginPagePresenter _presenter;

  _LoginPageState() {
    _presenter = new LoginPagePresenter(this);
  }

  void _register() {
    Navigator.of(context).pushNamed("/register");
  }
  void _doc() {

    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage1('','','','')),);

  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        _presenter.doLogin(_email, _password);

      });
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var loginBtn = Padding(
      padding: const EdgeInsets.all(8.0),
      child: ButtonTheme(
        padding: EdgeInsets.only(),
        buttonColor: Colors.white70,
        height: 50,
        minWidth:350,
        child: RaisedButton(
          child: Text(
            'Login',
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

    var registerBtn = Padding(
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
            _register();

          },
        ),
      ),
    );
    var docBtn = Padding(
      padding: const EdgeInsets.all(8.0),
      child: ButtonTheme(
        padding: EdgeInsets.only(),
        buttonColor: Colors.white70,
        height: 50,
        minWidth: 350,
        child: RaisedButton(
          child: Text(
            'Login as Doctor',
            style: TextStyle(
              color: Colors.teal[800],
              fontSize: 20,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          onPressed: () {
            _doc();

          },
        ),
      ),
    );
    var loginForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Text(
          " \n E-CARE ",
          style: GoogleFonts.acme(
              textStyle:TextStyle(
                color: Colors.teal[800],
                fontWeight: FontWeight.bold,
                fontSize: 30,
              )
          ),
          textScaleFactor: 2.0,
        ),

        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(20.0),
                child: new TextFormField(
                  onSaved: (val) => _email = val,
                  decoration: new InputDecoration(labelText: "Name"),
                  validator: (String _email){
                    if (_email.isEmpty) return 'Enter your Name';
                    else return null;
                  },
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(20.0),
                child: new TextFormField(
                  onSaved: (val) => _password = val,
                  decoration: new InputDecoration(labelText: "Password"),
                  validator: (String _password) {
                    if (_password.length <8) return 'Invalid Password';
                    else return null;
                  },
                ),
              )
            ],
          ),
        ),
        new Padding(
            padding: const EdgeInsets.all(10.0),
            child: loginBtn),
        registerBtn,
        new Padding(
            padding: const EdgeInsets.all(10.0),
            child: docBtn),

      ],
    );

    return new Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      body: new Container(

        child: new Center(
          child: loginForm,
        ),
      ),
    );
  }

  @override
  void onLoginError(String error) {
    // TODO: implement onLoginError
    _showSnackBar("Login not successful");
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onLoginSuccess(User user) async {
    // TODO: implement onLoginSuccess
    if(user.username == ""){
      _showSnackBar("Login not successful");
    }else{
      _showSnackBar(user.toString());
    }
    setState(() {
      _isLoading = false;
    });
    if(user.flaglogged == "logged"){
      print("Logged");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>pathome(pname: '',pusername: '',pgender: '',pdept: '')),);
    }else{
      print("Not Logged");
    }
  }
}