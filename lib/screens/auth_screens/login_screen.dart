import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:social_app/screens/auth_screens/register_screen.dart';
import 'package:social_app/screens/home_screen.dart';
import 'package:social_app/widgets/custom_botton.dart';
import 'package:social_app/widgets/custom_divider.dart';
import 'package:social_app/widgets/custom_snackbar.dart';

import '../../cache/cache_helper.dart';
import '../../cubits/auth_cubit/auth_cubit.dart';
import '../../cubits/auth_cubit/auth_states.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/custom_top_image.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                imageName: 'assets/images/social.png',
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is LoadingAuthState) {
                    customSnackBar(
                      context: context,
                      message: 'Loading',
                    );
                  } else if (state is SuccessAuthState) {
                    CacheHelper.saveCacheData(
                      key: 'userId',
                      value: state.userId,
                    ).then((value) {
                      Navigator.pushReplacementNamed(
                        context,
                        HomeScreen.routeName,
                      );
                    });
                  } else if (state is ErrorAuthState) {
                    customSnackBar(
                      context: context,
                      message: state.error,
                    );
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: BlocProvider.of<AuthCubit>(context).formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      child: Column(children: [
                        SizedBox(
                          height: 10.h,
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
                          suffix: BlocProvider.of<AuthCubit>(context).suffix,
                          obscure: BlocProvider.of<AuthCubit>(context).obscure,
                          suffixFunction: () {
                            BlocProvider.of<AuthCubit>(context)
                                .changePasswordVisibility();
                          },
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        CustomButton(
                          label: 'Log in',
                          onTap: () async {
                            if (BlocProvider.of<AuthCubit>(context)
                                .formKey
                                .currentState!
                                .validate()) {
                              BlocProvider.of<AuthCubit>(context).userLogin(
                                email: email!,
                                password: password!,
                              );
                            }
                          },
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
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              RegisterScreen.routeName,
                            );
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
