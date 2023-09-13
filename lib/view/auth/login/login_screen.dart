import 'package:fcm_t1/controller/auth_controller/login_controller/login_controller.dart';
import 'package:fcm_t1/widgets/custom_text.dart';
import 'package:fcm_t1/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title:
              CustomText(text: "Login", color: Colors.white, fontSize: 12.px)),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: controller.loginFormKey,
          child: Column(
            children: [
              Obx(() {
                return Align(
                  alignment: Alignment.topLeft,
                  child: CustomText(
                      text: controller.errorText.value,
                      color: Colors.red,
                      fontSize:
                          controller.errorText.value.isNotEmpty ? 10.px : 0),
                );
              }),
              CustomTextField(
                controller: controller.emailCtrl.value,
                hintText: "Enter your email",
                onChange: controller.isValidEmail,
              ),
              CustomTextField(
                controller: controller.passwordCtrl.value,
                color: controller.passwordCtrl.value.text.isEmpty
                    ? Colors.red
                    : Colors.black,
                hintText: "Enter your password",
                onChange: (c) {
                  controller.errorText.value = "";
                },
              ),
              GestureDetector(
                onTap: () => {controller.login(context: context)},
                child: Container(
                  height: 40,
                  width: MediaQuery.sizeOf(context).width * 0.65,
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: controller.validationStatus.isTrue
                        ? CupertinoActivityIndicator()
                        : CustomText(text: "Submit"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
