abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoadingLoginState extends LoginState {}

class SuccessLoginState extends LoginState {}

class ErrorLoginState extends LoginState {
  final String? error;
  ErrorLoginState({
    this.error,
  });
}

class PasswordVisibilityLoginState extends LoginState {}