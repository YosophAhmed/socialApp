import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/user_model.dart';

import '../../local/cache.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialAppState());
  static AppCubit get(context) => BlocProvider.of(context);

  late UserModel user;

  void getUserData() async {
    emit(GetUserLoadingState());
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(CacheHelper.getCacheData(key: 'userId'))
          .get();
      user = UserModel.fromJson(snapshot.data()!);

      emit(GetUserSuccessState());
    } catch (error) {
      emit(
        GetUserErrorState(errorMessage: error.toString()),
      );
    }
  }
}
