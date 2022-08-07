import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todo_task_app/model/task_model.dart';
import 'package:todo_task_app/prac/color.dart';

import 'package:todo_task_app/views/details_screen.dart';

import '../provider/home_provider.dart';
import '../widgets/home_card.dart';
import '../widgets/home_page_card.dart';
import 'a1.dart';
import 'add_task.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
      HomeProvider homeProvider = Provider.of<HomeProvider>(context,listen: false);
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        
        backgroundColor: Colors.white,
        onPressed: (){
           Provider.of<HomeProvider>(context,listen: false).titleController.text='';
            Provider.of<HomeProvider>(context,listen: false).desController.text='';
    
     Navigator.push(context, MaterialPageRoute(builder: (context){
       return AddTask();
     })); 
    //      Navigator.push(context, MaterialPageRoute(builder: (context){
    //    return A1();
    //  })); 
    
        },child: Icon(Icons.add,color: Colors.black,size: 45,),),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title:Text('TODO APP',style: TextStyle(fontSize: 26,color: Colors.white,letterSpacing: 2,fontWeight: FontWeight.bold),),
        actions: [


        ],
      ),
      backgroundColor: Colors.black,

      body: ValueListenableBuilder(
                  valueListenable: Hive.box<TaskModel>('tasks').listenable(),
                  builder: (context, Box<TaskModel> box, _){
    if (box.values.isEmpty) {
              return const Center(
                child: Text('No Data Available',style: TextStyle(color: Colors.white,fontSize: 25),)
              );
            }else{
return ListView.builder(

          itemCount: box.length,
        itemBuilder: ((context, index) {
             TaskModel? todo = box.getAt(index);
            //  List a =[];
            //  a.add(todo!.title);

            //  homeProvider.newList.add(todo);
        //     log( todo.title);

     //   homeProvider.newList=a;

      

        return InkWell(
          onTap: (){
           
            //  print(   homeProvider.searchNotes(todo!.title.toString()));
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


class MySearchDelegate extends SearchDelegate{
  @override
  Widget? buildLeading(BuildContext context) =>IconButton(onPressed: (){close(context, null);}, icon: Icon(Icons.arrow_back));

@override
List<Widget>? buildActions(BuildContext context) =>[
IconButton(onPressed: (){
  if(query.isEmpty){
    close(context, null);
  }else{
     query='';
  }
 
}, icon: Icon(Icons.clear))
];
@override
Widget buildResult(BuildContext context)=>Container(
  child: Text(query),
);

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions =[
      'ali',
      'amir',
      'sjora',
      'll'
    ];

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
      return ListTile(
        onTap: (){
      query=    suggestion;
      showResults(context);
        },
        title: Text(suggestion),
      );
    });
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}