import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cache/cache_helper.dart';
import 'package:social_app/constants/constants.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/styles/icon_broken.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitialAuthState());

  bool obscure = true;
  IconData suffix = IconBroken.Hide;

  void changePasswordVisibility() {
    obscure = !obscure;
    suffix =
        obscure ? IconBroken.Hide : IconBroken.Show;
    emit(
      PasswordVisibilityAuthState(),
    );
  }

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoadingAuthState());
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(
        SuccessAuthState(
          userId: userCredential.user!.uid,
        ),
      );
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        emit(
          ErrorAuthState(
            error: 'User not found',
          ),
        );
      } else if (error.code == 'wrong-password') {
        emit(
          ErrorAuthState(
            error: 'Wrong password',
          ),
        );
      }
    } catch (error) {
      emit(
        ErrorAuthState(
          error: 'Something went wrong',
        ),
      );
    }
  }

  void createUser({
    required String name,
    required String phone,
    required String email,
    required String userId,
  }) {
    UserModel user = UserModel(
      name: name,
      email: email,
      phone: phone,
      userId: userId,
      image: '',
      coverImage: '',
      bio: '',
    );
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .set(user.toMap());
      emit(CreateUserSuccessState());
    } catch (error) {
      emit(CreateUserErrorState(
        error: error.toString(),
      ));
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    emit(
      LoadingAuthState(),
    );
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      userID = userCredential.user!.uid;
      CacheHelper.saveCacheData(key: 'userId', value: userID);
      createUser(
        name: name,
        phone: phone,
        email: email,
        userId: userID!,
      );
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        emit(
          ErrorAuthState(
            error: 'Password is weak',
          ),
        );
      } else if (error.code == 'email-already-in-use') {
        emit(
          ErrorAuthState(
            error: 'Email already exists',
          ),
        );
      }
    } catch (error) {
      emit(
        ErrorAuthState(
          error: 'Something went wrong',
        ),
      );
    }
  }

}
