import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
        return ListTile(
                leading: this.icon,
                title: Text(this.title),
                subtitle: Text('01/01/2000'),
        );
    }
}

class GenderFormField extends StatelessWidget{

    final Icon icon;
    final String title;

    GenderFormField({this.icon, this.title});

    @override
    Widget build(BuildContext context){

        return ListTile(
                leading: this.icon,
                title: Text(this.title),
                subtitle: Text('male'),
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
