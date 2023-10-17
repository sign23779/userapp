import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noduster/const/color.dart';
import 'package:noduster/const/const.dart';
import 'package:noduster/screens/booking_status/complete_order_widget.dart';
import 'package:noduster/screens/booking_status/upcoming_order_widget.dart';

class BookingStatusScreen extends StatefulWidget {
  const BookingStatusScreen({super.key});

  @override
  State<BookingStatusScreen> createState() => _BookingStatusScreenState();
}

class _BookingStatusScreenState extends State<BookingStatusScreen> {
  bool isButton1Clicked = false;
  bool isButton2Clicked = false;

  @override
  Widget build(BuildContext context) {
    Widget currentWidget;

    if (isButton1Clicked) {
      currentWidget = const CompletedOrder();
    } else if (isButton2Clicked) {
      currentWidget = const UpcomingOrder();
    } else {
      currentWidget = const CompletedOrder();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffbcdcdb),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: kblackcolor,
            )),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            color: const Color(0xffbcdcdb),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 30),
              child: Row(
                children: const [
                  Text(
                    'My Booking',
                    style: TextStyle(
                        fontFamily: "poppinz",
                        fontSize: 23,
                        color: kblackcolor,
                        fontWeight: FontWeight.bold),
                  ),
                  kwidth10,
                  Icon(
                    Icons.library_books_outlined,
                    color: kgreycolor,
                    size: 70,
                  ),
                ],
              ),
            ),
          ),
          kheight10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6))),
                          backgroundColor: MaterialStateProperty.all(
                            isButton1Clicked == true
                                ? const Color(0xffbcdcdb)
                                : kgreycolor[200],
                          )),
                      onPressed: () {
                        setState(() {
                          isButton1Clicked = true;
                          isButton2Clicked = false;
                        });
                      },
                      child: const Text(
                        'Completed',
                        style: TextStyle(
                          fontFamily: "poppinz",
                          fontSize: 15,
                          color: kblackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6))),
                          backgroundColor: MaterialStateProperty.all(
                            isButton2Clicked == true
                                ? const Color(0xffbcdcdb)
                                : kgreycolor[200],
                          )),
                      onPressed: () {
                        setState(() {
                          isButton1Clicked = false;
                          isButton2Clicked = true;
                        });
                      },
                      child: const Text(
                        'Upcoming',
                        style: TextStyle(
                          fontFamily: "poppinz",
                          fontSize: 15,
                          color: kblackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          kheight20,
          currentWidget,
        ],
      ),
    );
  }
}
