import 'package:flutter/material.dart';
import 'package:noduster/const/color.dart';

class Homeappbar extends StatelessWidget {
  const Homeappbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kappbarcolor,
      centerTitle: true,
      // leading: IconButton(
      //     icon: const Icon(Icons.menu),
      //     onPressed: () {
      //       // Get.to(() => const MenuScreen());
      //     }),
      title: Image.asset(
        'lib/asset/Homescreen/appbarimage.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
