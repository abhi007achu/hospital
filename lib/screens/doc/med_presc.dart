import 'package:flutter/material.dart';
import 'package:hospital/data/database-helper.dart';
import 'package:hospital/models/med.dart';
import 'package:hospital/screens/doc/presc_pat.dart';
class medpresc extends StatefulWidget {
  @override
  _medprescState createState() => _medprescState();
}

class _medprescState extends State<medpresc> {
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String prescby,prescto,medname;

  @override
  Widget build(BuildContext context) {
    var precsBtn= Padding(
      padding: const EdgeInsets.all(8.0),
      child: ButtonTheme(
        padding: EdgeInsets.only(),
        buttonColor: Colors.white,
        height: 50,
        minWidth: double.infinity,
        child: RaisedButton(
          child: Text(
            'Prescribe',
            style: TextStyle(
              color: Colors.teal[800],
              fontSize: 20,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            _submit();

          },
        ),
      ),
    );
    var prescform=  Column(
        children : [
          Padding(padding: EdgeInsets.only(top: 30.0)),
          Text('Medicine',

            style:
            TextStyle(
                color:Colors.white,
                fontSize: 35.0,
                fontWeight: FontWeight.bold),
          ),
          new Form(
            key: formKey,
            child: new Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 40.0)),
                TextFormField(
                  decoration:  InputDecoration(
                    labelText: "Your Name",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius:  BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                          color: Colors.white
                      ),
                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if(val.length==0) {
                      return "Cannot be empty";
                    }else{
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                  onSaved: (val) => prescby = val,
                  style:
                  TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                TextFormField(

                  decoration:  InputDecoration(
                    labelText: "Patient Name",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius:  BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                          color: Colors.white
                      ),
                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if(val.length==0) {
                      return "Cannot be empty";
                    }else{
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                  onSaved: (val) => prescto = val,
                  style:
                  TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                TextFormField(
                  decoration:  InputDecoration(
                    labelText: "Medicine Name",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius:  BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                      ),
                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if(val.length==0) {
                      return "Cannot be empty";
                    }else{
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                  onSaved: (val) => medname = val,
                  style:
                  TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                TextFormField(
                  decoration:  InputDecoration(
                    labelText: "Description",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius:  BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                      ),
                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if(val.length==0) {
                      return "Cannot be empty";
                    }else{
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
              ],
            ),
          ),
          precsBtn
        ]
    );
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 60,horizontal: 0.5),
                  child: Container(

                    height: 600,
                    width: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 1,
                      margin: EdgeInsets.all(10),
                      color: Colors.teal,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child:  Center(
                              child: prescform,

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              right: 50.0,
                            ),

                          ),

                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        var presc1 = new Presc(prescby,prescto,medname);
        var db = new DatabaseHelper();
        db.savePresc(presc1);
        _isLoading = false;
        Navigator.push(context, MaterialPageRoute(builder: (context)=>prescpat(prescto,medname)),);
        if (formKey.currentState.validate()) {}
      });
    }
  }
}
