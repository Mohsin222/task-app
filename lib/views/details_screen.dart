import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:intl/intl.dart';
import 'package:todo_task_app/helper/icon_buttons.dart';
import 'package:todo_task_app/model/task_model.dart';
import 'package:todo_task_app/views/add_task.dart';

class DetailTaskScreen extends StatelessWidget {
 final TaskModel todo;
final int index;
  const DetailTaskScreen({super.key, required this.todo, required this.index}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(20),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text('Task Details',style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),),
          ),
            Expanded(child: Container(
              
              padding: EdgeInsets.all(10),
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
              decoration: BoxDecoration(color: Color(todo.tileColor),
              borderRadius: BorderRadius.circular(20)
              ),
              child:Column(
                children: [

                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(todo.title,style: TextStyle(fontSize: 37),maxLines: 1,)),
                 Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  todo.dateFormat.toString(), // widget.todo!.dateFormat,
                  style: const TextStyle(color: Colors.white),
                ),
                Checkbox(
                  fillColor: MaterialStateProperty.all(
                    Theme.of(context).primaryColorLight,
                  ),
                  value: false,
                  //   value: widget.todo.complete,
                  checkColor: Colors.white,
                  focusColor: Colors.yellow,
                  onChanged: (value) {},
                ),
              ],
            )),
            const Spacer(),
                    Padding(
                     padding:  EdgeInsets.all(20.0),
                     child: Text(todo.description,
                     style: TextStyle(fontSize: 23),
                     maxLines: 10,),
                   ),

const Spacer(),
                       Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.alarm,
                      color: Theme.of(context).primaryColorLight),
                  label: Text(
                    DateFormat('yyyy-MM-dd KK:mm a').format(todo.time,),
                   
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                  //        fontFamily: 'Bebas Neue',
                          fontSize: 15,
                          //   color: Colors.blue,
                          color: Theme.of(context).primaryColorLight)),
                ),
                
                        Card_Icons(icon: Icons.delete, size: 34, color: Colors.red)
              ],
            ),
                ],
              ),
              
            ),),

            //bottom row
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Expanded(
        child:         detailButton(text: 'Back',press: (){
          Navigator.pop(context);
        })
                   ),
                   Expanded(child: Container()),
                             Expanded(
        child: detailButton(text: 'Update',press: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
            return AddTask(
              index: index,
              todo: todo,
            );
          }));
          
        })
                   ),
                ],
              ),
            ),
            
        ],
      
        ),
      ),
    );
  }


Widget detailButton({required VoidCallback press, required String text}){
  return GlowButton(
                onPressed: press,
                color: Colors.grey,
                child: Text(text),
              );
}
  
}