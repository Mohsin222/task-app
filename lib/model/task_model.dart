import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String description;

  @HiveField(2)
  late String dateFormat;

  @HiveField(3)
  bool complete = false;

  @HiveField(4)
  DateTime time;


  @HiveField(5)
  var tileColor;

  



  TaskModel(
      {required this.title,
      required this.description,
      required this.dateFormat,
      required this.complete,
      required this.time,
      required this.tileColor

      });

 factory TaskModel.fromJson(Map<dynamic,dynamic>data){
  return TaskModel(
    title: data['title'].toString() , 
  description: data['description'] ?? 'SWS',
   dateFormat: data['dateFormat'].toString(),
   complete: data['complete'] ?? false,
    time:DateTime.now(),
    tileColor: data['tileColor'].toString()
    );
 }


 Map<String,dynamic> toMapss(){
     return {
       'title': this.title,
        'description': this.description,
        'time': this.time.toIso8601String(),
        'tileColor': this.tileColor,
        'dateFormat': this.dateFormat, 
         'complete':this.complete
     };
  }

  // where(Function(dynamic element) param0) {}


}
