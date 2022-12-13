abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class SuccessAuthState extends AuthState {}

class ErrorAuthState extends AuthState {
  final String error;

  ErrorAuthState({
    required this.error,
  });
}

class PasswordVisibilityAuthState extends AuthState {}

