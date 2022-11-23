import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSettings {
  late Database _database;
  static final DatabaseSettings _instance = DatabaseSettings._internal();

// singleton constructor
  factory DatabaseSettings() {
    return _instance;
  }

  DatabaseSettings._internal();

  Database get getDatabase => _database;

  Future<void> databaseInitialized() async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String path = join(appDocDir.path, 'resume.sql ');

      // temp (مؤقتة لحتى اتست)
      // await deleteDatabase(path);

      _database = await openDatabase(path, version: 1, onCreate: _onCreate);
    } on Exception catch (e) {
      print("Error => ${e.toString()}");
    }
  }

  _onCreate(Database db, int version) async {
    print("create database");

    // جزئية المهارات في الواجهة الاولى
    await db.execute('CREATE TABLE OneSkill ('
        'id INTEGER PRIMARY KEY,'
        'skillName TEXT,'
        'percent TEXT NOT NULL'
        ')');
    //جزئية الاهتمامات في الواجهة الاولى
    await db.execute('CREATE TABLE Interests ('
        'id INTEGER PRIMARY KEY,'
        ' interestsName TEXT '
        ')');
    // جزئية الخبرات الواجهة الثانية
    await db.execute('CREATE TABLE Experience ('
        'id INTEGER PRIMARY KEY,'
        'name TEXT NOT NULL,'
        'type TEXT NOT NULL,' // => Type (experience / rating / education)
        'body Text'
        ')');
  }
}
