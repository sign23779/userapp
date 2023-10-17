import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noduster/const/color.dart';
import 'package:noduster/const/const.dart';
import 'package:noduster/screens/onboarding_screen/onboarding_two.dart';
import 'package:noduster/screens/onboarding_screen/widgets/onboarding_button.dart';
import 'package:noduster/screens/onboarding_screen/widgets/onboarding_image.dart';
import 'package:noduster/screens/onboarding_screen/widgets/skipbutton.dart';

class OnboardingOne extends StatelessWidget {
  const OnboardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Skipbutton(),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            const Onboardingimage(
              centralimage: "lib/asset/onboard1image.png",
              backgroundimage: 'lib/asset/onboard1background.png',
            ),
            kheight10,
            Text('Clean your car',
                style: GoogleFonts.lexend(
                    fontSize: 24, fontWeight: FontWeight.w900)),
            Text('Get your car cleaned \nby our experts',
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                    fontSize: 18, color: const Color(0xff80868b))),
            kheight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  maxRadius: 5,
                  backgroundColor: kappbarcolor,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    maxRadius: 5,
                    backgroundColor: Color(0xffbdc1c6),
                  ),
                ),
                CircleAvatar(maxRadius: 5, backgroundColor: Color(0xffbdc1c6))
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            OnboardingButton(
              title: "Continue",
              ontap: () {
                Get.to(() => const OnboardingTwo());
              },
            )
          ],
        ),
      )),
    );
  }
}
