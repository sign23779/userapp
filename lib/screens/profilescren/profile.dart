import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noduster/const/color.dart';
import 'package:noduster/const/const.dart';
import 'package:noduster/controller/profilecontroller.dart';
import 'package:noduster/functions/addprofile.dart';
import 'package:noduster/functions/imagepicker.dart';
import 'package:noduster/model/profilemodel.dart';
import 'package:noduster/screens/home_screen/home_screen.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    super.key,
  });
  final Profilecontroller profilecontroller = Get.put(Profilecontroller());

  late final namecontroller =
      TextEditingController(text: profilecontroller.name);

  late final emailcontroller =
      TextEditingController(text: profilecontroller.email);

  final ButtonStyle style =
      ElevatedButton.styleFrom(backgroundColor: kappbarcolor);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<ProfileModel>>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(currentusernum)
              .collection(currentusernum.toString())
              .snapshots()
              .map((event) => event.docs
                  .map((e) => ProfileModel.fromJson(e.data()))
                  .toList()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProfileModel> prodata = snapshot.data!;
              final TextEditingController namestream =
                  TextEditingController(text: prodata[0].username);
              final TextEditingController emailstream =
                  TextEditingController(text: prodata[0].email);
              String propic = prodata[0].profilepic;
              getimage() {
                propic = profilecontroller.profileimage;
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    AppBar(
                      backgroundColor: kappbarcolor,
                      centerTitle: true,
                      title: const Text("Please Enter The Details"),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    GetBuilder<Profilecontroller>(builder: (c) {
                      return Stack(
                        children: [
                          CircleAvatar(
                            maxRadius: 90,
                            backgroundImage: NetworkImage(
                              propic,
                              scale: 1.0,
                            ),
                            backgroundColor: kwhitecolor,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 75,
                            child: IconButton(
                                onPressed: () async {
                                  final imageurl = await Images.getimage();

                                  profilecontroller.profileimage = imageurl!;
                                  profilecontroller.update();
                                  getimage();
                                  log(imageurl.toString());
                                },
                                icon: const Icon(
                                  Icons.camera_alt_sharp,
                                  color: kred,
                                  size: 50,
                                )),
                          ),
                        ],
                      );
                    }),
                    kheight30,
                    Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              hintText: 'Name',
                              prefixIcon: Icon(Icons.person)),
                          onChanged: (value) {
                            profilecontroller.name = value;
                            profilecontroller.update();
                          },
                          controller: namestream,
                        )),
                    kheight10,
                    kheight20,
                    Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              hintText: 'Email',
                              prefixIcon: Icon(Icons.email)),
                          controller: emailstream,
                          onChanged: (value) {
                            profilecontroller.email = value;
                            profilecontroller.update();
                          },
                        )),
                    kheight30,
                    ElevatedButton(
                        style: style,
                        onPressed: () {
                          log('stream');
                          addprofile(
                              profileModel: ProfileModel(
                                  username: profilecontroller.name,
                                  email: profilecontroller.email,
                                  profilepic: profilecontroller.profileimage,
                                  phonenum: currentusernum!));

                          Get.to(() => const HomeScreen());
                        },
                        child: const Text('Continue'))
                  ],
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    AppBar(
                      backgroundColor: kappbarcolor,
                      centerTitle: true,
                      title: const Text("Please Enter The Details"),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    GetBuilder<Profilecontroller>(builder: (c) {
                      return Stack(
                        children: [
                          CircleAvatar(
                            maxRadius: 90,
                            backgroundImage: NetworkImage(
                              c.profileimage,
                              scale: 1.0,
                            ),
                            backgroundColor: kwhitecolor,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 75,
                            child: IconButton(
                                onPressed: () async {
                                  final imageurl = await Images.getimage();

                                  profilecontroller.profileimage = imageurl!;
                                  profilecontroller.update();
                                  log(imageurl.toString());
                                },
                                icon: const Icon(
                                  Icons.camera_alt_sharp,
                                  color: kred,
                                  size: 50,
                                )),
                          ),
                        ],
                      );
                    }),
                    kheight30,
                    Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              hintText: 'Name',
                              prefixIcon: Icon(Icons.person)),
                          onChanged: (value) {
                            profilecontroller.name = value;
                            profilecontroller.update();
                          },
                          controller: namecontroller,
                        )),
                    kheight10,
                    kheight20,
                    Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              hintText: 'Email',
                              prefixIcon: Icon(Icons.email)),
                          controller: emailcontroller,
                          onChanged: (value) {
                            profilecontroller.email = value;
                            profilecontroller.update();
                          },
                        )),
                    kheight30,
                    ElevatedButton(
                        style: style,
                        onPressed: () {
                          log('controller');
                          addprofile(
                              profileModel: ProfileModel(
                                  username: profilecontroller.name,
                                  email: profilecontroller.email,
                                  profilepic: profilecontroller.profileimage,
                                  phonenum: currentusernum!));

                          Get.to(() => const HomeScreen());
                        },
                        child: const Text('Continue'))
                  ],
                ),
              );
            }
          }),
    );
  }
}
