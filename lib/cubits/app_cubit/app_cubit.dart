import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/constants/constants.dart';
import 'package:social_app/models/post_model.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/screens/add_post_screen.dart';
import 'package:social_app/screens/chat_screen.dart';
import 'package:social_app/screens/feed_screen.dart';
import 'package:social_app/screens/settings_screen.dart';
import 'package:social_app/screens/users_screen.dart';

import '../../widgets/custom_snackbar.dart';
import 'app_states.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AppCubit extends Cubit<AppStates> {
  static AppCubit get(context) => BlocProvider.of(context);

  AppCubit() : super(InitialAppState());

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

  UserModel? userModel;
  void getUserData() {
    emit(GetUserLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(
        value.data()!,
      );
      emit(GetUserSuccessState());
    }).catchError((error) {
      emit(
        GetUserErrorState(
          errorMessage: error.toString(),
        ),
      );
    });
  }

  File? profileImage;
  File? coverImage;
  String coverImageUrl = '';
  String profileImageUrl = '';

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
    emit(SelectImageLoadingState());
    if (imageFile != null) {
      if (imageType == 'Cover') {
        coverImage = File(imageFile.path);
        var value = await firebase_storage.FirebaseStorage.instance
            .ref()
            .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
            .putFile(coverImage!);
        coverImageUrl = await value.ref.getDownloadURL();
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userID)
            .update({
          'coverImage': coverImageUrl,
        });
        getUserData();
      } else {
        profileImage = File(imageFile.path);
        var value = await firebase_storage.FirebaseStorage.instance
            .ref()
            .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
            .putFile(profileImage!);
        profileImageUrl = await value.ref.getDownloadURL();
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userID)
            .update({
          'image': profileImageUrl,
        });
        getUserData();
      }
      emit(SelectImageState());
    } else {
      customSnackBar(
        context: context,
        message: 'No Image Selected',
      );
      emit(
        ErrorSelectImageState(
          errorMessage: 'No Image Selected',
        ),
      );
    }
  }

  Future<void> updateBio({
    required String bio,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(userID).update({
        'bio': bio,
      });
      getUserData();
    } catch (error) {
      emit(ErrorUpdateBioState(
        errorMessage: error.toString(),
      ));
    }
  }

  File? postImage;
  String? postImageUrl;

  Future<void> selectPostImage({
    required BuildContext context,
    required String selectionType,
  }) async {
    final imageFile = await ImagePicker().pickImage(
      source:
          selectionType == 'Camera' ? ImageSource.camera : ImageSource.gallery,
      maxWidth: 600,
    );
    emit(SelectImageLoadingState());
    if (imageFile != null) {
      postImage = File(imageFile.path);
      var value = await firebase_storage.FirebaseStorage.instance
          .ref()
          .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
          .putFile(postImage!);
      postImageUrl = await value.ref.getDownloadURL();
      emit(SelectImageState());
    } else {
      customSnackBar(
        context: context,
        message: 'No Image Selected',
      );
      emit(
        ErrorSelectImageState(
          errorMessage: 'No Image Selected',
        ),
      );
    }
  }

  void removePostImage() {
    postImage = null;
    postImageUrl = null;
    emit(RemoveImageState());
  }

  String? postText;

  Future<void> addPost() async {
    emit(LoadingAddPostState());
    try {
      await FirebaseFirestore.instance.collection('posts').add({
        'userId': userID,
        // 'postId': postId,
        'dateTime': DateTime.now().toString().substring(0, 16),
        'postText': postText,
        'postImage': postImageUrl ?? '',
        'profileImage' : userModel!.image,
        'name' : userModel!.name,

      });
      getPosts();
      emit(SuccessAddPostState());
    } catch (error) {
      emit(
        ErrorAddPostState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  late List<PostModel> posts = [];

  Future<void> getPosts() async {
    posts = [];
    emit(LoadingGetPostsState());
    try {
      FirebaseFirestore.instance.collection('posts').get().then((value) {
        for (var element in value.docs) {
          posts.add(
            PostModel.fromJson(
              element.data(),
            ),
          );
        }
      });
      emit(SuccessGetPostsState());
    } catch (error) {
      emit(
        ErrorGetPostsState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
