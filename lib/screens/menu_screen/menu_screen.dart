import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noduster/const/color.dart';
import 'package:noduster/const/const.dart';
import 'package:noduster/screens/booking_status/booking_status_screen.dart';
import 'package:noduster/screens/help_center_screen/help_center_screen.dart';
import 'package:noduster/screens/login_screen/islogin.dart';
import 'package:noduster/screens/profilescren/profile.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: [
      Expanded(
        flex: 0,
        child: AppBar(
          backgroundColor: kwhitecolor,
          elevation: 0,
          toolbarHeight: 200,
          centerTitle: true,
          title: SizedBox(
              height: 120,
              width: 140,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      "lib/asset/Homescreen/appbarimage.png",
                    ),
                  ),
                  kheight10,
                  Text(
                    "NO DUSTER",
                    style: TextStyle(
                      fontFamily: "poppinz",
                      fontSize: 18,
                      color: kindigo[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          decoration: const BoxDecoration(
              color: Color(0xff537fe7),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kheight30,
                kheight20,
                InkWell(
                  onTap: () {
                    Get.to(() => ProfileScreen());
                  },
                  child: const Text(
                    "Profile",
                    style: TextStyle(
                        fontFamily: "poppinz",
                        fontSize: 18,
                        color: kwhitecolor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                kheight20,
                InkWell(
                  onTap: () {
                    Get.to(() => const HelpCenterScreen());
                  },
                  child: const Text(
                    "Help Center",
                    style: TextStyle(
                        fontFamily: "poppinz",
                        fontSize: 18,
                        color: kwhitecolor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                kheight20,
                const Text(
                  "Share",
                  style: TextStyle(
                      fontFamily: "poppinz",
                      fontSize: 18,
                      color: kwhitecolor,
                      fontWeight: FontWeight.bold),
                ),
                kheight20,
                const Text(
                  "My Rating",
                  style: TextStyle(
                      fontFamily: "poppinz",
                      fontSize: 18,
                      color: kwhitecolor,
                      fontWeight: FontWeight.bold),
                ),
                kheight20,
                InkWell(
                  onTap: () => Get.to(const BookingStatusScreen()),
                  child: const Text(
                    "My Bookings",
                    style: TextStyle(
                        fontFamily: "poppinz",
                        fontSize: 18,
                        color: kwhitecolor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Expanded(child: kheight20),
                InkWell(
                  onTap: () {
                    FirebaseAuth.instance
                        .signOut()
                        .then((value) => Get.offAll(const IsLogin()));
                  },
                  child: const Text(
                    "Log out",
                    style: TextStyle(
                        fontFamily: "poppinz",
                        fontSize: 18,
                        color: kwhitecolor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                kheight30
              ],
            ),
          ),
        ),
      ),
    ]));
  }
}
