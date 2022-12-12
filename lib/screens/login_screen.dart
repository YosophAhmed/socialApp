import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:social_app/widgets/custom_botton.dart';
import 'package:social_app/widgets/custom_divider.dart';

import '../widgets/custom_text_form_field.dart';
import '../widgets/custom_top_image.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool obscure = true;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomTopImage(
              imageName: 'assets/images/social.png',
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    hintText: 'Email',
                    onChanged: (value){},
                    onSubmitted: (value){},
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  CustomTextFormField(
                    hintText: 'Password',
                    onChanged: (value){},
                    onSubmitted: (value){},
                    keyboardType: TextInputType.visiblePassword,
                    suffix: obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    obscure: obscure,
                    suffixFunction: (){
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  CustomButton(
                    label: 'Log in',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  const CustomDivider(
                    text: ' OR ',
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomButton(
                    label: 'Create new Social account',
                    onTap: () {},
                    buttonColor: Colors.green,
                    buttonWidth: 60.w,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

