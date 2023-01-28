import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:social_app/constants/constants.dart';
import 'package:social_app/screens/add_post_screen.dart';
import 'package:social_app/screens/auth_screens/login_screen.dart';
import 'package:social_app/screens/auth_screens/register_screen.dart';
import 'package:social_app/screens/home_screen.dart';
import 'cache/cache_helper.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();

  userID = CacheHelper.getCacheData(key: 'userId');

  String startWidget;

  if (userID != null) {
    startWidget = HomeScreen.routeName;
  } else {
    startWidget = LoginScreen.routeName;
  }

  runApp(
    SocialApp(
      startWidget: startWidget,
    ),
  );
}

class SocialApp extends StatelessWidget {
  final String startWidget;

  const SocialApp({
    Key? key,
    required this.startWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: startWidget,
        routes: {
          LoginScreen.routeName: (context) => const LoginScreen(),
          RegisterScreen.routeName: (context) => const RegisterScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          AddPostScreen.routeName: (context) => const AddPostScreen(),
        },
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Roboto',
          primarySwatch: Colors.grey,
          useMaterial3: true,
        ),
      );
    });
  }
}
