import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noduster/const/color.dart';
import 'package:noduster/const/const.dart';
import 'package:noduster/controller/dependency/dependency.dart';
import 'package:noduster/model/order_model.dart';

class UpcomingOrder extends StatelessWidget {
  const UpcomingOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<List<OrderModel>>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(currentuser!)
              .collection('orders')
              .snapshots()
              .map((event) => event.docs
                  .map((e) => OrderModel.fromJson(e.data()))
                  .toList()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<OrderModel> orderlist = snapshot.data!;

              return ListView.separated(
                  separatorBuilder: (context, index) => kheight20,
                  itemCount: orderlist.length,
                  itemBuilder: (context, index) {
                    if (orderlist[index].isPending == true) {
                      DateTime now = DateTime.parse(orderlist[index].datetime);
                      String formattedDate =
                          DateFormat('dd MMMM yyyy').format(now);
                      String timeformat = DateFormat("hh:mm:ss a").format(now);
                      log(formattedDate);
                      log(timeformat);
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                            width: double.infinity,
                            color: kgreycolor[200],
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      kheight10,
                                      const Text(
                                        "Service",
                                        style: TextStyle(
                                          fontFamily: "poppinz",
                                          fontSize: 15,
                                          color: kgreycolor,
                                        ),
                                      ),
                                      Text(
                                        orderlist[index].subcate,
                                        style: const TextStyle(
                                          fontFamily: "poppinz",
                                          overflow: TextOverflow.fade,
                                          fontSize: 15,
                                          color: kblackcolor,
                                        ),
                                      ),
                                      kheight20,
                                      const Text(
                                        "Booking ID",
                                        style: TextStyle(
                                          fontFamily: "poppinz",
                                          fontSize: 15,
                                          color: kgreycolor,
                                        ),
                                      ),
                                      Text(
                                        orderlist[index].orderid,
                                        style: const TextStyle(
                                          fontFamily: "poppinz",
                                          fontSize: 15,
                                          color: kblackcolor,
                                        ),
                                      ),
                                      kheight20,
                                      const Text(
                                        "Status",
                                        style: TextStyle(
                                          fontFamily: "poppinz",
                                          fontSize: 15,
                                          color: kgreycolor,
                                        ),
                                      ),
                                      const Text(
                                        "InCompleted",
                                        style: TextStyle(
                                          fontFamily: "poppinz",
                                          fontSize: 15,
                                          color: kred,
                                        ),
                                      ),
                                      kheight10
                                    ],
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0xffbcdcdb),
                                      ),
                                      height: 120,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  formattedDate.substring(0, 2),
                                                  style: const TextStyle(
                                                      fontFamily: "poppinz",
                                                      fontSize: 18,
                                                      color: kblackcolor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  formattedDate.substring(2, 6),
                                                  style: const TextStyle(
                                                      fontFamily: "poppinz",
                                                      fontSize: 15,
                                                      color: kblackcolor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  formattedDate.substring(
                                                      formattedDate.length - 4),
                                                  style: const TextStyle(
                                                      fontFamily: "poppinz",
                                                      fontSize: 15,
                                                      color: kblackcolor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      );
                    } else {
                      return const SizedBox();
                    }
                  });
            } else {
              return const Center(
                  child: Text('No Orders, Please Order Something'));
            }
          }),
    );
  }
}
