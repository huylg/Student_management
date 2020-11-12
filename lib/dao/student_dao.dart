import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:student_management/database/database_provider.dart';
import 'package:student_management/models/student.dart';
import 'package:student_management/helper/helper.dart';

class StudentDAO {

    final dbProvider = DatabaseProvider.provider;
    static const STUDENT_TABLE = 'students';
    //Create new student
    Future<int> create(Student student) async {
        final db = await dbProvider.database;
        var result = db.insert(STUDENT_TABLE, Helper().studentToDatabaseRecord(student),conflictAlgorithm: ConflictAlgorithm.replace);
        return result;
    }

    //read all new student
    Future<List<Student>> get() async {
        final db = await dbProvider.database;
        List<Map<String, dynamic>> result = await db.query(STUDENT_TABLE);
        return List.generate(result.length,(i)=>Helper().databaseRecordToStudent(result[i]));
    }

    //update student
    Future<int> update(Student student) async{
        final db = await dbProvider.database;
        var result = await db.update(STUDENT_TABLE, Helper().studentToDatabaseRecord(student),where: "id = ?",whereArgs: [student.id]);
        return result;
    }


    //delete student
    Future<int> delete(int id) async{
        final db = await dbProvider.database;
        var result = await db.delete(STUDENT_TABLE, where: 'id = ?', whereArgs: [id]);
        return result;
    }
}

