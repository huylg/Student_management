import 'package:student_management/repository/student_repository.dart';
import 'package:student_management/models/student.dart';

import 'dart:async';


class StudentBloc{
   
    final _repository = StudentRepository();

    final _streamController = StreamController<List<Student>>.broadcast();

    get students => _streamController.stream;

    StudentBloc(){
        getStudents();
    }

    void getStudents() async {
        _streamController.sink.add(await _repository.get());
    }

    void addStudent(Student student) async{
        await _repository.create(student);
        getStudents();
    } 


    void updateStudent(Student student) async{
        await _repository.update(student);
        getStudents();
    }

    void deleteStudent(int id) async{
        await _repository.delete(id);
        getStudents();
    }

    void dispose(){
        _streamController.close();
    }
}
