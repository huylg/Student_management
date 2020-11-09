import 'package:student_management/dao/student_dao.dart';
import 'package:student_management/models/student.dart';


class StudentRepository{

    final dao = StudentDAO();

    Future<List<Student>> get() => dao.get();
    Future<int> create(Student student) => dao.create(student);
    Future<int> update(Student student) => dao.update(student);
    Future<int> delete(int id) => dao.delete(id);
}
