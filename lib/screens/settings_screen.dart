import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:social_app/cubits/app_cubit/app_cubit.dart';
import 'package:social_app/cubits/app_cubit/app_states.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/widgets/custom_botton.dart';
import 'package:social_app/widgets/custom_circle_avatar.dart';
import 'package:social_app/widgets/custom_icon.dart';
import 'package:social_app/widgets/custom_modal_bottom_sheet.dart';
import 'package:social_app/widgets/custom_text_field.dart';
import 'package:social_app/widgets/custom_text_form_field.dart';

import '../styles/icon_broken.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        UserModel userModel = AppCubit.get(context).user;
        var bioController = TextEditingController();
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Column(
            children: [
              SizedBox(
                height: 37.h,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
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
                    ),
                    CustomCircleAvatar(
                      imageName: userModel.image,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Colors.blue,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            IconBroken.Image_2,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 120),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Colors.blue,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              IconBroken.Image,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {},
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
                      userModel.name,
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
                userModel.bio,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.sp,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                margin: EdgeInsets.only(top: 2.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.blue,
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
                              bottom: MediaQuery.of(context).viewInsets.bottom,
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

                                  },
                                  maxLines: 7,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                CustomButton(
                                  label: 'Save',
                                  onTap: () {

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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.sp),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
