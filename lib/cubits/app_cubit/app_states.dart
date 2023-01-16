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

class ChangeBioState extends AppStates {}



