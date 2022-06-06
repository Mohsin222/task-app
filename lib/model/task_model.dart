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


}
