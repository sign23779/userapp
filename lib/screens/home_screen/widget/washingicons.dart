import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:noduster/const/const.dart';

class Washingicons extends StatelessWidget {
  const Washingicons({super.key, required this.image, required this.name});
  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        child: Column(
          children: [
            CachedNetworkImage(
              placeholder: (context, url) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.grey.shade200,
                ),
                height: 90,
                width: 150,
              ),
              imageUrl: image,
              imageBuilder: (context, imageProvider) => Container(
                height: 90,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  image: DecorationImage(image: imageProvider),
                ),
              ),
            ),
            kheight10,
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 17,
              ),
            )
          ],
        ),
      ),
    );
  }
}
