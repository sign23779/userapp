import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:noduster/controller/cleaningcontroller.dart';
import 'package:noduster/controller/logincontroller.dart';
import 'package:noduster/controller/pricecontroller.dart';
import 'package:noduster/controller/profilecontroller.dart';

Cleaningcontroller cleaningcontroller = Get.put(Cleaningcontroller());
BikePriceController bikeprice = Get.put(BikePriceController());
LoginController loginController = Get.put(LoginController());
Profilecontroller profilecontroller = Get.put(Profilecontroller());
//Mapcontroller mapcontroller = Get.put(Mapcontroller());
//current user
final currentuser = FirebaseAuth.instance.currentUser!.phoneNumber;
