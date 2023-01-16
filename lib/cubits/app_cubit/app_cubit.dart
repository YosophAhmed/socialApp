import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/screens/add_post_screen.dart';
import 'package:social_app/screens/chat_screen.dart';
import 'package:social_app/screens/feed_screen.dart';
import 'package:social_app/screens/settings_screen.dart';
import 'package:social_app/screens/users_screen.dart';

import '../../local/cache.dart';
import '../../widgets/custom_snackbar.dart';
import 'app_states.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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
    'My Profile',
  ];

  File? profileImage;
  File? coverImage;
  String coverImageUrl = '';
  String profileImageUrl = '';
  String bio = '';

  Future<void> selectImage({
    required BuildContext context,
    required String imageType,
    required String selectionType,
  }) async {
    final imageFile = await ImagePicker().pickImage(
      source:
          selectionType == 'Camera' ? ImageSource.camera : ImageSource.gallery,
      maxWidth: 600,
    );
    if (imageFile != null) {
      if (imageType == 'Cover') {
        coverImage = File(imageFile.path);
        var value = await firebase_storage.FirebaseStorage.instance
            .ref()
            .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
            .putFile(coverImage!);
        coverImageUrl = await value.ref.getDownloadURL();
      } else {
        profileImage = File(imageFile.path);
        var value = await firebase_storage.FirebaseStorage.instance
            .ref()
            .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
            .putFile(profileImage!);
        profileImageUrl = await value.ref.getDownloadURL();
      }
      emit(SelectImageState());
    } else {
      customSnackBar(
        context: context,
        message: 'No Image Selected',
      );
    }
  }

  void changeBio({required String newBio}) {
    user.bio = newBio;
    bio = newBio;
    emit(ChangeBioState());
  }

  void updateUserData() {
    UserModel updatedUser = UserModel(
      email: user.email,
      name: user.name,
      phone: user.phone,
      userId: user.userId,
      image: profileImageUrl,
      coverImage: coverImageUrl,
      bio: bio,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(user.userId)
        .update(updatedUser.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {});
  }
}
