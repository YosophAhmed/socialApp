import 'package:flutter/material.dart';
import 'package:social_app/widgets/custom_social_post.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => CustomSocialPost(),
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
    );
  }
}
