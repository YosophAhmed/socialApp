abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class SuccessAuthState extends AuthState {
  final String userId;

  SuccessAuthState({
    required this.userId,
  });
}

class ErrorAuthState extends AuthState {
  final String error;

  ErrorAuthState({
    required this.error,
  });
}

class PasswordVisibilityAuthState extends AuthState {}

class CreateUserSuccessState extends AuthState {}

class CreateUserErrorState extends AuthState {
  final String error;

  CreateUserErrorState({
    required this.error,
  });
}

class GetUserLoadingState extends AuthState {}

class GetUserSuccessState extends AuthState {}

class GetUserErrorState extends AuthState {
  final String errorMessage;

  GetUserErrorState({
    required this.errorMessage,
  });
}
