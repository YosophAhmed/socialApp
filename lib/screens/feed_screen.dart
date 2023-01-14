import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:social_app/widgets/custom_divider.dart';

import '../styles/icon_broken.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 20,
            margin: const EdgeInsets.all(12),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomCardTop(),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
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
                      CustomTag(
                        tag: '#Blinders',
                      ),
                      CustomTag(
                        tag: '#Series',
                      ),
                      CustomTag(
                        tag: '#Favourite_show',
                      ),
                      CustomTag(
                        tag: '#Clilian_Murphy',
                      ),
                      CustomTag(
                        tag: '#Best_Actor',
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
                ],
              ),
            ),
          ),
        ],
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
    return SizedBox(
      height: 20.0,
      child: Padding(
        padding: EdgeInsets.only(
          right: 1.w,
        ),
        child: MaterialButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: Text(
            tag,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
