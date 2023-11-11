import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_smart_rent_admin/core/values/app_colors.dart';
import 'package:flutter_smart_rent_admin/core/widget/text_form_field_input.dart';
import 'package:flutter_smart_rent_admin/modules/login/controllers/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/ic_logo_login.png'),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Chào mừng bạn đến với\ntrang điều khiển quản trị',
              style: TextStyle(
                color: primary10,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Đăng nhập để khám phá\ncác tính năng cho quản trị viên',
              style: TextStyle(
                color: secondary40,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            Form(
              key: loginController.formKey,
              onChanged: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormFieldInput(
                      maxLength: 10,
                      textEditingController: loginController.username,
                      labelText: 'Username',
                      hintText: 'Nhập username',
                      textInputType: TextInputType.text,
                      borderRadius: BorderRadius.circular(8),
                      borderWidth: 2,
                      borderColor: primary60,
                      icon: const Icon(Icons.admin_panel_settings),
                      onSaved: (newValue) {},
                      onValidate: (value) {
                        // if (value!.isEmpty || value.length < 10) {
                        //   return 'Vui lòng nhập username';
                        // }
                        return null;
                      },
                      autoCorrect: false,
                      textCapitalization: TextCapitalization.none,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormFieldInput(
                      maxLength: 10,
                      textEditingController: loginController.password,
                      labelText: 'Password',
                      hintText: 'Nhập password',
                      textInputType: TextInputType.text,
                      borderRadius: BorderRadius.circular(8),
                      borderWidth: 2,
                      borderColor: primary60,
                      icon: const Icon(Icons.password_sharp),
                      onSaved: (newValue) {},
                      onValidate: (value) {
                        // if (value!.isEmpty || value.length < 10) {
                        //   return 'Vui lòng nhập password';
                        // }
                        return null;
                      },
                      autoCorrect: false,
                      textCapitalization: TextCapitalization.none,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (loginController.formKey.currentState!.validate()) {
                          loginController.submit();
                        } else {
                          Get.snackbar('title', 'message');
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: primary60),
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Đăng nhập ngay',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     const Text(
                    //       'Bạn chưa có tài khoản?',
                    //       style: TextStyle(
                    //         color: secondary40,
                    //       ),
                    //     ),
                    //     TextButton(
                    //       onPressed: () {},
                    //       child: const Text(
                    //         'Đăng ký ngay',
                    //         style: TextStyle(color: primary60),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
