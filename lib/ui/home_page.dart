import 'dart:io';
import 'package:flutter/material.dart';
import 'package:student_management/bloc/student_bloc.dart';
import 'package:student_management/models/student.dart';
import 'edit_form_screen.dart';

class HomePage extends StatelessWidget {
  final StudentBloc bloc = StudentBloc();

  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final streamBuild = StreamBuilder(
        stream: bloc.students,
        builder: (BuildContext context, AsyncSnapshot<List<Student>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          final List<Student> students = snapshot.data;
          return ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];

              return Dismissible(
                  key: Key('${student.id}'),
                  background: Container(
                    color: Colors.red,
                  ),
                  onDismissed: (direction) => bloc.deleteStudent(student.id),
                  child: GestureDetector(
                    onTap: () async {
                      final editedStudent = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditForm(
                                  title: 'edit form',
                                  student: student.clone(),
                                )),
                      );

                      bloc.updateStudent(editedStudent);
                    },
                    child: ListTile(
                      leading: Container(
                          alignment: Alignment.bottomRight,
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image:students[index].avatarPath.isNotEmpty
                                    ? FileImage(File(students[index].avatarPath))
                                    : AssetImage(
                                        'images/Profile_avatar_placeholder_large.png'),
                              )),
                          ),
                      title: Text(
                          students[index].firstName + students[index].lastName),
                      subtitle: Text(students[index].className),
                    ),
                  ));
            },
          );
        });

    return Scaffold(
      appBar: AppBar(title: Text(this.title)),
      body: streamBuild,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final newStudent = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditForm(
                      title: 'add form',
                      student: Student.studentDefault(),
                    )),
          );

          bloc.addStudent(newStudent);
        },
      ),
    );
  }
}
