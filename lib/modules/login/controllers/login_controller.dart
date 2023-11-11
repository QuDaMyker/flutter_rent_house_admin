import 'package:flutter/material.dart';
import 'package:flutter_smart_rent_admin/modules/root/views/root_screen.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  late TextEditingController username;
  late TextEditingController password;
  late GlobalKey<FormState> formKey;

  @override
  void onInit() async {
    formKey = GlobalKey<FormState>();
    username = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  void submit() async {
    if (username.text == 'admin' && password.text == 'admin') {
      Get.offAll(const RootScreen());
    } else {
      Get.snackbar('Error', 'Authentication Failed');
    }
  }
}
