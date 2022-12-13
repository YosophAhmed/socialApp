import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:social_app/screens/auth/login/login_screen.dart';
import 'package:social_app/screens/auth/register/register_screen.dart';

void main() {
  runApp(
    const SocialApp(),
  );
}

class SocialApp extends StatelessWidget {
  const SocialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.routeName,
        routes: {
          LoginScreen.routeName : (context) => const LoginScreen(),
          RegisterScreen.routeName : (context) => const RegisterScreen(),
        },
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Roboto',
        ),
      );
    });
  }
}
