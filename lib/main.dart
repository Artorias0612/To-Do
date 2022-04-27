import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:todo_app/bindings/bindings.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/routes/routes.dart';

void main() async {

  await GetStorage.init();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      getPages: Routes.pages,
      initialBinding: app_Bindings(),
      initialRoute: '/home',
    );
  }
}