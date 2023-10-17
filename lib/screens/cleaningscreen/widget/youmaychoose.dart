import 'package:flutter/material.dart';

import '../../../const/homescreenstring.dart';
import '../../../controller/dependency/dependency.dart';
import '../../home_screen/widget/washingicons.dart';

class Youmaychoose extends StatelessWidget {
  const Youmaychoose({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: Homescreenstrings.cleaning.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                cleaningcontroller.cleaningdata(Homescreenstrings
                    .cleaning[index]['name']!
                    .toLowerCase()
                    .replaceAll('\n', '')
                    .trim());
              },
              child: Washingicons(
                  image: Homescreenstrings.cleaning[index]['image']!,
                  name: Homescreenstrings.cleaning[index]['name']!),
            );
          }),
    );
  }
}
