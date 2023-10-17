import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:noduster/model/profilemodel.dart';

final currentusernum = FirebaseAuth.instance.currentUser!.phoneNumber;

Future addprofile({required ProfileModel profileModel}) async {
  final userdoc = FirebaseFirestore.instance
      .collection('users')
      .doc(currentusernum)
      .collection(currentusernum.toString())
      .doc("profile");

  final json = profileModel.toJson();

  await userdoc.set(json);
  log('profile added');
  // log(profilecontroller.profilelist.toString());
}
