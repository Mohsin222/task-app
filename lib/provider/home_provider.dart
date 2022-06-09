
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:todo_task_app/helper/popup_dialog.dart';

import 'package:todo_task_app/model/task_model.dart';
import 'package:todo_task_app/views/home_page.dart';

class HomeProvider extends ChangeNotifier {

  
DateTime dateTime =DateTime.now();
TimeOfDay? timeOfDay;
 TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();

    var oldColor =0xff005757;

String description='';

String title ='';



@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('despsoe');
titleController.dispose();
desController.dispose();

  }


 
void setOldValues(TaskModel? todo){
  titleController.text=todo!.title;
  desController.text=todo.description;
  dateTime==todo.time;
//  var x= todo.tileColor;
//tempMainColor=todo.tileColor;
  //tempMainColor=x;
  oldColor=todo.tileColor;
print(todo.tileColor);

notifyListeners();
}
// void resetValues(){
//    titleController.text='';
//    desController.text='';
//    oldColor=0xff005757;
//    notifyListeners();
// }


  void addTask( {required BuildContext context ,required int  index, TaskModel? todo} ) async {
title = titleController.text.trim();
     description = desController.text.trim();

    Box<TaskModel> todoBox = Hive.box<TaskModel>('tasks');


    
   if(index==-1){
     if(title.isNotEmpty && description.isNotEmpty && tempMainColor !=null ){
      todoBox.add(TaskModel(
        title: title,
        description: description,
        dateFormat: DateFormat('yyyy-MM-dd KK:mm a').format(DateTime.now()),
        complete: false,
        time: dateTime,
        tileColor: tempMainColor!.value));

     
      
        notifyListeners();

           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
      
   }else{
      showDialog(context: context, builder: (BuildContext context){
       return  PopUpDialog(title: 'Error',content: 'Fill all fields ',towButton: false, press: () {  },);
     });
   }
   }else{
     titleController.text=todo!.title;
     desController.text=todo.description;
     dateTime =todo.time;
// tempMainColor=todo.tileColor ;
     if(title.isNotEmpty && description.isNotEmpty  ){
      todoBox.putAt(index,TaskModel(
        title:title,
        description: description,
        dateFormat: DateFormat('yyyy-MM-dd KK:mm a').format(DateTime.now()),
        complete: todo.complete,
        time: dateTime,
        tileColor: tempMainColor!.value));

       // tempMainColor=null;
    
        notifyListeners();

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
        
   }else{
      showDialog(context: context, builder: (BuildContext context){
       return  PopUpDialog(title: 'Error',content: 'Fill all fields ',towButton: false, press: () {  },);
     });
   }
   }

    notifyListeners();
  }


//color pick
  ColorSwatch? tempMainColor=Colors.greenAccent;
 
  ColorSwatch? _mainColor = Colors.blue;

  void openDialog(String title, Widget content, BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title),
          content: content,
          actions: [
            TextButton(
              child: Text('CANCEL'),
              onPressed: Navigator.of(context).pop,
            ),
            TextButton(
              child: Text('SUBMIT'),
              onPressed: () {
      
                Navigator.of(context).pop();
                notifyListeners();

              },
            ),
          ],
        );
      },
    );
  }

  void openFullMaterialColorPicker(BuildContext context) async {
    openDialog(
        "Full Material Color picker",
        MaterialColorPicker(
          colors: fullMaterialColors,
          selectedColor: _mainColor,
          //    onMainColorChange: (color) => setState(() => _tempMainColor = color),
          onMainColorChange: (color) => tempMainColor = color,
          
        ),
        
        context);
        
  }






//pick time
  Future<TimeOfDay?> pickTime(BuildContext context) async{
  
  timeOfDay= await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));
        notifyListeners();
    return timeOfDay;
      
  }

//pick date
    Future<DateTime?> pickDate(BuildContext context)async {
   dateTime= (await   showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2200)))!;

      notifyListeners();
      return dateTime;
    }
    
//call data and time togather
      Future pickDateTime(BuildContext context) async {
    DateTime? date = await pickDate(context);
 
    if (date == null) return;

    TimeOfDay? time = await pickTime(context);
    if (time == null) return;
  
    final newTime =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);

dateTime=newTime;

notifyListeners();
  }

}
