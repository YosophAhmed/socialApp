import 'package:flutter/material.dart';

void main() {
  runApp(const SocialApp(),);
}

class SocialApp extends StatelessWidget {
  const SocialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}
