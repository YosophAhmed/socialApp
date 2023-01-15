import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void customBottomModalSheet({
  required BuildContext context,
  required Widget widget,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return widget;
    },
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.sp),
    ),
  );
}
