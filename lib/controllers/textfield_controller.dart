import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TextFieldController extends GetxController{

  TextEditingController? title;
  TextEditingController? subtitle;

  @override
  void onInit() {

    title = TextEditingController();
    subtitle = TextEditingController();
    super.onInit();
  }
}