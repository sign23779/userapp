import 'package:flutter/material.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({
    Key? key,
    required this.ontap,
    required this.title,
    this.buttoncolor,
  }) : super(key: key);

  final String title;
  final void Function() ontap;
  final Color? buttoncolor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(340, 40),
        backgroundColor: buttoncolor ?? const Color(0xff537fe7),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 19),
      ),
    );
  }
}
