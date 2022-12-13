import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../cubits/auth_cubit/auth_cubit.dart';
import '../../cubits/auth_cubit/auth_states.dart';
import '../../widgets/custom_botton.dart';
import '../../widgets/custom_divider.dart';
import '../../widgets/custom_snackbar.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/custom_top_image.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'RegisterScreen';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? name;
  String? phone;
  String? email;
  String? password;

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
      create: (BuildContext context) => AuthCubit(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomTopImage(
                imageName: 'assets/images/social2.jpg',
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is ErrorAuthState) {
                    customSnackBar(
                      context: context,
                      message: state.error,
                    );
                  } else if (state is SuccessAuthState) {
                    customSnackBar(
                      context: context,
                      message: 'Success Register',
                    );
                  }
                  else if (state is LoadingAuthState){
                    customSnackBar(
                      context: context,
                      message: 'Loading',
                    );
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: BlocProvider.of<AuthCubit>(context).formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomTextFormField(
                          controller: BlocProvider.of<AuthCubit>(context)
                              .nameController,
                          hintText: 'Name',
                          onChanged: (value) {
                            name = value;
                          },
                          onSubmitted: (value) {
                            name = value;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        CustomTextFormField(
                          controller: BlocProvider.of<AuthCubit>(context)
                              .phoneController,
                          hintText: 'Phone',
                          onChanged: (value) {
                            phone = value;
                          },
                          onSubmitted: (value) {
                            phone = value;
                          },
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        CustomTextFormField(
                          controller: BlocProvider.of<AuthCubit>(context)
                              .emailController,
                          hintText: 'Email',
                          onChanged: (value) {
                            email = value;
                          },
                          onSubmitted: (value) {
                            email = value;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        CustomTextFormField(
                          controller: BlocProvider.of<AuthCubit>(context)
                              .passwordController,
                          hintText: 'Password',
                          onChanged: (value) {
                            password = value;
                          },
                          onSubmitted: (value) {
                            password = value;
                          },
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        CustomButton(
                          label: 'Register',
                          onTap: () async {
                            if (BlocProvider.of<AuthCubit>(context)
                                .formKey
                                .currentState!
                                .validate()) {
                              BlocProvider.of<AuthCubit>(context).register(
                                email: email!,
                                password: password!,
                              );
                            }
                          },
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
                            Navigator.pushNamedAndRemoveUntil(context,
                                LoginScreen.routeName, (route) => false);
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
