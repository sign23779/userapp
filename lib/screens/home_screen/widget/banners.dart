import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({
    required this.banner,
    Key? key,
  }) : super(key: key);

  final List<String> banner;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: banner.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CachedNetworkImage(
            imageUrl: banner[index],
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            // progressIndicatorBuilder: (context, url, downloadProgress) =>
            //     const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageBuilder: (context, imageProvider) =>
                Image(image: imageProvider),
          );
        },
      ),
    );
  }
}
