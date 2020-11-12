import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:student_management/models/student.dart';

class EditForm extends StatefulWidget{

    final String title;
    final Student student;

    EditForm({this.title,this.student});

    @override
    _EditFormState createState() => _EditFormState();
}
class _EditFormState extends State<EditForm>{
    final _formKey = GlobalKey<FormState>();
    @override
    void initState() {
        // TODO: implement initState
        super.initState();
      }

    @override
    Widget build(BuildContext context){
        return Form(
                key: _formKey,
                child: Scaffold(

                        appBar: AppBar(title: Text(widget.title),actions: [FlatButton(
                                        onPressed: (){
                                            if(_formKey.currentState.validate()){
                                                Navigator.pop(context, widget.student);
                                            }
                                        },
                                        textColor: Colors.white,
                                        child: Text('save'),
                        )],),
                        body: SingleChildScrollView( child: Column(
                                        children: [
                                            //AvatarFormField(),
                                        SinglelineTextFormField(
                                                icon: Icon(Icons.person),
                                                hintText: 'first name',
                                                onChange: (text) => widget.student.firstName = text,
                                                title: 'First Name',
                                                initialValue: widget.student.firstName,
                                        ),
                                        SinglelineTextFormField(

                                                icon: Icon(Icons.info),
                                                hintText: 'last name',
                                                onChange: (text) => widget.student.lastName = text,
                                                title: 'Last name',
                                                initialValue: widget.student.lastName,
                                        ),
                                        SinglelineTextFormField(

                                                icon: Icon(Icons.class_),
                                                hintText: 'class',
                                                onChange: (text) => widget.student.className = text,
                                                title: 'Class name',
                                                initialValue: widget.student.className,
                                        ),
                                        DateFormField(
                                                icon: Icon(Icons.calendar_today),
                                                title: 'birth day',
                                                date: widget.student.dateOfBirth,
                                                onSet: (newDate){
                                                    setState(() {
                                                        widget.student.dateOfBirth = newDate;
                                                    });
                                                }
                                        ),
                                        GenderFormField(
                                                icon: Icon(MdiIcons.genderMaleFemale,),
                                                genderList: ['male','female'],
                                                genderSelection: widget.student.gender == 'male' ? 0 : 1,
                                                onSet: (String newSelection){
                                                    setState(() {
                                                        widget.student.gender = newSelection;
                                                    });
                                                },
                                        ),
                                        MultiLineTextFormField(
                                                title: 'other infomation',
                                                onChanged: (text) {
                                                    widget.student.otherInfo = text;
                                                },
                                                initialValue: widget.student.otherInfo,


                                        ),
                                        ],
                                        ),
                                        ),
                                        ),
                                        );
    }

}

class AvatarFormField extends StatelessWidget{
    @override
    Widget build(BuildContext context){
        return Container(
                height: 100,
                child: Center(

                        child: SizedBox(
                                width: 50,
                                height: 50,
                                child: Icon(MdiIcons.accountCog)
                        ),
                ),
        );
    }
}

class SinglelineTextFormField extends StatelessWidget{


    final Icon icon;
    final String hintText;
    final Function onChange;
    final String title;
    final String initialValue;
    SinglelineTextFormField({this.icon, this.hintText, this.onChange, this.title, this.initialValue});

    @override
    Widget build(BuildContext context){
        return ListTile(
                leading: icon,
                title: TextFormField(
                        validator: (value){
                            if(value.isEmpty){
                                return "$title field can't be empty";
                            }
                            return null;
                        },
                        initialValue: initialValue,
                        onChanged: (text) => onChange(text),
                        decoration: InputDecoration(
                                            hintText: this.hintText,
                                    ),
                ),
        );
    }

}

class DateFormField extends StatelessWidget{

    final Icon icon;
    final String title;
    final String date;
    final Function onSet;
    DateFormField({this.icon, this.title, this.date, this.onSet});

    @override
    Widget build(BuildContext context){
        return GestureDetector(
                child: ListTile(
                        leading: icon,
                        title: Text(title),
                        subtitle: Text(date),
                ),

                onTap: () async {
                    final DateTime picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.parse(date),
                            firstDate: DateTime(1990),
                            lastDate: DateTime(2025),
                    );

                    final DateFormat formatter = DateFormat('yyyy-MM-dd');
                    final String formatted = formatter.format(picked);
                    this.onSet(formatted);

                },
        );
    }
}


class GenderFormField extends StatelessWidget{

    final Icon icon;
    final List<String> genderList;
    final int genderSelection;
    final Function onSet;

    GenderFormField({this.icon, this.genderList, this.genderSelection, this.onSet});


    @override
    Widget build(BuildContext context){
        return GestureDetector(
                onTap: (){
                    new Picker(
                            adapter: PickerDataAdapter<String>(pickerdata: genderList),
                            hideHeader: true,
                            title: new Text("Please Select"),
                            onConfirm: (Picker picker, List value) {
                                onSet(this.genderList[value[0]]);
                            }
                    ).showDialog(context);
                },
                child: ListTile(
                               leading: icon,
                               title: Text('gender'),
                               subtitle: Text(genderList[genderSelection]),
                       )
        );
    }
}


class MultiLineTextFormField extends StatelessWidget{

    final String title;
    final String initialValue;
    final Function onChanged;

    MultiLineTextFormField({this.title, this.initialValue, this.onChanged});

    @override
    Widget build(BuildContext context){
        return ListTile(
                title: Text(title),
                subtitle: TextFormField(
                        decoration: InputDecoration(
                                border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                        )
                                )

                        ),
                        initialValue: initialValue,
                        onChanged: onChanged,
                        maxLines: null,
                        maxLength: 200,
                ),
        );
    }
}
