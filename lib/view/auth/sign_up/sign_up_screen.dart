// ignore_for_file: avoid_print

import 'package:fcm_t1/controller/auth_controller/sign_up_controller/sign_up_controller.dart';
import 'package:fcm_t1/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../widgets/custom_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomText(text: "SignUp", color: Colors.white, fontSize: 15),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: controller.formKey,
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
                controller: controller.nameCtrl.value,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]+|\s'))
                ],
                hintText: "Enter your name",
                onChange: (c) {
                  controller.errorText.value = "";
                },
              ),
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
                onTap: () => {controller.submitForm(context: context)},
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
