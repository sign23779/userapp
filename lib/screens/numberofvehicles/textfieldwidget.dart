import 'package:flutter/material.dart';
import 'package:noduster/const/color.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({
    this.validator,
    super.key,
    required this.hinttext,
    this.onChanged,
    this.controller,
    this.hintcolor,
    this.suffixIcon,
    this.labeltext,
    this.enabled,
  });
  final String hinttext;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool? enabled;
  final String? labeltext;
  final Color? hintcolor;

  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      enabled: enabled,
      onChanged: onChanged,
      controller: controller,
      cursorColor: kblackcolor,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: kwhitecolor,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kblackcolor),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kblackcolor),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        hintText: hinttext,
        labelText: labeltext,
        hintStyle: TextStyle(color: hintcolor ?? kgreycolor),
        labelStyle: const TextStyle(color: kgreycolor),
      ),
    );
  }
}
