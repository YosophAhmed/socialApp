import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:social_app/cubits/app_cubit/app_cubit.dart';
import 'package:social_app/cubits/app_cubit/app_states.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/widgets/custom_botton.dart';
import 'package:social_app/widgets/custom_circle_avatar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        UserModel userModel = AppCubit.get(context).user;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Column(
            children: [
              SizedBox(
                height: 32.h,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Image.network(
                          userModel.coverImage,
                          fit: BoxFit.fill,
                          height: 22.h,
                          width: double.infinity,
                        ),
                      ),
                      alignment: Alignment.topCenter,
                    ),
                    CustomCircleAvatar(
                      imageName: userModel.image,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 2.h,
                  bottom: 1.h,
                ),
                child: Text(
                  userModel.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.sp,
                  ),
                ),
              ),
              Text(
                userModel.bio,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomButton(
                onTap: () {},
                label: 'Edit Profile',
                buttonWidth: 40.w,
              ),
            ],
          ),
        );
      },
    );
  }
}
