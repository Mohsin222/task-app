
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_task_app/views/home_page.dart';
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

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('ADD TASK',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Consumer<HomeProvider>(
        builder: (context, value, child) {


          return SingleChildScrollView(
            child: Container(
                //color: Colors.black,
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
                                DateFormat('yyyy-MM-dd KK:mm a')
                                    .format(DateTime.now()),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(15),
                      child: ElevatedButton(
                        onPressed: () {
                          value.openFullMaterialColorPicker(context);
                        },
                        child: Text('Color',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,letterSpacing: 2,color: Colors.black),),
                        style: ElevatedButton.styleFrom(
                            primary: value.tempMainColor ?? Colors.white),
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
                               
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
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
          fillColor: Colors.white,
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
          style: const TextStyle(color: Colors.white,letterSpacing: 1, fontSize: 24),
        ),
      ),
    );
  }
}
