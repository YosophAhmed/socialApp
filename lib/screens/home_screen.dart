import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:social_app/cubits/app_cubit/app_cubit.dart';
import 'package:social_app/cubits/app_cubit/app_states.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/widgets/custom_circular_progress_indicator.dart';
import 'package:social_app/widgets/custom_verification.dart';

import '../widgets/custom_snackbar.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getUserData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: ConditionalBuilder(
              condition: AppCubit.get(context).user != null,
              builder: (context) {
                UserModel user = AppCubit.get(context).user!;
                if (!user.isEmailVerified) {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: 7.h,
                      left: 2.w,
                      right: 2.w,
                    ),
                    child: CustomVerification(
                      onPressed: () {
                        FirebaseAuth.instance.currentUser!
                            .sendEmailVerification()
                            .then((value) {
                          customSnackBar(
                            context: context,
                            message: 'Check your email',
                          );
                        }).catchError((error) {});
                      },
                    ),
                  );
                }
                return const Center();
              },
              fallback: (context) {
                return const Center(
                  child: CustomCircularProgressIndicator(
                    color: Colors.blueAccent,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
