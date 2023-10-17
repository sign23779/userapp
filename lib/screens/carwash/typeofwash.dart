import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noduster/const/carwashstring.dart';
import 'package:noduster/const/color.dart';
import 'package:noduster/controller/pricecontroller.dart';
import 'package:noduster/screens/numberofvehicles/numberofvehicles.dart';

class Typeofwash extends StatelessWidget {
  const Typeofwash({super.key, required this.cartype});
  final String cartype;
  @override
  Widget build(BuildContext context) {
    var carwashingdetails = Cars.getwashdetails(cartype);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kappbarcolor,
          title: const Text("Select Your Car Wash Type"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 600,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Washtype(
                      categories: cartype,
                      heading: carwashingdetails[index]['heading'],
                      image: carwashingdetails[index]['image'],
                      price: carwashingdetails[index]['price'],
                      subheading: carwashingdetails[index]['subheading'],
                    ),
                    itemCount: carwashingdetails.length,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class Washtype extends StatelessWidget {
  Washtype({
    super.key,
    required this.image,
    required this.heading,
    required this.price,
    required this.subheading,
    required this.categories,
  });
  final String image;
  final String heading;
  final String? price;
  final String subheading;
  final String categories;

  final ButtonStyle style =
      ElevatedButton.styleFrom(backgroundColor: kappbarcolor);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BikePriceController>(
        init: BikePriceController(),
        builder: (bikeprice) {
          return SizedBox(
            width: 300,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: kcyan,
              child: Column(children: [
                Center(
                  child: Image.network(
                    image,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    heading,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Includes',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    subheading,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('Price',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                ),
                Text(
                  "₹$price",
                  style: const TextStyle(fontSize: 15),
                ),
                ElevatedButton(
                    style: style,
                    child: const Text('Continue'),
                    onPressed: () {
                      bikeprice.bikerate = double.parse(price ?? "0.0");
                      bikeprice.sumBikePrice();
                      bikeprice.update();
                      Get.to(() => Numberofitemstocart(
                            bikeorcar: 'Bike or car Wash',
                            service: "$categories $heading",
                            mainservice: 'Washing',
                          ));
                    }),
              ]),
            ),
          );
        });
  }
}
