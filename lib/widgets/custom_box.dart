import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  const CustomBox({Key? key, this.height, this.width}) : super(key: key);
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.all(
          Radius.circular(height! / 2),
        ),
      ),
      height: height,
      width: width,
    );
  }
}
