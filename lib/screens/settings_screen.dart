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
                if (state is SelectImageLoadingState)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 2.h,
                    ),
                    child: const LinearProgressIndicator(
                      backgroundColor: Colors.grey,
                      color: Colors.lightBlue,
                    ),
                  ),
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
                            borderRadius: BorderRadius.circular(10),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image(
                            image: userModel?.coverImage == '' ? const AssetImage('assets/images/default_cover.jpg') :
                            NetworkImage(userModel!.coverImage) as ImageProvider<Object>,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        height: 20.h,
                        width: 20.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image(
                          image: userModel?.image == '' ? const AssetImage('assets/images/default_profile.jpg') :
                          NetworkImage(userModel!.image) as ImageProvider<Object>,
                          fit: BoxFit.fill,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

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
                IconButton(
                  icon: const Icon(
                    IconBroken.Edit,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.sp),
                      ),
                      builder: (context) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 4.h,
                              left: 2.w,
                              right: 2.w,
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: Column(
                              children: [
                                CustomTextField(
                                  controller: bioController,
                                  hintText: userModel.bio,
                                  onChanged: (value) {},
                                  onSaved: (value) {
                                    if (bioController.text != '') {
                                      cubit.updateBio(bio: bioController.text);
                                    }
                                    Navigator.pop(context);
                                  },
                                  maxLines: 3,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                CustomButton(
                                  label: 'Save',
                                  onTap: () {
                                    if (bioController.text != '') {
                                      cubit.updateBio(bio: bioController.text);
                                    }
                                    Navigator.pop(context);
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
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
