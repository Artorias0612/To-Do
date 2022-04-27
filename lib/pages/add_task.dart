import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/constant.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/controllers/textfield_controller.dart';
import 'package:todo_app/models/add_model.dart';

class Add_Task extends StatelessWidget {
  const Add_Task({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        width: Get.width,
        child: Column(

          children: [

            CustomeAppbar(),
            PlaningText(),
            PlaningTextField(),
            AddNoteTextField(),
            AddTaskButton(),
          ],
        ),
      ),
    );
  }
}

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      width: Get.width,
      height: 50,
      margin: EdgeInsets.symmetric(

        horizontal: 20
      ),
      child: ElevatedButton(

        onPressed: () {

          if (Get.find<taskController>().isEditing)
          {

            var task = Get.find<taskController>().tasks[
              Get.find<taskController>().index];

            task.title = Get.find<TextFieldController>().title!.text;
            task.subtitle = Get.find<TextFieldController>().subtitle!.text;
            Get.find<taskController>().tasks[Get.find<taskController>().index] = task;
            
          }         
          else
          {
            Get.find<taskController>().tasks.add(

              AddTask(
              
              
                title: Get.find<TextFieldController>().title!.text,
                subtitle: Get.find<TextFieldController>().subtitle!.text,
                status: false,
              )
            );
          }
          Get.back();
        },
        child: Text(
        
          Get.find<taskController>().isEditing ? 'Edit Task' : 'Add Task',
          style: TextStyle(

            color: Colors.white,
          ),
        ),
        style: TextButton.styleFrom(

          elevation: 0,
          backgroundColor: KLightBlueColor
        ),
      ),
    );
  }
}

class AddNoteTextField extends StatelessWidget {
  const AddNoteTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(

        horizontal: 20,
        vertical: 15
      ),
      child: TextField(

        maxLength: 25,
        cursorColor: KLightBlueColor,
        controller: Get.find<TextFieldController>().subtitle,
        decoration: InputDecoration(

          prefixIcon: Icon(

            Icons.bookmark_add,
            color: Colors.grey.shade300,
          ),
          hintText: 'Add Note',
          counter: Container(),
          border: InputBorder.none
        ),
      ),
    );
  }
}

class PlaningTextField extends StatelessWidget {
  const PlaningTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(

        maxLines: 6,
        cursorHeight: 40,
        cursorColor: KLightBlueColor,
        controller: Get.find<TextFieldController>().title,
        decoration: InputDecoration(

          enabledBorder: UnderlineInputBorder(

            borderSide: BorderSide(color: Colors.grey.shade300)
          ),
          focusedBorder: UnderlineInputBorder(

            borderSide: BorderSide(color: Colors.grey.shade300)
          )
        ),
      ),
    );
  }
}

class PlaningText extends StatelessWidget {
  const PlaningText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(

        top: 30,
        right: 300
      ),
      child: Text(
      
        "What Are you Planing ?",
        style: TextStyle(

          color: Colors.grey[600],
          fontSize: 16,
        ),
      )
    );
  }
}

class CustomeAppbar extends StatelessWidget {
  const CustomeAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Row(

        children: [

          Container(

            margin: EdgeInsets.only(

              top: 10,
              left: 200,
            ),
            child: Text(
            
              Get.find<taskController>().isEditing ? 'Edit Task' : 'Add Task',
              style: TextStyle(

                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),
            ),
          ),

          Container(

            margin: EdgeInsets.only(

              top: 10,
              left: 140
            ),
            child: IconButton(
            
              onPressed: () {

                Get.back();
              },
              icon: Icon(Icons.close),
              iconSize: 25,
              color: Colors.black87,
            ),
          )
        ],
      ),
    );
  }
}