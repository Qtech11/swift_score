import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomBox extends StatelessWidget {
  const CustomBox({Key? key, required this.height, required this.width})
      : super(key: key);
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white.withOpacity(0.3),
      baseColor: Colors.grey.withOpacity(0.3),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.all(
            Radius.circular(height / 2),
          ),
        ),
        height: height,
        width: width,
      ),
    );
  }
}

class CustomBox1 extends StatelessWidget {
  const CustomBox1({Key? key, required this.height, required this.width})
      : super(key: key);
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white.withOpacity(0.3),
      baseColor: Colors.grey.withOpacity(0.3),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.all(
            Radius.circular(height / 5),
          ),
        ),
        height: height,
        width: width,
      ),
    );
  }
}
