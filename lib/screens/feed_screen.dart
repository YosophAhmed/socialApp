import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../styles/icon_broken.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 20,
          margin: const EdgeInsets.all(12),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomCardTop(),
              ],
            ),
          ),
        ),
      ],
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
          onPressed: (){},
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

