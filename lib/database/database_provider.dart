import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseProvider {
  static final DatabaseProvider provider = DatabaseProvider();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await createDatabase();

    return _database;
  }

  Future<Database> createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, 'student_management.db');

    var database = await openDatabase(
      path,
      version: 4,
      onCreate: (Database database, int version) async {
        await database.execute("CREATE TABLE students ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "first_name TEXT NOT NULL,"
            "last_name TEXT NOT NULL,"
            "date_of_birth TEXT NOT NULL,"
            "gender TEXT NOT NULL,"
            "class_name TEXT NOT NULL,"
            "other_info TEXT NOT NULL,"
            "is_disable INT NOT NULL,"
            "avatar_path TEXT NOT NULL "
            ");");
      },
      onUpgrade: (database, olderVersion, newVersion) async {
        await database.execute(" Drop TABLE IF EXISTS students ");

        await database.execute("CREATE TABLE students ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "first_name TEXT NOT NULL,"
            "last_name TEXT NOT NULL,"
            "date_of_birth TEXT NOT NULL,"
            "gender TEXT NOT NULL,"
            "class_name TEXT NOT NULL,"
            "other_info TEXT NOT NULL,"
            "is_disable INT NOT NULL,"
            "avatar_path TEXT NOT NULL "
            ");");
      },
    );

    return database;
  }
}
