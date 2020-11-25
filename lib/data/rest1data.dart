import 'dart:async';
import 'package:hospital/models/user1.dart';
import 'package:hospital/data/database-helper.dart';

class RestData {
  static final BASE_URL = "";
  static final LOGIN_URL = BASE_URL + "/l";

  Future<User1> login( String username1, String password1) async {
    String flagLogged1 = "logged";
    //simulate internet connection by selecting the local database to check if user has already been registered
    var user1 = new User1(null, username1, password1,null,null, null);
    var db = new DatabaseHelper();
    var user1Retorno = new User1(null,null,null,null,null,null);
    user1Retorno = await db.selectUser1(user1);
    if(user1Retorno != null){
      flagLogged1 = "logged";
      return new Future.value(new User1(null, username1, password1,null,null,flagLogged1));
    }else {
      flagLogged1 = "not";
      return new Future.value(new User1(null, username1, password1,null,null,flagLogged1));
    }
  }
}