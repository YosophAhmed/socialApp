abstract class AppStates {}

class InitialAppState extends AppStates {}

class GetUserLoadingState extends AppStates {}

class GetUserSuccessState extends AppStates {}

class GetUserErrorState extends AppStates {
  final String errorMessage;

  GetUserErrorState({
    required this.errorMessage,
  });
}

class ChangeBottomNavBarState extends AppStates {}

class SelectImageState extends AppStates {}

class RemoveImageState extends AppStates {}

class SelectImageLoadingState extends AppStates {}

class ErrorSelectImageState extends AppStates {
  final String errorMessage;

  ErrorSelectImageState({
    required this.errorMessage,
  });
}

class ErrorUpdateBioState extends AppStates {
  final String errorMessage;

  ErrorUpdateBioState({
    required this.errorMessage,
  });
}

class LoadingAddPostState extends AppStates {}

class SuccessAddPostState extends AppStates {}

class ErrorAddPostState extends AppStates {
  final String errorMessage;

  ErrorAddPostState({
    required this.errorMessage,
  });
}

class LoadingGetPostsState extends AppStates {}

class SuccessGetPostsState extends AppStates {}

class ErrorGetPostsState extends AppStates {
  final String errorMessage;

  ErrorGetPostsState({
    required this.errorMessage,
  });
}


class SuccessLikePostsState extends AppStates {}

class ErrorLikePostsState extends AppStates {
  final String errorMessage;

  ErrorLikePostsState({
    required this.errorMessage,
  });
}
