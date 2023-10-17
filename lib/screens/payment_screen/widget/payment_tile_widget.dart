import 'package:flutter/material.dart';
import 'package:noduster/const/color.dart';

// ignore: must_be_immutable
class PaymentMethodsTile extends StatelessWidget {
  PaymentMethodsTile(
      {Key? key,
      this.title,
      this.imageUrl,
      this.radiobutton,
      required this.onTap})
      : super(key: key);
  final String? title;
  final String? imageUrl;
  final Widget? radiobutton;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SizedBox(
        width: 300,
        child: ListTile(
            onTap: onTap,
            contentPadding: const EdgeInsets.all(5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: NetworkImage(imageUrl.toString())),
                  // borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff35383F)),
            ),
            tileColor: kwhitecolor,
            title: Text(
              '$title',
              style: const TextStyle(
                  color: kblackcolor,
                  fontWeight: FontWeight.w400,
                  fontSize: 17),
            ),
            trailing: radiobutton),
      ),
    );
  }
}
