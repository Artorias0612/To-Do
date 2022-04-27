import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/models/add_model.dart';

class taskController extends GetxController{

  bool isEditing = false;
  int index = 0;
  RxList<AddTask> tasks = <AddTask>[].obs;

  @override
  void onInit() {
    
    var box = GetStorage();

    if (box.read('tasks') != null)
    {

      var list = box.read('tasks');
      for (var item in list)
      {

        tasks.add(AddTask.fromJson(item));
      }
    }

    ever(tasks, (value) {

      box.write('tasks', tasks.toJson());
    });
    super.onInit();
  }
}