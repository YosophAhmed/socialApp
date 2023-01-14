import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/screens/add_post_screen.dart';
import 'package:social_app/screens/chat_screen.dart';
import 'package:social_app/screens/feed_screen.dart';
import 'package:social_app/screens/settings_screen.dart';
import 'package:social_app/screens/users_screen.dart';

import '../../local/cache.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  static AppCubit get(context) => BlocProvider.of(context);

  late UserModel user;

  AppCubit() : super(InitialAppState());

  void getUserData() {
    emit(GetUserLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(CacheHelper.getCacheData(key: 'userId'))
        .get()
        .then((value) {
      user = UserModel.fromJson(value.data()!);
      emit(GetUserSuccessState());
    }).catchError((error) {
      emit(
        GetUserErrorState(errorMessage: error.toString()),
      );
    });
  }

  int currentIndex = 0;

  List<Widget> screens = const [
    FeedScreen(),
    ChatScreen(),
    AddPostScreen(),
    UsersScreen(),
    SettingsScreen(),
  ];

  void changeBottomBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  List<String> titles = const [
    'Home',
    'Chats',
    'Add post',
    'Users',
    'Profile',
  ];
}
