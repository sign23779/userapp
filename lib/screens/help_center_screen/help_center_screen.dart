import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noduster/const/color.dart';
import 'package:noduster/const/const.dart';
import 'package:noduster/screens/numberofvehicles/textfieldwidget.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kblue[100],
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
      ),
      body: ListView(
        children: [
          Container(
            height: 100,
            color: kblue[100],
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 30),
              child: Row(
                children: const [
                  Text(
                    'Help Centre',
                    style: TextStyle(
                        fontFamily: "poppinz",
                        fontSize: 23,
                        color: kblackcolor,
                        fontWeight: FontWeight.bold),
                  ),
                  kwidth10,
                  Icon(
                    Icons.contact_support_outlined,
                    color: kgreycolor,
                    size: 70,
                  ),
                ],
              ),
            ),
          ),
          kheight20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '  Contact us',
                  style: TextStyle(
                      fontFamily: "poppinz",
                      fontSize: 15,
                      color: kgreycolor,
                      fontWeight: FontWeight.w400),
                ),
                TextfieldWidget(
                  hinttext: '+918892013449',
                  enabled: false,
                  hintcolor: kblackcolor,
                ),
                kheight10,
                Text(
                  '  Mail us',
                  style: TextStyle(
                      fontFamily: "poppinz",
                      fontSize: 15,
                      color: kgreycolor,
                      fontWeight: FontWeight.w400),
                ),
                TextfieldWidget(
                  hinttext: 'nodusterapp2023@gmail.com',
                  enabled: false,
                  hintcolor: kblackcolor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
