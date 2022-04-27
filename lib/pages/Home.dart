import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constant.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/controllers/textfield_controller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          Get.find<taskController>().isEditing = false;
          Get.find<TextFieldController>().title!.text = '';
          Get.find<TextFieldController>().subtitle!.text = '';
          Get.toNamed('/add');
        },
        child: Icon(Icons.add),
        elevation: 40,
      ),

      appBar: AppBar(

        backgroundColor: KLightBlueColor,
        elevation: 0,        
      ),
      body: SafeArea(
        child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          TopSection(),
          BottomSection(),
        ],
      )),
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.6,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          )),
      child: Container(
        margin: EdgeInsets.only(left: 50, top: 10, right: 15),
        child: Obx(() => ListView.separated(
            itemBuilder: (context, index) {
              var task = Get.find<taskController>().tasks[index];
              return ListTile(
                title: Text(task.title ?? ''),
                subtitle: Text(task.subtitle ?? ''),
                onTap: () {

                  Get.find<taskController>().isEditing = true;
                  Get.find<taskController>().index = index;
                  Get.find<TextFieldController>().title!.text = task.title!;
                  Get.find<TextFieldController>().subtitle!.text = task.subtitle!;

                  Get.toNamed('/add');
                },
                onLongPress: () {

                  Get.find<taskController>().tasks.removeAt(index);
                  Get.snackbar(
                  
                    'Task Deleting Message', '${Get.find<TextFieldController>().title!.text} Deleted'
                  );
                },
                trailing: Checkbox(
                  onChanged: (value) {

                    task.status = !task.status!;
                    Get.find<taskController>().tasks[index] = task;
                  },
                  value: task.status,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.black54,
                height: 1,
              );
            },
            itemCount: Get.find<taskController>().tasks.length)),
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  const TopSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: KLightBlueColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            margin: EdgeInsets.only(top: 20, left: 50),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.bookmark,
                color: KLightBlueColor,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 60),
            child: Text(
              "All",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 0.5, left: 60),
              child: Obx(() {
                return Text(
                  "${Get.find<taskController>().tasks.length} Tasks", // 3 Task --> 3 Tasks
                  style: TextStyle(color: Colors.white, fontSize: 18),
                );
              }))
        ],
      ),
    );
  }
}
