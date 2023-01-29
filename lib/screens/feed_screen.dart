import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cubits/app_cubit/app_cubit.dart';
import 'package:social_app/cubits/app_cubit/app_states.dart';
import 'package:social_app/widgets/custom_social_post.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return ConditionalBuilder(
            condition: cubit.posts.isNotEmpty && cubit.userModel != null,
            builder: (context) => ListView.builder(
              itemCount: cubit.posts.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => CustomSocialPost(
                dateTime: cubit.posts[index].dateTime!,
                name: cubit.posts[index].name!,
                postText: cubit.posts[index].postText!,
                postImage: cubit.posts[index].postImage!,
                profileImage: cubit.userModel!.image,
                postProfile: cubit.posts[index].profileImage!,
                comments: 0,
                likes: 0,
                likePressed: () {},
                commentPressed: () {},
              ),
            ),
            fallback: (context) => const Center(
              child: Text(
                'No Posts yet',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ),
          );
        });
  }
}
