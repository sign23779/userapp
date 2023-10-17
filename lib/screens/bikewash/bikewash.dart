import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noduster/const/color.dart';
import 'package:noduster/const/const.dart';
import 'package:noduster/const/textstyle.dart';
import 'package:noduster/controller/pricecontroller.dart';
import 'package:noduster/screens/cleaningscreen/widget/pricewidget.dart';
import 'package:noduster/screens/numberofvehicles/numberofvehicles.dart';

class Bikewash extends StatelessWidget {
  const Bikewash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Select Bike Wash Type"),
          backgroundColor: kappbarcolor,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          )),
      body: SingleChildScrollView(
        child: GetBuilder<BikePriceController>(
            init: BikePriceController(),
            builder: (bikeprice) {
              return Column(children: [
                Stack(children: [
                  Container(
                      height: 180,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://firebasestorage.googleapis.com/v0/b/noduster-827be.appspot.com/o/images%2Fwashing%2Fbikewash.png?alt=media&token=cb868b18-9227-4b5b-a7e5-c4ae2a5e81c5"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: null),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Column(
                      children: const [
                        Text(
                          'Bike Washing',
                          style: imagemainheadingstyle,
                        ),
                        Text('Bike wash at your doorstep\nPremium Bike wash',
                            style: imagesubheadingstyle),
                      ],
                    ),
                  )
                ]),
                ChoosePriceWidget(
                    ontap: () {
                      bikeprice.bikerate = 100;
                      bikeprice.sumBikePrice();
                      bikeprice.update();
                      Get.to(() => Numberofitemstocart(
                            bikeorcar: 'Bike or car Wash',
                            service: 'Basic bike wash',
                            mainservice: 'Washing',
                          ));
                    },
                    cateimg:
                        'https://firebasestorage.googleapis.com/v0/b/noduster-827be.appspot.com/o/images%2Fwashing%2Fbasicbike.jpg?alt=media&token=f7a12197-c995-4184-a68b-036c13f243ea',
                    heading: 'Basic wash',
                    price: '100',
                    subheading:
                        'Dirt and dust removal, cleaning\nby hands with 40ltr of water\n\nWater should be provided by\nthe customer'),
                kheight10,
                Column(children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - -',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      style: TextStyle(color: kgreycolor),
                    ),
                  ),
                  ChoosePriceWidget(
                      ontap: () {
                        bikeprice.bikerate = 150;
                        bikeprice.sumBikePrice();
                        bikeprice.update();
                        Get.to(() => Numberofitemstocart(
                            service: 'Bike pressure wash',
                            bikeorcar: 'Bike or car Wash',
                            mainservice: 'Washing'));
                      },
                      cateimg:
                          'https://firebasestorage.googleapis.com/v0/b/noduster-827be.appspot.com/o/images%2Fwashing%2FPressurebike.jpeg?alt=media&token=c1f94ecb-045b-4a1b-94e0-f62d3deb4083',
                      heading: 'Pressure wash',
                      price: '150',
                      subheading:
                          'Pressure-water dirt and stain\nremoval with 40ltr of water\n\nWater should be provided by\nthe customer'),
                  kheight10,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      thickness: 0.5,
                      color: kgreycolor,
                    ),
                  ),
                ]),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Note",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Service will be done in your respective place.\nWater is not provided',
                  style: subheadingstyle,
                )
              ]);
            }),
      ),
    );
  }
}
