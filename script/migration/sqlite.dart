import 'package:student_management/dao/student_dao.dart';
import 'package:student_management/models/student.dart';



void main(){
    final dao = StudentDAO();

    Student student = Student(
            "Huy",
            "Ly",
            "11/11/1998",
            "male",
            "mobile Developer",
            "",
            false
    );

    dao.create(student);

}
