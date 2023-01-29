import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../styles/icon_broken.dart';
import 'custom_divider.dart';

class CustomSocialPost extends StatelessWidget {
  final String name;
  final String profileImage;
  final String dateTime;
  final String postText;
  final String postImage;
  final int likes;
  final int comments;
  final String postProfile;
  final VoidCallback likePressed;
  final VoidCallback commentPressed;

  const CustomSocialPost({
    Key? key,
    this.postProfile = '',
    required this.name,
    required this.profileImage,
    required this.dateTime,
    required this.postText,
    this.postImage = '',
    this.likes = 0,
    this.comments = 0,
    required this.likePressed,
    required this.commentPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 15,
      ),
      color: Colors.grey.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCardTop(
              name: name,
              dateTime: dateTime,
              profileImage: postProfile,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 1.0),
              child: CustomDivider(
                text: '',
              ),
            ),
            Text(
              postText,
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
            // Wrap(
            //   children: const [
            //     CustomTag(
            //       tag: '#Peaky',
            //     ),
            //   ],
            // ),
            ConditionalBuilder(
              condition: postImage != '',
              builder: (context) => Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Image.network(
                  postImage,
                  height: 30.h,
                  width: double.infinity,
                ),
              ),
              fallback: (context) => SizedBox(
                height: 2.h,
              ),
            ),
            Row(
              children: [
                CustomCommentButton(
                  onTap: () {},
                  comments: comments,
                ),
                const Spacer(),
                CustomLikeButton(
                  onTap: () {},
                  text: likes.toString(),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 0.5),
              child: CustomDivider(
                text: '',
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 15,
                  ),
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: ConditionalBuilder(
                      condition: profileImage == '',
                      builder: (context) => const Image(
                        image: AssetImage(
                          'assets/images/default_profile.jpg',
                        ),
                        fit: BoxFit.fill,
                      ),
                      fallback: (context) => Image.network(
                        profileImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: commentPressed,
                  child: Text(
                    'Write a comment ...',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                const Spacer(),
                CustomLikeButton(
                  onTap: likePressed,
                  text: 'Like',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCardTop extends StatelessWidget {
  final String profileImage;
  final String name;
  final String dateTime;

  const CustomCardTop({
    Key? key,
    this.profileImage = '',
    required this.name,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 8,
            right: 16,
          ),
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            clipBehavior: Clip.antiAlias,
            child: ConditionalBuilder(
              condition: profileImage == '',
              builder: (context) => const Image(
                image: AssetImage('assets/images/default_profile.jpg'),
                fit: BoxFit.fill,
              ),
              fallback: (context) => Image.network(
                profileImage,
                fit: BoxFit.fill,
              ),
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
                    name,
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
                dateTime,
                style: const TextStyle(
                  color: Colors.white54,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            IconBroken.More_Circle,
            size: 26.sp,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class CustomTag extends StatelessWidget {
  final String tag;

  const CustomTag({
    Key? key,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        '#Peaky',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}

class CustomLikeButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const CustomLikeButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            IconBroken.Heart,
            color: Colors.red,
            size: 18.sp,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCommentButton extends StatelessWidget {
  final Function() onTap;
  final int comments;

  const CustomCommentButton({
    Key? key,
    required this.onTap,
    this.comments = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            IconBroken.Chat,
            color: Colors.amber,
            size: 18.sp,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            '$comments Comments',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
