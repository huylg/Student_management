import 'dart:async';
import 'package:student_management/database/database_provider.dart';
import 'package:student_management/models/student.dart';
import 'package:student_management/helper/helper.dart';

class StudentDAO {

    final dbProvider = DatabaseProvider();
    static const STUDENT_TABLE = 'students';
    //Create new student
    Future<int> create(Student student) async {
        final db = await dbProvider.createDatabase();
        var result = db.insert(STUDENT_TABLE, Helper().studentToDatabaseRecord(student));
        return result;
    }

    //read all new student
    Future<List<Student>> get() async {
        final db = await dbProvider.createDatabase();
        List<Map<String, dynamic>> result = await db.query(STUDENT_TABLE,columns: Helper.columns(), where: "is_disable != 0");
        return result.map((record) => Helper().databaseRecordToStudent(record));
    }

    //update student
    Future<int> update(Student student) async{
        final db = await dbProvider.createDatabase();
        var result = await db.update(STUDENT_TABLE, Helper().studentToDatabaseRecord(student),where: "id = ?",whereArgs: [student.id]);
        return result;
    }


    //delete student
    Future<int> delete(int id) async{
        final db = await dbProvider.createDatabase();
        var result = await db.delete(STUDENT_TABLE, where: 'id = ?', whereArgs: [id]);
        return result;
    }

}
