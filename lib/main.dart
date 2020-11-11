import 'package:flutter/material.dart';
import 'package:student_management/ui/home_page.dart';
void main() {
    runApp(MainApp());
}

class MainApp extends StatelessWidget{

    final String title = 'student management';
    @override
    Widget build(BuildContext context){
        return MaterialApp(
                title: this.title,
                home: HomePage(title: this.title),
        );

    }
}


