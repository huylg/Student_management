
import 'package:student_management/models/student.dart';

class Helper{
    Map<String, dynamic> studentToDatabaseRecord(Student student){
        return {
            'first_name': student.firstName,
            'last_name': student.lastName,
            'date_of_birth': student.dateOfBirth,
            'gender': student.gender,
            'class_name': student.className,
            'other_info': student.otherInfo,
            'id': student.id,
            'is_disable': student.isDisable ? 1 : 0,
			'avatar_path': student.avatarPath,
        };
    }

    Student databaseRecordToStudent(Map<String,dynamic> record){
        final firstName = record['first_name'] as String;
        final lastName = record['last_name'] as String;
        final dateOfBirth = record['date_of_birth'] as String;
        final gender = record['gender'] as String;
        final className = record['class_name'] as String;
        final otherInfo = record['other_info'] as String;
        final id = record['id'] as int;
        final isDisable = (record['is_disable'] as int) != 0;
		final avatarPath = record['avatar_path'] as String; 
        return Student(firstName, lastName, dateOfBirth, gender, className, otherInfo, id, isDisable, avatarPath);
    }

    static List<String> columns(){
        return ['first_name','last_name','date_of_birth','gender','class_name','other_info','id','is_disable', 'avatar_path'];
    }

}


