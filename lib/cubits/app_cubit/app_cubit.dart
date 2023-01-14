import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/user_model.dart';

import '../../local/cache.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialAppState());
  static AppCubit get(context) => BlocProvider.of(context);

  UserModel? user;

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
}
