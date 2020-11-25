class Book {
  String _bookby;
  String _bookfor;
  String _bookdate;



  Book(this._bookby, this._bookfor, this._bookdate);

  Book.map(dynamic obj) {
    this._bookby = obj['bookby'];
    this._bookfor = obj['bookfor'];
    this._bookdate = obj['bookdate'];
  }

  String get bookby => _bookby;
  String get bookfor => _bookfor;
  String get bookdate => _bookdate;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["bookby"] = _bookby;
    map["bookfor"] = _bookfor;
    map["bookdate"] = _bookdate;
    return map;
  }
}