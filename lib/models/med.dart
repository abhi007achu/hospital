class Presc {
  String _prescby;
  String _prescfor;
  String _med;



  Presc(this._prescby, this._prescfor, this._med);

  Presc.map(dynamic obj) {
    this._prescby = obj['prescby'];
    this._prescfor = obj['prescfor'];
    this._med = obj['med'];
  }

  String get prescby => _prescby;
  String get prescfor => _prescfor;
  String  get med => _med;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["prescby"] = _prescby;
    map["prescfor"] = _prescfor;
    map["med"] = _med;
    return map;
  }
}