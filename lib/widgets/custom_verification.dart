import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomVerification extends StatelessWidget {
  final Function() onPressed;

  const CustomVerification({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: 3.w,
          ),
          child: Icon(
            Icons.info_outline_rounded,
            size: 24.sp,
          ),
        ),
        Text(
          'Please verify your email',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'Send',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
        ),
      ],
    );
  }
}
