import 'dart:io';
import 'package:hospital/models/user.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:hospital/models/user1.dart';
import 'package:hospital/models/book.dart';
import 'package:hospital/models/med.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database _db;
  final String tableUser = "User";
  final String tableUser1 = "User1";
  final String tableBook = "Book";
  final String tablePresc = "Presc";
  final String columnName = "name";
  final String columnUserName = "username";
  final String columnPassword = "password";
  final String columnDept = "dept";
  final String columnName1 = "name1";
  final String columnUserName1 = "username1";
  final String columnPassword1 = "password1";
  final String columnBookby = "bookby";
  final String columnBookfor = "bookfor";
  final String columnBookdate = "bookdate";
  final String columnPrescby = "prescby";
  final String columnPrescfor = "prescfor";
  final String columnMed = "med";

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "hos.db");
    var ourDb = await openDatabase(path, version: 2, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY, name TEXT, username TEXT, password TEXT,phno INTEGER,dept TEXT, flaglogged TEXT)");
    print("Patient is created");
    await db.execute(
        "CREATE TABLE User1(id1 INTEGER PRIMARY KEY, name1 TEXT, username1 TEXT, password1 TEXT,phno1 INTEGER,dept1 TEXT, flaglogged1 TEXT)");
    print("Doctor is created");
    await db.execute(
        "CREATE TABLE Book(bid INTEGER PRIMARY KEY, bookby TEXT, bookfor TEXT, bookdate TEXT)");
    print("Booking is created");
    await db.execute(
        "CREATE TABLE Presc(pid INTEGER PRIMARY KEY, prescby TEXT, prescfor TEXT, med TEXT)");
    print("Prescription is created");


  }

  //insertion
  Future<int> saveUser(User user) async {
    var dbClient = await db;
    print(user.name);
    int res = await dbClient.insert("User", user.toMap());
    List<Map> list = await dbClient.rawQuery('SELECT * FROM User');
    print(list);
    return res;
  }

  //deletion
  Future<int> deleteUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.delete("User");
    return res;
  }
  Future<User> selectUser(User user) async{
    print("Select User");
    print(user.username);
    print(user.password);
    var dbClient = await db;
    List<Map> maps = await dbClient.query(tableUser,
        columns: [columnUserName, columnPassword],
        where: "$columnUserName = ? and $columnPassword = ?",
        whereArgs: [user.username,user.password]);
    print(maps);
    if (maps.length > 0) {
      print("User Exist !!!");
      return user;
    }else {
      return null;
    }
  }
  Future<List> getAllUser() async {
    var dbClient = await db;
    var result = await dbClient.query(tableUser, columns: [columnName, columnDept]);
//    var result = await dbClient.rawQuery('SELECT * FROM $tableNote');

    return result.toList();
  }
  //doc table
  //insertion
  Future<int> saveUser1(User1 user1) async {
    var dbClient1 = await db;
    print(user1.name1);
    int res = await dbClient1.insert("User1", user1.toMap());
    List<Map> list = await dbClient1.rawQuery('SELECT * FROM User1');
    print(list);
    return res;
  }

  //deletion
  Future<int> deleteUser1(User1 user1) async {
    var dbClient1 = await db;
    int res = await dbClient1.delete("User1");
    return res;
  }
  Future<User1> selectUser1(User1 user1) async{
    print("Select User1");
    print(user1.username1);
    print(user1.password1);
    var dbClient1 = await db;
    List<Map> maps = await dbClient1.query(tableUser1,
        columns: [columnUserName1, columnPassword1],
        where: "$columnUserName1 = ? and $columnPassword1 = ?",
        whereArgs: [user1.username1,user1.password1]);
    print(maps);
    if (maps.length > 0) {
      print("User1 Exist !!!");
      return user1;
    }else {
      return null;
    }
  }
  //Book
  Future<int> saveBook(Book book) async {
    var dbClientb = await db;
    print(book.bookby);
    int res = await dbClientb.insert("Book", book.toMap());
    List<Map> list = await dbClientb.rawQuery('SELECT * FROM Book');
    print(list);
    return res;
  }

  //deletion
  Future<int> deleteBook(Book book) async {
    var dbClientb = await db;
    int res = await dbClientb.delete("Book");
    return res;
  }
  Future<Book> selectBook(Book book) async{
    print("Select Book");
    print(book.bookby);
    print(book.bookfor);
    var dbClientb = await db;
    List<Map> maps = await dbClientb.query(tableBook,
        columns: [columnBookby, columnBookfor,columnBookdate ],
        where: "$columnBookby = ? and $columnBookfor = ?",
        whereArgs: [book.bookby,book.bookfor]);
    print(maps);
    if (maps.length > 0) {
      print("Book Exist !!!");
      return book;
    }else {
      return null;
    }
  }
//Presc
  Future<int> savePresc(Presc presc) async {
    var dbClientp = await db;
    print(presc.prescby);
    int res = await dbClientp.insert("Presc", presc.toMap());
    List<Map> list = await dbClientp.rawQuery('SELECT * FROM Presc');
    print(list);
    return res;
  }

  //deletion
  Future<int> deletePresc(Presc presc) async {
    var dbClientp = await db;
    int res = await dbClientp.delete("Presc");
    return res;
  }
  Future<Presc> selectPresc(Presc presc) async{
    print("Select Presc");
    print(presc.prescby);
    print(presc.prescfor);
    var dbClientp = await db;
    List<Map> maps = await dbClientp.query(tablePresc,
        columns: [columnPrescby, columnPrescfor,columnMed ],
        where: "$columnPrescby = ? and $columnPrescfor = ?",
        whereArgs: [presc.prescby,presc.prescfor]);
    print(maps);
    if (maps.length > 0) {
      print("Presc Exist !!!");
      return presc;
    }else {
      return null;
    }
  }

}