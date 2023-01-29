import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:social_app/constants/constants.dart';
import 'package:social_app/cubits/app_cubit/app_cubit.dart';
import 'package:social_app/cubits/app_cubit/app_states.dart';
import 'package:social_app/screens/add_post_screen.dart';

import '../styles/icon_broken.dart';

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
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){},
                    child: Container(
                      height: 7.h,
                      width: 7.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Center(
                        child: Icon(
                          IconBroken.Notification,
                          size: 28.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){},
                    child: Container(
                      height: 7.h,
                      width: 7.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Center(
                        child: Icon(
                          IconBroken.Search,
                          size: 28.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              elevation: 0.0,
              backgroundColor: Colors.transparent,
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomBar(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Chat,
                  ),
                  label: 'Chats',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Paper_Upload,
                  ),
                  label: 'Post',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Location,
                  ),
                  label: 'Users',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Profile,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// body: ConditionalBuilder(
//   condition: AppCubit.get(context).user != null,
//   builder: (context) {
//     UserModel user = AppCubit.get(context).user!;
//     if (!user.isEmailVerified) {
//       return Padding(
//         padding: EdgeInsets.only(
//           top: 7.h,
//           left: 2.w,
//           right: 2.w,
//         ),
//         child: CustomVerification(
//           onPressed: () {
//             FirebaseAuth.instance.currentUser!
//                 .sendEmailVerification()
//                 .then((value) {
//               customSnackBar(
//                 context: context,
//                 message: 'Check your email',
//               );
//             }).catchError((error) {});
//           },
//         ),
//       );
//     }
//     return const Center();
//   },
//   fallback: (context) {
//     return const Center(
//       child: CustomCircularProgressIndicator(
//         color: Colors.blueAccent,
//       ),
//     );
//   },
// ),
