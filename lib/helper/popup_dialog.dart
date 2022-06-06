// ignore_for_file: deprecated_member_use, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_glow/flutter_glow.dart';

class PopUpDialog extends StatelessWidget {
  final String content;
  final String title;
 final bool towButton ;
 final VoidCallback press;
  const PopUpDialog({Key? key, required this.content, required this.title, required this.towButton, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
                  backgroundColor: Colors.lightBlue,
    title:  Text(title,style: TextStyle(color: Colors.white)),
    content:  Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         Text(content,style: const TextStyle(color: Colors.white)),
      ],
    ),
    actions: <Widget>[
      new TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
    //    textColor: Theme.of(context).primaryColor,
        child: const Text('Close',style: TextStyle(color: Colors.white),),
      ),

           Visibility(
             visible: towButton,
             child:  detailButton(press:press,text: 'Delete'))
    ],
  );
  }
  Widget detailButton({required VoidCallback press, required String text}){
  return GlowButton(
                onPressed: press,
                color: Colors.white,
                child: Text(text),
              );
}
  }

