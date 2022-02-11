import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static late Database _db;

  Future<Database> get db async {
    // ignore: unnecessary_null_comparison
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDir = await getApplicationDocumentsDirectory();

    String path = join(documentDir.path, 'Main.db');

    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);

    return ourDb;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY, NAME TEXT, USERNAME TEXT, PASSWORD TEXT)");
    // ignore: avoid_print
    print("Table is created");
  }
}
