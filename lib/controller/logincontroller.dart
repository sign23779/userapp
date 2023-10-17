import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:noduster/functions/addprofile.dart';
import 'package:noduster/model/profilemodel.dart';
import 'package:noduster/model/user_model.dart';
import 'package:noduster/screens/home_screen/home_screen.dart';

class LoginController extends GetxController {
  RxString phoneNumber = "".obs;
  RxString otpNumber = "".obs;
  RxString verificationNumId = "".obs;
  final auth = FirebaseAuth.instance;

  Future<void> verifyPhoneNumber(
    String phoneNumber,
  ) async {
    verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
      await auth.signInWithCredential(phoneAuthCredential);
    }

    verificationFailed(FirebaseAuthException authException) {
      log('Phone verification failed. Code: ${authException.code}. Message: ${authException.message}');
    }

    codeSent(String verificationId, [int? forceResendingToken]) async {
      verificationNumId.value = verificationId;
    }

    codeAutoRetrievalTimeout(String verificationId) {
      verificationNumId.value = verificationId;
    }

    await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        timeout: const Duration(seconds: 60));
  }

  Future<void> signInWithPhoneNumber(
      String smsCode, context, UserModel user) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationNumId.value, smsCode: smsCode);
      await auth.signInWithCredential(credential).then((value) async {
        Get.offAll(() => const HomeScreen());
        final docUser = FirebaseFirestore.instance
            .collection('users')
            .doc(user.phonenumber);
        final json = user.toJson();

        await docUser.set(json);
        log('new user created n added to databse');
        await addprofile(
            profileModel: ProfileModel(
                username: 'name',
                email: 'email',
                profilepic:
                    'https://www.vhv.rs/dpng/d/520-5206228_cartoon-avatar-transparent-background-png-cartoon-male-avatar.png',
                phonenum: currentusernum!));
      });

      log('opt code correctt');
    } catch (e) {
      log('Error: $e');
      Get.snackbar('sorry', 'wrong otp');
      return;
    }
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
