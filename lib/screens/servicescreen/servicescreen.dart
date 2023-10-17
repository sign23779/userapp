import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noduster/const/color.dart';
import 'package:noduster/const/const.dart';
import 'package:noduster/const/servicestring.dart';
import 'package:noduster/const/textstyle.dart';
import 'package:noduster/controller/pricecontroller.dart';
import 'package:noduster/screens/cleaningscreen/widget/pricewidget.dart';
import 'package:noduster/screens/numberofcleaning/cleaningnumber.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    var service = Service.getdata(name);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kappbarcolor,
        title: Text(name
            .replaceAll(
              "service",
              '',
            )
            .replaceAll("manufacturing", '')
            .toUpperCase()),
        centerTitle: true,
        elevation: 0.2,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(service['backgroundimg']),
                      opacity: 0.9,
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: null),
              Positioned(
                bottom: 10,
                left: 10,
                child:
                    Text(service['imageheading'], style: imagemainheadingstyle),
              )
            ]),
            kheight20,
            GetBuilder<BikePriceController>(
                init: BikePriceController(),
                builder: (bikeprice) {
                  return ChoosePriceWidget(
                      ontap: () {
                        bikeprice.bikerate =
                            double.parse(service['price'] ?? "0.0");
                        bikeprice.sumBikePrice();
                        bikeprice.update();
                        Get.to(() => Numberofcleaning(
                              bikeorcar: service['mainheading'],
                              mainservice: 'Service',
                              room: service['mainheading'],
                            ));
                      },
                      cateimg: service['cartimage'],
                      heading: service['mainheading'],
                      price: service['price'],
                      subheading: service['subheading']);
                }),
            kheight30,
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                'Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            kheight10,
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(service['details'],
                  style: servicedetailtextstyle, textAlign: TextAlign.left),
            ),
          ],
        ),
      ),
    );
  }
}
