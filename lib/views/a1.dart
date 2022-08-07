import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:todo_task_app/model/task_model.dart';
import 'package:todo_task_app/provider/home_provider.dart';

class A1 extends StatelessWidget {
  const A1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context,listen: false);
   return Scaffold(
    body: FutureBuilder<Map>(
    //  future:homeProvider.fetch() ,
    builder: (context,AsyncSnapshot  snapshot){
      
   
      if(snapshot.hasError){
        return Center(child: Text('ERROR'),);
      }
      if(snapshot.hasData){

  
        return ListView.builder(
itemCount: snapshot.data!.length,
          itemBuilder: (context,index){
 TaskModel taskModel = TaskModel.fromJson(snapshot.data);
 

 //print(snapshot.data);

return Text(taskModel.dateFormat.toString());
        });
      }
      else{
        return Text('aaa');
      }
    },),
   ); 
  }
}