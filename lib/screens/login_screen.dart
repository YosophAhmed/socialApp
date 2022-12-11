import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/logo.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 7.h,
          left: 3.w,
          right: 3.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Logo(),

            ],
          ),
        ),
      ),
    );
  }
}
