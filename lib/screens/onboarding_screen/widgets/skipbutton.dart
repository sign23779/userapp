import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noduster/const/color.dart';
import 'package:noduster/screens/onboarding_screen/onboarding_three.dart';

class Skipbutton extends StatelessWidget {
  const Skipbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Get.off(() => const OnboardingThree());
        },
        child: const Text(
          'Skip',
          style: TextStyle(color: kappbarcolor, fontSize: 19),
        ));
  }
}
