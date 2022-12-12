import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTopImage extends StatelessWidget {
  final String imageName;
  const CustomTopImage({
    Key? key,
    required this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      width: double.infinity,
      child: Image.asset(
        imageName,
        fit: BoxFit.fill,
      ),
    );
  }
}
