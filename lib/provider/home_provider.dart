
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:todo_task_app/model/task_model.dart';

class HomeProvider extends ChangeNotifier {

  DateTime newDate=DateTime.now();
  void addTask(String title, String description,
      bool isComplete, ) async {
    Box<TaskModel> todoBox = Hive.box<TaskModel>('tasks');
    todoBox.add(TaskModel(
        title: title,
        description: description,
        dateFormat: DateFormat('yyyy-MM-dd KK:mm a').format(DateTime.now()),
        complete: isComplete,
        time: dateTime,
        tileColor: tempMainColor!.value));

    notifyListeners();
  }

  ColorSwatch? tempMainColor;
 
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
                print(tempMainColor!.value);
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





DateTime dateTime =DateTime.now();
TimeOfDay? timeOfDay;
  Future<TimeOfDay?> pickTime(BuildContext context) async{
  
  timeOfDay= await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));
        notifyListeners();
        
  
    return timeOfDay;
      
  }

    Future<DateTime?> pickDate(BuildContext context)async {

   dateTime= (await   showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2200)))!;

      notifyListeners();
      return dateTime;
    }
    

      Future pickDateTime(BuildContext context) async {
    DateTime? date = await pickDate(context);
    print(date);
    if (date == null) return;

    TimeOfDay? time = await pickTime(context);
    if (time == null) return;
  
    final newTime =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);

dateTime=newTime;
print(dateTime);
notifyListeners();
  }

}
