import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:noduster/model/order_model.dart';

final currentuser = FirebaseAuth.instance.currentUser!.phoneNumber;

Future addorder({required OrderModel orderModel}) async {
  final userdoc = FirebaseFirestore.instance
      .collection('orders')
      .doc('orders')
      .collection('pendingworks')
      .doc(orderModel.datetime);

  final json = orderModel.toJson();

  await userdoc.set(json);

  final usercollectiondoc = FirebaseFirestore.instance
      .collection('users')
      .doc(currentuser)
      .collection('orders')
      .doc(orderModel.datetime);

  final userjson = orderModel.toJson();

  await usercollectiondoc.set(userjson);

  log('Addded to cart');
}

// removeFromorder({required String id}) {
//   final docProduct = FirebaseFirestore.instance
//       .collection('users')
//       .doc('order')
//       .collection('order')
//       .doc(id);
//   docProduct.delete();
// }
