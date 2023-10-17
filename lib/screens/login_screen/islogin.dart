import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noduster/const/color.dart';
import 'package:noduster/screens/home_screen/home_screen.dart';
import 'package:noduster/screens/login_screen/login_screen.dart';

class IsLogin extends StatelessWidget {
  const IsLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(
              color: kwhitecolor,
              backgroundColor: kblackcolor,
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Somthing went wrong',
                style: TextStyle(
                  color: kwhitecolor,
                ),
              ),
            );
          } else if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const LoginScreen();
          }
        });
  }
}
