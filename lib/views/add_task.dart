// ignore_for_file: unnecessary_new, deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_task_app/helper/popup_dialog.dart';
import 'package:todo_task_app/model/task_model.dart';

import '../helper/glow_btn.dart';
import '../provider/home_provider.dart';

class AddTask extends StatelessWidget {
  final index;
  final todo;

  AddTask({Key? key, this.index, this.todo}) : super(key: key);
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  addTask(BuildContext context) {
// String title = titleController.text.trim();

//     String description = desController.text.trim();
    if (index != null) {
//   Provider.of<HomeProvider>(context,listen: false).dateTime=todo.time;
      Provider.of<HomeProvider>(context, listen: false)
          .addTask(todo: todo, context: context, index: index);
    } else {
      Provider.of<HomeProvider>(context, listen: false)
          .addTask(context: context, index: -1);
    }
  }

  setOldValues(BuildContext context) {
    if (index != null) {
      Provider.of<HomeProvider>(context, listen: false).setOldValues(todo!);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    setOldValues(context);
    // print(todo.complete);
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: const Text('ADD TASK'),
        automaticallyImplyLeading: false,
      ),
      body: Consumer<HomeProvider>(
        builder: (context, value, child) {
 

          return SingleChildScrollView(
            child: Container(
                color: Colors.black,
   
                child: Column(
                  children: [
                    fieldsHeading(title: 'Title'),
                    textField(
                        hintText: '',
                        controller: value.titleController,
                        maxLines: 1),
                    fieldsHeading(title: 'Description'),
                    textField(
                        hintText: 'Enter Description',
                        controller: value.desController,
                        maxLines: 5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GlowButton(
                              onPressed: () {
                                value.pickDateTime(context);
                              },
                              color: Colors.white,
                              child: const Text('Pick Date Time'),
                            ),
                          ),
                          const Spacer(),
                          Expanded(
                              flex: 1,
                              child: Text(
                                value.dateTime.toString(),
                                style:
                                    TextStyle(fontSize: 16, color: Colors.white),
                              )),
                        ],
                      ),
                    ),

               
Divider(color: Colors.black,),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(15),
                      child: ElevatedButton(
                        onPressed: () {
                          value.openFullMaterialColorPicker(context);
                        },
                        child: Text('Color'),
                        style: ElevatedButton.styleFrom(
                            primary: Color(value.oldColor)
                            
                            //   primary: Colors.red
                            ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Glow_btn(
                                  text: 'Back',
                                  press: () {
                                  //  value.resetValues();
                                    Navigator.pop(context);
                                  })),
                          Expanded(child: Container()),
                          Expanded(
                              child: Glow_btn(
                                  text: 'Update',
                                  press: () {
                                    addTask(context);
                                  })),
                        ],
                      ),
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }

  Widget textField(
      {required String hintText,
      required TextEditingController controller,
      required int maxLines}) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: TextField(
        maxLines: maxLines,
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
}
