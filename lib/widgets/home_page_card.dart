import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_task_app/model/task_model.dart';

import '../helper/icon_buttons.dart';
import '../helper/popup_dialog.dart';

class Home_card extends StatelessWidget {
final TaskModel todo;
  final int index;
  final box;

  Home_card(
      {super.key,
   
      required this.index,
      this.box, required this.todo});

  @override
  Widget build(BuildContext context) {
    print(index);
    return AspectRatio(
      aspectRatio: 4 / 2,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(4),
        color: todo.tileColor == null ? Colors.grey : Color(todo.tileColor),
        child: Column(
          children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  todo.dateFormat, // widget.todo!.dateFormat,
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
            Expanded(
              flex: 2,
              child: Container(
                child: Text(
                  todo.title, //     widget.todo.title,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 2,
              child: Text(
                  //widget.todo.description,
                  'The second example uses the same size constraints which require the width and the height to be',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.alarm,
                      color: Theme.of(context).primaryColorLight),
                  label: Text(
                      //      DateFormat('yyyy-MM-dd KK:mm a').format(widget.todo.time),
                    todo.time.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        //  fontFamily: 'Bebas Neue',
                          fontSize: 15,
                          //   color: Colors.blue,
                          color: Theme.of(context).primaryColorLight)),
                ),
                IconButton(
                    onPressed: () async {
                        showDialog(context: context, builder: (BuildContext context){
        return PopUpDialog(title: 'Delete',content: 'Are you sure to delete this ',towButton: true,press: (){
           box.deleteAt(index);

                      print(box!.toString());
                      Navigator.pop(context);
        },);
      });
                     
                    },
                    icon: 
                        const Card_Icons(icon: Icons.delete,color: Colors.red,size: 34,)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
