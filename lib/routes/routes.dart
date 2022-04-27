import 'package:get/get.dart';
import 'package:todo_app/pages/Home.dart';
import 'package:todo_app/pages/add_task.dart';

class Routes {

  static List<GetPage> get pages => [

    GetPage(name: '/home', page: () => Home()),
    GetPage(name: '/add', page: () => Add_Task())
  ];
}