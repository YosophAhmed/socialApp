import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:social_app/widgets/custom_botton.dart';
import 'package:social_app/widgets/custom_divider.dart';

import '../../widgets/custom_text_form_field.dart';
import '../../widgets/custom_top_image.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomTopImage(
                imageName: 'assets/images/social.png',
              ),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return Form(
                    key: BlocProvider.of<LoginCubit>(context).formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomTextFormField(
                          controller: BlocProvider.of<LoginCubit>(context)
                              .emailController,
                          hintText: 'Email',
                          onChanged: (value) {},
                          onSubmitted: (value) {},
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        CustomTextFormField(
                          controller: BlocProvider.of<LoginCubit>(context)
                              .passwordController,
                          hintText: 'Password',
                          onChanged: (value) {},
                          onSubmitted: (value) {},
                          keyboardType: TextInputType.visiblePassword,
                          suffix: BlocProvider.of<LoginCubit>(context).suffix,
                          obscure: BlocProvider.of<LoginCubit>(context).obscure,
                          suffixFunction: () {
                            BlocProvider.of<LoginCubit>(context)
                                .changePasswordVisibility();
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
                      ]),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
