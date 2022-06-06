import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePageCard extends StatelessWidget {





 

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff010920),
    //  color: Theme.of(context).backgroundColor,
      elevation: 5,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height / 4,
        decoration: BoxDecoration(
          // color: const Color(0xff252e41),

          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          //    border: Border.all(color: Colors.red)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //created date
                Text(
            'date' ,    // widget.todo!.dateFormat,
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
                  onChanged: (value) {
                    // setState(() {
                    //   widget.todo.complete = value!;
                    // });

                    // print(widget.todo.complete);
                    // widget.box.putAt(
                    //     widget.index,
                    //     TodoModel(
                    //         title: widget.todo.title,
                    //         description: widget.todo.description,
                    //         dateFormat: widget.todo.dateFormat,
                    //         complete: widget.todo.complete,
                    //         time: widget.todo.time));
                  },
                ),
              ],
            ),
            //title
            Container(
              child: Text(
       'title',    //     widget.todo.title,
                maxLines: 1,
                style: const TextStyle(
               //   fontFamily: 'Akaya Telivigala',
                  fontSize: 30,
                  color: Colors.white,
                  //  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            //description
            Text(
              //widget.todo.description,
              'description',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  //fontFamily: 'Akaya Telivigala',
                  // decoration: widget.todo.complete == true
                  //     ? TextDecoration.lineThrough
                  //     : TextDecoration.none,
                  fontSize: 15,
                  color: Colors.white,
                )),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.alarm,
                      color: Theme.of(context).primaryColorLight),
                  label: Text(
                //      DateFormat('yyyy-MM-dd KK:mm a').format(widget.todo.time),
                'date',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Bebas Neue',
                          fontSize: 15,
                          //   color: Colors.blue,
                          color: Theme.of(context).primaryColorLight)),
                ),
                IconButton(
                    onPressed: () async {
           
                    },
                    icon: Icon(Icons.delete,
                        size: 34, color: Theme.of(context).primaryColorLight))
              ],
            ),
          ],
        ),
      ),
    );
  }
}