import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:social_app/screens/login/cubit/cubit.dart';
import 'package:social_app/screens/login/login_screen.dart';

void main() {
  runApp(
    const SocialApp(),
  );
}

class SocialApp extends StatelessWidget {
  const SocialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: LoginScreen.routeName,
          routes: {
            LoginScreen.routeName: (context) => const LoginScreen(),
          },
          theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Roboto',
          ),
        );
      }),
    );
  }
}
