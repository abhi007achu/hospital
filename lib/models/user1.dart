class User1 {
  String _name1;
  String _username1;
  String _password1;
  int _phno1;
  String _dept1;
  String _flaglogged1;



  User1(this._name1, this._username1, this._password1,this._phno1,this._dept1, this._flaglogged1);

  User1.map(dynamic obj1) {
    this._name1 = obj1['name1'];
    this._username1 = obj1['username1'];
    this._password1 = obj1['password1'];
    this._phno1 = obj1['phno1'];
    this._dept1 = obj1['dept1'];
    this._flaglogged1 = obj1['password1'];
  }

  String get name1 => _name1;
  String get username1 => _username1;
  String get password1 => _password1;
  int get phno1 => _phno1;
  String get dept1 => _dept1;
  String get flaglogged1 => _flaglogged1;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["name1"] = _name1;
    map["username1"] = _username1;
    map["password1"] = _password1;
    map["phno1"] = _phno1;
    map["dept1"] = _dept1;
    map["flaglogged1"] = _flaglogged1;
    return map;
  }
}