import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:social_app/cubits/app_cubit/app_cubit.dart';
import 'package:social_app/cubits/app_cubit/app_states.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/widgets/custom_botton.dart';
import 'package:social_app/widgets/custom_divider.dart';
import 'package:social_app/widgets/custom_modal_bottom_sheet.dart';
import 'package:social_app/widgets/custom_text_field.dart';

import '../styles/icon_broken.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        UserModel? userModel = cubit.userModel;
        File? profileImage = cubit.profileImage;
        File? coverImage = cubit.coverImage;
        var bioController = TextEditingController();

        return Padding(
          padding: EdgeInsets.only(
            left: 2.w,
            right: 2.w,
            top: 1.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 37.h,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 22.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: coverImage == null
                                  ? const AssetImage(
                                      'assets/images/default_cover.jpg',
                                    )
                                  : FileImage(coverImage)
                                      as ImageProvider<Object>,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 60.sp,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 57.sp,
                          backgroundImage: profileImage == null
                              ? const AssetImage(
                                  'assets/images/default_profile.jpg',
                                )
                              : FileImage(profileImage)
                                  as ImageProvider<Object>?,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Colors.transparent,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              IconBroken.Edit,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              customBottomModalSheet(
                                context: context,
                                widget: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomButton(
                                        label: 'Camera',
                                        onTap: () {
                                          cubit.selectImage(
                                            context: context,
                                            imageType: 'Cover',
                                            selectionType: 'Camera',
                                          );
                                          cubit.updateUserData();
                                          Navigator.pop(context);
                                        },
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      const CustomDivider(
                                        text: ' OR ',
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      CustomButton(
                                        label: 'Gallery',
                                        onTap: () {
                                          cubit.selectImage(
                                            context: context,
                                            imageType: 'Cover',
                                            selectionType: 'Gallery',
                                          );
                                          cubit.updateUserData();
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 150),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: Colors.transparent,
                            ),
                            child: IconButton(
                              icon: const Icon(
                                IconBroken.Edit,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () {
                                customBottomModalSheet(
                                  context: context,
                                  widget: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomButton(
                                          label: 'Camera',
                                          onTap: () {
                                            cubit.selectImage(
                                              context: context,
                                              imageType: 'Profile',
                                              selectionType: 'Camera',
                                            );
                                            cubit.updateUserData();
                                            Navigator.pop(context);
                                          },
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        const CustomDivider(
                                          text: ' OR ',
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        CustomButton(
                                          label: 'Gallery',
                                          onTap: () {
                                            cubit.selectImage(
                                              context: context,
                                              imageType: 'Profile',
                                              selectionType: 'Gallery',
                                            );
                                            cubit.updateUserData();
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 2.h,
                    bottom: 1.h,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 25.w,
                      ),
                      Text(
                        userModel!.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.sp,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Icon(
                        Icons.check_circle,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
                Text(
                  userModel.bio == '' ? 'Add your bio' : userModel.bio,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: EdgeInsets.only(top: 1.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.transparent,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      IconBroken.Edit,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 2.w,
                                right: 2.w,
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  CustomTextField(
                                    controller: bioController,
                                    hintText: userModel.bio,
                                    onChanged: (value) {},
                                    onSaved: (value) {
                                      userModel.bio = bioController.text;
                                      Navigator.pop(context);
                                    },
                                    maxLines: 7,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  CustomButton(
                                    label: 'Save',
                                    onTap: () {
                                      // if (bioController.text != '') {
                                      //   cubit.changeBio(
                                      //     newBio: bioController.text,
                                      //   );
                                      //   cubit.updateUserData();
                                      // }
                                      // Navigator.pop(context);
                                    },
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.sp),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
