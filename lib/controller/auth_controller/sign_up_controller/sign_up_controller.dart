import 'package:email_validator/email_validator.dart';
import 'package:fcm_t1/core/share_pref/share_pref.dart';
import 'package:fcm_t1/core/share_pref/share_pref_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view/auth/login/login_screen.dart';

class SignUpController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var errorText = "".obs;
  RxBool emailValidate = false.obs;
  var validationStatus = false.obs;

  var nameCtrl = TextEditingController().obs;
  var emailCtrl = TextEditingController().obs;
  var passwordCtrl = TextEditingController().obs;
  bool validateForm(BuildContext context) {
    if (formKey.currentState!.validate()) {
      //when we use form key then we will write code here
    }
    if (nameCtrl.value.text.isEmpty) {
      errorText.value = "Enter your name";
      return false;
    }
    if (emailCtrl.value.text.isEmpty) {
      errorText.value = "Enter your email";
      return false;
    }
    if (emailValidate.isFalse) {
      errorText.value = "Enter valid email address";
      return false;
    }
    if (passwordCtrl.value.text.isEmpty) {
      errorText.value = "Enter your password";
      return false;
    }
    return true;
  }

  isValidEmail(String email) {
    errorText.value = "";
    if (EmailValidator.validate(email) == true) {
      emailValidate.value = true;
    } else {
      emailValidate.value = false;
    }
  }

  submitForm({required BuildContext context}) async {
    print('validation status :==> ${validateForm(context)}');
    if (validateForm(context) == true) {
      validationStatus.value = true;
      Future.delayed(Duration(seconds: 10), () {
        SharePrefInstance().write(
            key: SharePrefConstant().name,
            value: nameCtrl.value.text.toString());
        SharePrefInstance().write(
            key: SharePrefConstant().email,
            value: emailCtrl.value.text.toString());
        SharePrefInstance().write(
            key: SharePrefConstant().password,
            value: passwordCtrl.value.text.toString());
      });
      Get.to(() => LoginScreen());
      validationStatus.value = false;
    }
  }
}
