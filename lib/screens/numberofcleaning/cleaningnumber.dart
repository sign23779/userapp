import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noduster/const/color.dart';
import 'package:noduster/const/const.dart';
import 'package:noduster/controller/pricecontroller.dart';
import 'package:noduster/screens/addres_screen/map_screen.dart';
import 'package:noduster/screens/numberofvehicles/quantitywidget.dart';
import 'package:noduster/screens/numberofvehicles/textfieldwidget.dart';

class Numberofcleaning extends StatelessWidget {
  Numberofcleaning(
      {Key? key,
      required this.room,
      required this.mainservice,
      required this.bikeorcar})
      : super(key: key);
  final String room;
  final String mainservice;
  final String bikeorcar;

  final ButtonStyle style =
      ElevatedButton.styleFrom(backgroundColor: kappbarcolor);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BikePriceController>(
        init: BikePriceController(),
        builder: (c) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: kappbarcolor,
              title: const Text(
                "Enter The Details",
                style: TextStyle(
                  fontFamily: "poppinz",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              elevation: 1,
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                    c.bikerate = 0;
                    c.quantity = 1;
                    c.update();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                  )),
            ),
            body: GetBuilder<BikePriceController>(builder: (c) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        kheight20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "No.of $room",
                              style: const TextStyle(
                                fontFamily: "poppinz",
                                overflow: TextOverflow.fade,
                                fontSize: 16,
                                color: kblackcolor,
                                fontWeight: FontWeight.w400,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            QuantityWidget(
                              color: kblackcolor,
                              onPressAdd: () {
                                c.addQuantity();
                              },
                              onPressSub: () {
                                c.subQuantity();
                              },
                              quantity: c.quantity.toString(),
                            ),
                          ],
                        ),
                        kheight20,
                        TextfieldWidget(
                            hinttext: "Rate = ${c.bikerate}",
                            enabled: false,
                            hintcolor: kblackcolor),
                        kheight20,
                        TextfieldWidget(
                            hinttext: 'Total price = ${c.totalprice}',
                            enabled: false,
                            hintcolor: kblackcolor),
                      ],
                    ),
                    Positioned(
                        left: 100,
                        right: 100,
                        bottom: 100,
                        child: ElevatedButton(
                          style: style,
                          onPressed: () {
                            Get.to(() => MapScreen(
                                  bikeorcar: bikeorcar,
                                  rate: c.bikerate.toString(),
                                  totalprice: c.totalprice,
                                  quantity: c.quantity.toString(),
                                  service: room,
                                  mainservice: mainservice,
                                ));
                          },
                          child: const Text("Continue"),
                        ))
                  ],
                ),
              );
            }),
          );
        });
  }
}
