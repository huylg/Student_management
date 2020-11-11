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
                    print(snapshot);
                    if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                    }

                    return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                                return ListTile(
                                        title: Text("title $index"),
                                        subtitle: Text('subtitle $index'),
                                );
                            },
                    );
                });

        return Scaffold(
                appBar: AppBar(title: Text(this.title)),
                body: streamBuild,
                floatingActionButton: FloatingActionButton(

                        child: Icon(Icons.add),
                        onPressed: (){
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => EditFormScreen()),
                            );
                        },
                ),
        );
    }
}
