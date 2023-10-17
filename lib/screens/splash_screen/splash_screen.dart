import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noduster/const/color.dart';
import 'package:noduster/controller/dependency/shared_pref_controller/shared_pref_ctrl.dart';
import 'package:noduster/screens/login_screen/islogin.dart';
import 'package:noduster/screens/onboarding_screen/onboarding_one.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> gotosplashone() async {
    bool? firstTime = await SharedPref.find.getFirstTime();

    if (firstTime ?? true) {
      SharedPref.find.setFirstTime(false);
      await Future.delayed(
        const Duration(seconds: 3),
        () {
          Get.to(() => const OnboardingOne());
        },
      );
    } else {
      Get.to(() => const IsLogin());
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      gotosplashone();
    });

    return Scaffold(
      backgroundColor: kappbarcolor,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'lib/asset/logo.png',
              width: double.infinity,
              height: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              "NO DUSTER",
              style: TextStyle(
                  color: kwhitecolor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            )
          ]),
    );
  }
}
