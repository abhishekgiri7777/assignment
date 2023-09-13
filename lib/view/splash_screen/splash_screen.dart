import 'package:fcm_t1/core/local_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/splash_controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenController controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    LocalNotificationService().initialize(context);
    return Scaffold(
      body: Center(
        child: FlutterLogo(size: 250),
      ),
    );
  }
}
