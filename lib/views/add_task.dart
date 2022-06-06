// ignore_for_file: unnecessary_new, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_task_app/helper/popup_dialog.dart';

import '../provider/home_provider.dart';

class AddTask extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController dateController = TextEditingController();

var x= 0xffff9800;
  addTask(BuildContext context){
String title = titleController.text.trim();

    String description = desController.text.trim();
    

    
    if(title.isNotEmpty && description.isNotEmpty){

    Provider.of<HomeProvider>(context,listen: false).addTask(title, description,  false, );
    }else{
     showDialog(context: context, builder: (BuildContext context){
       return  PopUpDialog(title: 'Error',content: 'Fill all fields ',towButton: false, press: () {  },);
     });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(title: const Text('ADD TASK')),
      body: Consumer<HomeProvider>(
        builder: (context, value, child) {
          return  SingleChildScrollView(
            child: Container(
              color: value.tempMainColor,
              child: Column(
              
            children: [
              fieldsHeading(title: 'Title'),
              textField(hintText: 'Enter Title', controller: titleController,maxLines: 1),
               fieldsHeading(title: 'Description'),
              textField(hintText: 'Enter Description', controller: desController,maxLines: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Expanded(
                  child: GlowButton(
                  onPressed: () {
                    value.pickDateTime(context);
                  },
                  color: Colors.white,
                  child: const Text('Pick Time'),
                ),
                ),
                const Spacer(),
              Expanded(
                flex: 2,
                child: Text(value.timeOfDay.toString()),)
            ],
          ),
          
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                
                child: ElevatedButton(onPressed: (){addTask(context);}, child: const Text('ADD'))),
          
               ElevatedButton(onPressed: (){
                value.openFullMaterialColorPicker(context);
       
         
               }, child: const Text('Color'),

           
                 )
            ],
                  )),
          );
        },
       
      ),
    );
  }
  Widget textField(
      {required String hintText, required TextEditingController controller,required int maxLines}) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: TextField(
        maxLines:maxLines ,
        controller: controller,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
             border: const OutlineInputBorder(),
          hintText: hintText,
          fillColor: Colors.grey,
          hintStyle: const TextStyle(fontSize: 20.0, color: Colors.white),
          filled: true,
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }

    Widget fieldsHeading({required String title}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
    );
  }


  Future popUp(BuildContext context ,{required String content,required String title}){
    return showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  backgroundColor: Colors.lightBlue,
    title:  Text(title,style: TextStyle(color: Colors.white)),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         Text(content,style: TextStyle(color: Colors.white)),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close',style: TextStyle(color: Colors.white),),
      ),
    ],
  );
              },
            );
  }
}