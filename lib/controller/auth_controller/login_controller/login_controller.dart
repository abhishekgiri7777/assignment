import 'package:email_validator/email_validator.dart';
import 'package:fcm_t1/view/home/home_dart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/share_pref/share_pref.dart';
import '../../../core/share_pref/share_pref_constants.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  var emailCtrl = TextEditingController().obs;
  var passwordCtrl = TextEditingController().obs;
  var errorText = "".obs;
  RxBool emailValidate = false.obs;
  var validationStatus = false.obs;
  bool validateForm(BuildContext context) {
    if (loginFormKey.currentState!.validate()) {}

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

  login({required BuildContext context}) async {
    print('validation status :==> ${validateForm(context)}');
    if (validateForm(context) == true) {
      validationStatus.value = true;
      Future.delayed(Duration(seconds: 10), () async {
        var email =
            await SharePrefInstance().read(key: SharePrefConstant().email);
        var password =
            await SharePrefInstance().read(key: SharePrefConstant().password);
        if (email.toString() == emailCtrl.value.text.toString() &&
            passwordCtrl.value.text.toString() == password) {
          Get.to(() => HomeScreen());
        } else {
          errorText.value = "Invalid Credential";
        }
      });
      validationStatus.value = false;
    }
  }
}
