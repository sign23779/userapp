import 'dart:developer';

import 'package:get/get.dart';
import 'package:noduster/const/cleaningstring.dart';

class Cleaningcontroller extends GetxController {
  Map? change;

  cleaningdata(String name) {
    change = Cleaning.getdata(name);

    update();
    log(change.toString());
  }
}
