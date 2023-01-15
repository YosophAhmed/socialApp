import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../styles/icon_broken.dart';
import 'custom_divider.dart';

class CustomSocialPost extends StatelessWidget {
  const CustomSocialPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 20,
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCardTop(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 1.0),
              child: CustomDivider(
                text: '',
              ),
            ),
            Text(
              ''''\"I have no limitations\" Cillian Murphy has won the Best Actor Award for his role as Tommy Shelby in series six of Peaky Blinders at the #tvchoiceawards! Thank you to our incredible fans for voting and congratulations to Cillian! 👏''',
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
            Wrap(
              children: const [
                CustomTag(
                  tag: '#Peaky',
                ),
              ],
            ),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Image.network(
                'https://i.dailymail.co.uk/1s/2022/02/22/01/54483393-0-image-a-174_1645494308216.jpg',
                fit: BoxFit.fill,
                height: 25.h,
                width: double.infinity,
              ),
            ),
            Row(
              children: [
                CustomCommentButton(
                  onTap: () {},
                ),
                const Spacer(),
                CustomLikeButton(
                  onTap: () {},
                  text: '1200',
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
                  padding: EdgeInsets.only(
                    right: 15,
                  ),
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(
                      'https://i.ytimg.com/vi/HOtc0TQ7WBU/maxresdefault.jpg',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
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
                  onTap: () {},
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
  const CustomCardTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(
            left: 8,
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

  const CustomCommentButton({
    Key? key,
    required this.onTap,
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
            '500 Comments',
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
