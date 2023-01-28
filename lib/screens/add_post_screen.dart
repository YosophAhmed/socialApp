import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:social_app/constants/constants.dart';
import 'package:social_app/cubits/app_cubit/app_cubit.dart';
import 'package:social_app/cubits/app_cubit/app_states.dart';

import '../styles/icon_broken.dart';
import '../widgets/custom_botton.dart';
import '../widgets/custom_divider.dart';
import '../widgets/custom_modal_bottom_sheet.dart';

class AddPostScreen extends StatelessWidget {
  static const String routeName = 'AddPostScreen';
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (state, context) {},
      builder: (state, context) {
        var cubit = AppCubit.get(context);
        var controller = TextEditingController();
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: 2.h,
            horizontal: 2.w,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      right: 16,
                    ),
                    child: CircleAvatar(
                      radius: 35.0,
                      backgroundImage: NetworkImage(
                        'https://i.ytimg.com/vi/HOtc0TQ7WBU/maxresdefault.jpg',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Thomas Shelbey',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
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
                        Text(
                          DateTime.now().toString().substring(0, 16),
                          style: const TextStyle(
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Post',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.blueAccent,
                  decoration: const InputDecoration(
                    hintText: 'What is in your mind?',
                    border: InputBorder.none,
                  ),
                  maxLines: 10,
                  onFieldSubmitted: (value) {
                    if (value != '') {
                      controller.text = value;
                    }
                  },
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      customBottomModalSheet(
                        context: homeContext!,
                        widget: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomButton(
                                label: 'Camera',
                                onTap: () {
                                  cubit.selectPostImage(
                                    context: homeContext!,
                                    selectionType: 'Camera',
                                  );
                                  Navigator.pop(homeContext!);
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
                                  cubit.selectPostImage(
                                    context: homeContext!,
                                    selectionType: 'Gallery',
                                  );
                                  Navigator.pop(homeContext!);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: const [
                        Icon(
                          IconBroken.Image,
                          size: 30,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Add Image',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      '#Tags',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
