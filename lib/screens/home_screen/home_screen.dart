import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noduster/const/const.dart';
import 'package:noduster/const/homescreenstring.dart';
import 'package:noduster/const/textstyle.dart';
import 'package:noduster/controller/dependency/dependency.dart';
import 'package:noduster/screens/bikewash/bikewash.dart';
import 'package:noduster/screens/carwash/list_of_cars.dart';
import 'package:noduster/screens/cleaningscreen/cleaningwidget.dart';
import 'package:noduster/screens/home_screen/widget/banners.dart';
import 'package:noduster/screens/home_screen/widget/homeappbar.dart';
import 'package:noduster/screens/home_screen/widget/washingicons.dart';
import 'package:noduster/screens/menu_screen/menu_screen.dart';
import 'package:noduster/screens/servicescreen/servicescreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  get mydrawer => const MenuScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: mydrawer,
      drawerEdgeDragWidth: 100,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60), child: Homeappbar()),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageViewWidget(
              banner: Homescreenstrings.homescreenbanner,
            ),
            kheight10,
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Washing',
                style: khomemainheading,
              ),
            ),
            kheight10,
            SizedBox(
              height: 200,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const Divider(endIndent: 15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    log(Homescreenstrings.washing[index]['Washing']
                        .toLowerCase()
                        .replaceAll('\n', '')
                        .trim()
                        .toString());
                    if (Homescreenstrings.washing[index]['Washing']
                            .toLowerCase()
                            .replaceAll('\n', '')
                            .trim() ==
                        'bikewashing') {
                      Get.to(() => const Bikewash());
                    } else {
                      Get.to(() => const Listofcars());
                    }
                  },
                  child: Washingicons(
                      image: Homescreenstrings.washing[index]['image'],
                      name: Homescreenstrings.washing[index]['Washing']),
                ),
                itemCount: Homescreenstrings.washing.length,
              ),
            ),
            kheight20,
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Cleaning',
                style: khomemainheading,
              ),
            ),
            kheight10,
            SizedBox(
              height: 200,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const Divider(endIndent: 5),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    cleaningcontroller.cleaningdata(Homescreenstrings
                        .cleaning[index]['name']!
                        .toLowerCase()
                        .replaceAll('\n', '')
                        .trim());
                    Get.to(() => CleaningScreen(
                        name: Homescreenstrings.cleaning[index]['name']!
                            .toLowerCase()
                            .replaceAll('\n', '')
                            .trim()));
                  },
                  child: Washingicons(
                      image: Homescreenstrings.cleaning[index]['image']!,
                      name: Homescreenstrings.cleaning[index]['name']!),
                ),
                itemCount: Homescreenstrings.cleaning.length,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Service',
                style: khomemainheading,
              ),
            ),
            kheight10,
            SizedBox(
              height: 200,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const Divider(endIndent: 15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Get.to(() => ServiceScreen(
                        name: Homescreenstrings.service[index]['name']!
                            .toLowerCase()
                            .replaceAll('\n', '')
                            .trim()));
                    log(Homescreenstrings.service[index]['name']!
                        .toLowerCase()
                        .replaceAll('\n', ''));
                  },
                  child: Washingicons(
                      image: Homescreenstrings.service[index]['image'],
                      name: Homescreenstrings.service[index]['name']),
                ),
                itemCount: Homescreenstrings.service.length,
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.only(left: 15),
            //   child: Text(
            //     'Catch your deal',
            //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Column(children: [
            //     kheight10,
            //     Image.asset(Homescreenstrings.dealsimage[0]),
            //     kheight10,
            //     Image.asset(Homescreenstrings.dealsimage[1]),
            //     kheight10,
            //     Image.asset(Homescreenstrings.dealsimage[2])
            //   ]),
            // )
          ],
        ),
      ),
    );
  }
}
