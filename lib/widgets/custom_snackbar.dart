import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void customSnackBar({
  required BuildContext context,
  required String message,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      // backgroundColor: primaryColor4,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.sp,
        ),
      ),
    ),
  );
}
