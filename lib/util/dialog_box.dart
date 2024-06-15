import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/util/my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
   DialogBox({super.key, required this.controller,required this.onSave , required this.onCancle});
  final controller;

  VoidCallback onSave;
  VoidCallback onCancle;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 201,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller: controller ,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),),hintText: "Add New Task"),
            ),

            // save, cancle button
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
  children: [
    // Save button
    MyButton(text: "Save", onPressed: onSave),
    const SizedBox(width: 5,),
    // Cancel button
    MyButton(text: "Cancel", onPressed: onCancle),
  ],
)

          ],
        ),
      ),
    );
  }
}
