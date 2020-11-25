class User {
  String _name;
  String _username;
  String _password;
  int _phno;
  String _dept;
  String _flaglogged;



  User(this._name, this._username, this._password, this._phno,this._dept, this._flaglogged);

  User.map(dynamic obj) {
    this._name = obj['name'];
    this._username = obj['username'];
    this._password = obj['password'];
    this._phno = obj['phno'];
    this._dept = obj['dept'];
    this._flaglogged = obj['password'];
  }

  String get name => _name;
  String get username => _username;
  String get password => _password;
  int get phno => _phno;
  String get dept => _dept;
  String get flaglogged => _flaglogged;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = _name;
    map["username"] = _username;
    map["password"] = _password;
    map["phno"] = _phno;
    map["dept"] = _dept;
    map["flaglogged"] = _flaglogged;
    return map;
  }
  User.fromMap(Map<String, dynamic> map) {
    this._name = map['name'];
    this._dept = map['dept'];
  }
}