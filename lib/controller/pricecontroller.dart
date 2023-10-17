import 'package:get/get.dart';

class BikePriceController extends GetxController {
  @override
  void onInit() {
    sumBikePrice();
    super.onInit();
  }

  late int quantity = 1;
  double bikerate = 0.0;

  late var totalprice = '';

  void sumBikePrice() {
    totalprice = '${bikerate * quantity}';
    update();
  }

  void addQuantity() {
    quantity >= 1 ? quantity = quantity + 1 : quantity == 1;
    sumBikePrice();
    update();
  }

  void subQuantity() {
    quantity >= 2 ? quantity = quantity - 1 : quantity == 1;
    sumBikePrice();
    update();
  }
}
