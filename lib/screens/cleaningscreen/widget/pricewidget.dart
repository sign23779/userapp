import 'package:flutter/material.dart';
import 'package:noduster/const/color.dart';
import 'package:noduster/const/const.dart';
import 'package:noduster/const/textstyle.dart';

class ChoosePriceWidget extends StatelessWidget {
  const ChoosePriceWidget(
      {Key? key,
      required this.cateimg,
      required this.price,
      required this.heading,
      required this.subheading,
      required this.ontap})
      : super(key: key);

  final String heading;
  final String subheading;
  final String price;
  final String cateimg;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kheight20,
              Text(heading,
                  style: pricewidgetheading, textAlign: TextAlign.left),
              kheight10,
              Text(
                subheading,
                textAlign: TextAlign.left,
                style: subheadingstyle,
              ),
              kheight20,
              Text('₹ $price  Onwards',
                  style: pricetextstyle, textAlign: TextAlign.left),
            ],
          ),
          Stack(children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(cateimg),
                    fit: BoxFit.fill,
                  ),
                ),
                height: 90,
                width: 90,
                child: null),
            Positioned(
                bottom: 0,
                top: 65,
                right: 10,
                left: 10,
                child: ElevatedButton(
                  onPressed: () {
                    ontap();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kwhitecolor)),
                  child: const Text(
                    'Add',
                    style: TextStyle(color: kblue),
                  ),
                ))
          ]),
          kheight20,
        ],
      ),
    );
  }
}
