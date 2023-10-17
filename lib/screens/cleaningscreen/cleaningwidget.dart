import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noduster/const/color.dart';
import 'package:noduster/const/const.dart';
import 'package:noduster/const/textstyle.dart';
import 'package:noduster/controller/cleaningcontroller.dart';
import 'package:noduster/controller/pricecontroller.dart';
import 'package:noduster/screens/cleaningscreen/widget/pricewidget.dart';
import 'package:noduster/screens/cleaningscreen/widget/youmaychoose.dart';
import 'package:noduster/screens/numberofcleaning/cleaningnumber.dart';

class CleaningScreen extends StatelessWidget {
  const CleaningScreen({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kappbarcolor,
        title: GetBuilder<Cleaningcontroller>(builder: (c) {
          return Text(c.change!['imageheading']
              .replaceAll("cleaning", "")
              .toUpperCase());
        }),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<Cleaningcontroller>(builder: (c) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      image: DecorationImage(
                        image: NetworkImage(c.change!['backgroundimg']),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: null),
                //Image.network(c.change!['backgroundimg']),
                Positioned(
                  bottom: 5,
                  left: 10,
                  child: Column(
                    children: [
                      Text(
                        c.change!['imageheading'],
                        style: imagemainheadingstyle,
                      ),
                      Text(c.change!['imagesubheading'],
                          style: imagesubheadingstyle),
                    ],
                  ),
                )
              ]),
              GetBuilder<BikePriceController>(
                  init: BikePriceController(),
                  builder: (bikeprice) {
                    return ChoosePriceWidget(
                        ontap: () {
                          bikeprice.bikerate =
                              double.parse(c.change!['price'] ?? "0.0");
                          bikeprice.sumBikePrice();
                          bikeprice.update();
                          Get.to(() => Numberofcleaning(
                                bikeorcar: c.change!['imageheading'],
                                mainservice: 'Cleaning',
                                room: c.change!['imageheading'],
                              ));
                        },
                        cateimg: c.change!['cartimage'],
                        heading: c.change!['mainheading'],
                        price: c.change!['price'],
                        subheading: c.change!['subheadingone']);
                  }),
              kheight10,
              if (c.change!['imageheading'] == 'Kitchen Cleaning' ||
                  c.change!['imageheading'] == 'Bathroom Cleaning')
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
                  GetBuilder<BikePriceController>(
                      init: BikePriceController(),
                      builder: (bikeprice) {
                        return ChoosePriceWidget(
                            ontap: () {
                              bikeprice.bikerate =
                                  double.parse(c.change!['pricetwo'] ?? "0.0");
                              bikeprice.sumBikePrice();
                              bikeprice.update();
                              Get.to(() => Numberofcleaning(
                                    bikeorcar: c.change!['mainheadingtwo'],
                                    mainservice: c.change!['imageheading'],
                                    room: c.change!['mainheadingtwo'],
                                  ));
                            },
                            cateimg: c.change!['cartimage'],
                            heading: c.change!['mainheadingtwo'],
                            price: c.change!['pricetwo'],
                            subheading: c.change!['subheadingtwo']);
                      }),
                  kheight10,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      thickness: 0.5,
                      color: kgreycolor,
                    ),
                  ),
                ]),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'You might also clean',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              kheight20,
              const Youmaychoose()
            ],
          );
        }),
      ),
    );
  }
}
