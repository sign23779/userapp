import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noduster/const/color.dart';
import 'package:noduster/const/const.dart';
import 'package:noduster/functions/order_function.dart';
import 'package:noduster/model/order_model.dart';
import 'package:noduster/screens/home_screen/home_screen.dart';
import 'package:noduster/screens/payment_screen/widget/payment_tile_widget.dart';

import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen(
      {super.key,
      required this.servicename,
      required this.mainservice,
      required this.price,
      required this.address,
      required this.orderquantity,
      required this.totalprice,
      required this.flatno,
      required this.landmark,
      required this.contactname,
      required this.bikeorcar,
      required this.randomnum});
  final String servicename;
  final String price;
  final String bikeorcar;

  final String orderquantity;
  final String totalprice;

  final String address;
  final String flatno;
  final String contactname;
  final String landmark;
  final String mainservice;
  final String randomnum;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _value = 1;
  Razorpay razorpay = Razorpay();

  Future<String> generateOrderId(int amount) async {
    var url = 'https://api.razorpay.com/v1/orders'; // Razorpay API endpoint

    // Set your Razorpay API key and secret
    var keyId = 'rzp_test_wt05nGk9MinzK9';
    var keySecret = 'ZCdkevqGthAq2bWVGicvEOIA';

    // Create the request headers
    var headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Basic ${base64Encode(utf8.encode('$keyId:$keySecret'))}',
    };

    // Create the request body
    var body = jsonEncode({
      'amount':
          amount, // Amount in paise (e.g., for ₹10, 'amount' will be 1000)
      'currency': 'INR', // Change to your desired currency
    });

    // Make the API request
    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      var orderId = responseData['id'];
      return orderId;
    } else {
      throw Exception('Failed to generate orderId');
    }
  }

  void initiatePayment(int amount, String email, String contact) async {
    try {
      int amountinRs = amount * 100;
      String orderId = await generateOrderId(amountinRs);
      // Use the orderId as needed
      log('Generated Order ID: $orderId');
      // Start the payment process using the obtained orderId
      startPayment(orderId, amount, email, contact);
    } catch (e) {
      log('Error: $e');
      // Handle error case
    }
  }

  void startPayment(String orderId, int amount, String email, String contact) {
    // Use the obtained orderId for payment initiation
    var options = {
      'key': 'rzp_test_wt05nGk9MinzK9',
      'amount': amount,
      'name': 'NoDuster',
      'description': 'Demo',
      'order_id': orderId,
      'prefill': {'contact': contact, 'email': email},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      log('Error: $e');
      // Handle error case
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    log(response.toString());
    log(response.orderId.toString());
    log(response.paymentId.toString());
    log(response.signature.toString());

    Get.back();
    // verifyS
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(response.toString())));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log(response.toString());
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(response.toString())));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log(response.toString());
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(response.toString())));
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log(currentuser!);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kappbarcolor,
        centerTitle: true,
        title: const Text(
          "Payment",
          style: TextStyle(
            fontFamily: "poppinz",
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 1,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
      ),
      body: Column(
        children: [
          kheight20,
          Container(
            decoration: BoxDecoration(color: kteal[50]),
            width: double.infinity,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Amount Payable',
                  style: TextStyle(
                      color: kblackcolor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.start,
                ),
                Text(
                  '₹ ${widget.totalprice}',
                  style: const TextStyle(
                      color: kblackcolor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          const Text(
            '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - -',
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
            maxLines: 1,
            style: TextStyle(color: kgreycolor),
          ),
          kheight20,
          PaymentMethodsTile(
            onTap: () {},
            imageUrl:
                'https://yt3.ggpht.com/ytc/AMLnZu8hEuwIDjx39XqXih5os_s6PVzgsptnGb8Q1tkKvw=s900-c-k-c0x00ffffff-no-rj',
            title: 'RazorPay',
            radiobutton: Radio<int>(
                activeColor: kblackcolor,
                fillColor: MaterialStateProperty.all(kblackcolor),
                value: 1,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value!;
                  });
                }),
          ),
          kheight20,
          PaymentMethodsTile(
            onTap: () {},
            imageUrl:
                'https://img.freepik.com/premium-vector/cash-delivery_569841-162.jpg?w=2000',
            title: 'Cash on Delivery',
            radiobutton: Radio<int>(
                fillColor: MaterialStateProperty.all(kblackcolor),
                activeColor: kblackcolor,
                // fillColor:,
                value: 2,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value!;
                  });
                  // selected value
                }),
          ),
          const Expanded(child: kheight30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_value == 1) {
                    initiatePayment(
                        int.parse(widget.totalprice
                            .substring(0, widget.totalprice.length - 2)),
                        'info@noduster.in',
                        currentuser!);
                    log('Razorpay');
                  } else {
                    log(currentuser!);
                    log(widget.address);
                    addorder(
                            orderModel: OrderModel(
                                flatno: widget.flatno,
                                paymentmethod: 'COD',
                                userphoneNumber: currentuser!,
                                subcate: widget.servicename,
                                contactname: widget.contactname,
                                landmark: widget.landmark,
                                totalprice: widget.totalprice,
                                orderid: widget.randomnum,
                                mainservicename: widget.mainservice,
                                specificservicename: widget.bikeorcar,
                                orderquantity: widget.orderquantity,
                                price: widget.price,
                                isPending: true,
                                isFinished: false,
                                datetime: DateTime.now().toString(),
                                address: widget.address))
                        .then((value) => Get.offAll(() => const HomeScreen()));
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(340, 40),
                  backgroundColor: kappbarcolor,
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(color: kwhitecolor),
                ),
              ),
            ),
          ),
          kheight30,
        ],
      ),
    );
  }
}
