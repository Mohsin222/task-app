import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_task_app/model/task_model.dart';
import 'package:todo_task_app/prac/color.dart';
import 'package:todo_task_app/views/details_screen.dart';

import '../widgets/home_card.dart';
import '../widgets/home_page_card.dart';
import 'add_task.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade900,
        onPressed: (){
     Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTask())); 
      //   Navigator.push(context, MaterialPageRoute(builder: (context)=>COls())); 
        },child: Icon(Icons.add),),
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,

      body: ValueListenableBuilder(
                  valueListenable: Hive.box<TaskModel>('tasks').listenable(),
                  builder: (context, Box<TaskModel> box, _){
    if (box.values.isEmpty) {
              return const Center(
                child: Text('No Data Available'),
              );
            }else{
return ListView.builder(
          itemCount: box.length,
        itemBuilder: ((context, index) {
             TaskModel? todo = box.getAt(index);
      
        
        return InkWell(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailTaskScreen(todo: todo!,index:index)));
          },
          child: Home_card(
            index: index,
        todo: todo!,
            box: box,
          ),
        );
      }));
            }
                  }
      )
    );
  }
}

