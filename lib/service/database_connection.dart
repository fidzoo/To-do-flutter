import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection {
  static final _databaseName = "ToDoDatabase.db";
  static final _databaseVersion = 1;

  // make this a singleton class
  DatabaseConnection._privateConstructor();
  static final DatabaseConnection instance =
      DatabaseConnection._privateConstructor();

  // only have a single app-wide reference to the database "one instance"
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database tables
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE items (
            id INTEGER PRIMARY KEY,
            barCode TEXT,
            name TEXT,
            qty REAL,
            unitType INTEGER,
            unitPrice Real,
            notes TEXT,
            image TEXT,
            isDone INTEGER,
            listId INTEGER,
            categoryId INTEGER
          )
          ''');
  }
}
