import 'package:get/get.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/controllers/textfield_controller.dart';

class app_Bindings extends Bindings{
  
  @override
  void dependencies() {
    
    Get.lazyPut(() => taskController());
    Get.put(TextFieldController());
  }
}