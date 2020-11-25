import 'package:flutter/material.dart';
import 'package:hospital/data/database-helper.dart';
import 'package:hospital/models/book.dart';
import 'package:hospital/screens/pat/book_view.dart';
class bookdoc extends StatefulWidget {
  @override
  _bookdocState createState() => _bookdocState();
}

class _bookdocState extends State<bookdoc> {
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String bookby,bookto,date;

  @override
  Widget build(BuildContext context) {
    var bookBtn= Padding(
      padding: const EdgeInsets.all(8.0),
      child: ButtonTheme(
        padding: EdgeInsets.only(),
        buttonColor: Colors.white,
        height: 50,
        minWidth: double.infinity,
        child: RaisedButton(
          child: Text(
            'Book an Appoinment',
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
    var bookform=  Column(
        children : [
          Padding(padding: EdgeInsets.only(top: 30.0)),
          Text('Appoinment',

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
                  onSaved: (val) => bookby = val,
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
                    labelText: "Doctor Name",
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
                  onSaved: (val) => bookto = val,
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
                    labelText: "Date",
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
                  keyboardType: TextInputType.datetime,
                  onSaved: (val) => date = val,
                  style:
                  TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),

                Padding(padding: EdgeInsets.only(top: 15.0)),
              ],
            ),
          ),
          bookBtn
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
                              child: bookform,

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
        var book1 = new Book(bookby,bookto,date);
        var db = new DatabaseHelper();
        db.saveBook(book1);
        _isLoading = false;
        Navigator.push(context, MaterialPageRoute(builder: (context)=>viewdoc(bookto,date)),);
        if (formKey.currentState.validate()) {}
      });
    }
  }
}
