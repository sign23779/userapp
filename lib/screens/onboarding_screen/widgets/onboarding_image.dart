import 'package:flutter/cupertino.dart';

class Onboardingimage extends StatelessWidget {
  const Onboardingimage(
      {super.key, required this.backgroundimage, required this.centralimage});
  final String backgroundimage;
  final String centralimage;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(backgroundimage), fit: BoxFit.fitHeight)),
      child: Center(
          child: SizedBox(
        height: 160,
        child: Image.asset(
          centralimage,
          fit: BoxFit.contain,
        ),
      )),
    );
  }
}
