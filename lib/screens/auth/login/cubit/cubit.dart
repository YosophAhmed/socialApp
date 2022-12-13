import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:social_app/screens/auth/login/cubit/states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialLoginState());

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool obscure = true;
  IconData suffix = Icons.visibility_off_outlined;

  void changePasswordVisibility() {
    obscure = !obscure;
    suffix = obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(
      PasswordVisibilityLoginState(),
    );
  }
}
