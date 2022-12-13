import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(
          InitialAuthState(),
        );

  bool obscure = true;
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  IconData suffix = Icons.visibility_off_outlined;

  void changePasswordVisibility() {
    obscure = !obscure;
    suffix =
        obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(
      PasswordVisibilityAuthState(),
    );
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(
      LoadingAuthState(),
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(
        SuccessAuthState(),
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

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(
      LoadingAuthState(),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(
        SuccessAuthState(),
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
}
