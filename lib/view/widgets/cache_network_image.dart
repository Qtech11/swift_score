import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'custom_box.dart';

class CacheNetworkImage extends StatelessWidget {
  const CacheNetworkImage(
      {Key? key,
      required this.imageUrl,
      required this.height,
      required this.width})
      : super(key: key);

  final String imageUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: height,
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, imageUrl, downloadProgress) {
        return CustomBox(
          width: height,
          height: width,
        );
      },
      errorWidget: (context, imageUrl, error) {
        return SizedBox(
          width: height,
          height: width,
          child: Image.asset('images/default.png'),
        );
      },
    );
  }
}
