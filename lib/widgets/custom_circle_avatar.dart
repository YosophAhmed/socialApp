import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String imageName;

  const CustomCircleAvatar({
    Key? key,
    required this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60.sp,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 57.sp,
        backgroundImage: NetworkImage(
          imageName,
        ),
      ),
    );
  }
}