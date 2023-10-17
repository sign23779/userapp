import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noduster/const/carwashstring.dart';
import 'package:noduster/const/color.dart';
import 'package:noduster/const/textstyle.dart';
import 'package:noduster/screens/carwash/typeofwash.dart';

class Listofcars extends StatelessWidget {
  const Listofcars({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhitecolor,
      appBar: AppBar(
        title: const Text("Select Your Car"),
        backgroundColor: kappbarcolor,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            }),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Get.to(() => Typeofwash(
                        cartype:
                            Car.cars[index]['type']!.toLowerCase().toString(),
                      ));
                  log(Car.cars[index]['type']!.toLowerCase().toString());
                },
                child: Cars(
                  carimage: Car.cars[index]['carimage']!,
                  type: Car.cars[index]['type']!,
                ),
              ),
          itemCount: Car.cars.length),
    );
  }
}

class Cars extends StatelessWidget {
  const Cars({super.key, required this.carimage, required this.type});
  final String type;
  final String carimage;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(carimage)),
        ),
      ),
      Positioned(
        top: 20,
        left: 50,
        child: Text(
          type,
          style: listofcarimageheading,
        ),
      ),
    ]);
  }
}
