// ignore_for_file: avoid_print, unnecessary_null_comparison,

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../core/local_notification.dart';
import '../../view/auth/sign_up/sign_up_screen.dart';

class SplashScreenController extends GetxController {
  final title = "Splash Screen".obs;
  var deviceTokenToSendPushNotification = "".obs;

  @override
  void onInit() async {
    navigateToNext();
    await firebaseInit();
    await getDeviceTokenToSendNotification();
    super.onInit();
  }

  Future<void> getDeviceTokenToSendNotification() async {
    FirebaseMessaging fcm = FirebaseMessaging.instance;
    final token = await fcm.getToken();
    deviceTokenToSendPushNotification.value = token.toString();
    print("Token Value $deviceTokenToSendPushNotification");
  }

  firebaseInit() async {
    // FirebaseMessaging.instance.getInitialMessage().then((message) =>
    //     LocalNotificationService().createanddisplaynotification(message.toString()));

    FirebaseMessaging.onMessage.listen((message) =>
        LocalNotificationService().createanddisplaynotification(message));

    FirebaseMessaging.onMessageOpenedApp.listen((message) =>
        LocalNotificationService().createanddisplaynotification(message));
  }

  checkAuth() {
    bool isLogin =
        false; //here we use sharePref to check user is logged in or not
    if (isLogin == true) {
      // navigate to home page
    } else {
      //navigate to login page
    }
  }

  navigateToNext() {
    Future.delayed(Duration(seconds: 3), () {
      checkAuth();
      Get.to(() => SignUpScreen());
    });
  }
}
