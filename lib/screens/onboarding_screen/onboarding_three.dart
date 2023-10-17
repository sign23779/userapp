import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noduster/const/color.dart';
import 'package:noduster/const/const.dart';
import 'package:noduster/screens/login_screen/islogin.dart';
import 'package:noduster/screens/onboarding_screen/widgets/onboarding_button.dart';
import 'package:noduster/screens/onboarding_screen/widgets/onboarding_image.dart';

class OnboardingThree extends StatelessWidget {
  const OnboardingThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 80,
            ),
            const Onboardingimage(
              centralimage: "lib/asset/onboard3image.png",
              backgroundimage: 'lib/asset/onboard3background.png',
            ),
            kheight20,
            Text('Cleaning Service,\n At your fingertips',
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                    fontSize: 24, fontWeight: FontWeight.w900)),
            Text('Dedicated service buddy \n at your service',
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                    fontSize: 18, color: const Color(0xff80868b))),
            Text('',
                style: GoogleFonts.lexend(
                    fontSize: 18, color: const Color(0xff80868b))),
            kheight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  maxRadius: 5,
                  backgroundColor: Color(0xffbdc1c6),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    maxRadius: 5,
                    backgroundColor: Color(0xffbdc1c6),
                  ),
                ),
                CircleAvatar(
                  maxRadius: 5,
                  backgroundColor: kappbarcolor,
                ),
              ],
            ),
            kheight20,
            OnboardingButton(
              title: "Get Started",
              ontap: () {
                Get.to(() => const IsLogin());
              },
            )
          ],
        ),
      )),
    );
  }
}
