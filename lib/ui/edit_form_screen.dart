import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
class EditFormScreen extends StatelessWidget{

    @override
    Widget build(BuildContext context){

        return Scaffold(

                appBar: AppBar(title: Text('Form'),actions: [FlatButton(
                                onPressed: (){

                                },
                                textColor: Colors.white,
                                child: Text('save'),
                )],),
                body: SingleChildScrollView( child: Column(
                                children: [
                                    AvatarFormField(),
                                    SinglelineTextFormField(
                                            icon: Icon(Icons.person),
                                            hintText: 'first name',
                                    ),
                                    SinglelineTextFormField(
                                            icon: Icon(Icons.person),
                                            hintText: 'last name',
                                    ),
                                    DateFormField(
                                            icon: Icon(Icons.calendar_today),
                                            title: 'birth day',
                                    ),
                                    GenderFormField(
                                            icon: Icon(MdiIcons.genderMaleFemale,),
                                            title: 'gender',
                                    ),
                                    MultiLineTextFormField(
                                            title: 'other infomation',
                                    ),

                                    ],
                                    )),
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

    SinglelineTextFormField({this.icon, this.hintText});

    @override
    Widget build(BuildContext context){
        return ListTile(
                leading: icon,
                title: TextFormField(
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

    DateFormField({this.icon, this.title});

    @override
    Widget build(BuildContext context){
        return GestureDetector(
                child: ListTile(
                        leading: this.icon,
                        title: Text(this.title),
                        subtitle: Text('01/01/2000'),
                ),

                onTap: () async {
                    final DateTime picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1990),
                            lastDate: DateTime(2025),
                    );

                },
        );

    }
}

class GenderFormField extends StatelessWidget{

    final Icon icon;
    final String title;

    GenderFormField({this.icon, this.title});

    @override
    Widget build(BuildContext context){

        return GestureDetector(
                onTap: (){
                    
            Navigator.push(context,
                    child: Mater GenderPickerWithImage(
              showOtherGender: true,
              verticalAlignedText: false,
              selectedGender: Gender.Male,
              selectedGenderTextStyle: TextStyle(
                  color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
              unSelectedGenderTextStyle: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.normal),
              onChanged: (Gender gender) {
                print(gender);
              },
              equallyAligned: true,
              animationDuration: Duration(milliseconds: 300),
              isCircular: true,
              // default : true,
              opacityOfGradient: 0.4,
              padding: const EdgeInsets.all(3),
              size: 50, //default : 40
            ));


                },
                child: ListTile(
                               leading: this.icon,
                               title: Text(this.title),
                               subtitle: Text('male'),
                       )
        );

    }


}

class MultiLineTextFormField extends StatelessWidget{

    final String title;

    MultiLineTextFormField({this.title});


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
                        maxLines: null,
                        maxLength: 200,
                ),
        );
    }


}
