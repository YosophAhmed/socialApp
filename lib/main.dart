import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:social_app/screens/auth_screens/login_screen.dart';
import 'package:social_app/screens/auth_screens/register_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
