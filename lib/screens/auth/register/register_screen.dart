import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:social_app/screens/auth/login/login_screen.dart';
import 'package:social_app/screens/auth/register/cubit/cubit.dart';

import '../../../widgets/custom_botton.dart';
import '../../../widgets/custom_divider.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/custom_top_image.dart';
import 'cubit/states.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'RegisterScreen';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
      create: (BuildContext context) => RegisterCubit(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomTopImage(
                imageName: 'assets/images/social2.jpg',
              ),
              BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  return Form(
                    key: BlocProvider.of<RegisterCubit>(context).formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomTextFormField(
                          controller: BlocProvider.of<RegisterCubit>(context)
                              .nameController,
                          hintText: 'Name',
                          onChanged: (value) {},
                          onSubmitted: (value) {},
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        CustomTextFormField(
                          controller: BlocProvider.of<RegisterCubit>(context)
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
                          controller: BlocProvider.of<RegisterCubit>(context)
                              .passwordController,
                          hintText: 'Password',
                          onChanged: (value) {},
                          onSubmitted: (value) {},
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        CustomButton(
                          label: 'Register',
                          onTap: () {},
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
                          label: 'Login to your account',
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
                          },
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
