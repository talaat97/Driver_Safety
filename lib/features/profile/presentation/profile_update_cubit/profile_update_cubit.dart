
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_safety/features/auth/data/models/user_model.dart';
import 'package:driver_safety/features/profile/presentation/profile_update_cubit/profile_update_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUpdateCubit extends Cubit<ProfileUpdateStates> {
  ProfileUpdateCubit() : super(ProfileUpdateInitialState());

  static ProfileUpdateCubit get(context) => BlocProvider.of(context);

  void updateUser({required UserModel userModel}) async
  {
    emit(ProfileUpdateLoadingState());
    try
    {
      await FirebaseFirestore.instance.collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid).set(userModel.toJson());
      emit(ProfileUpdateSuccessState(userModel));
    }
    catch(e)
    {
      print(e.toString());
      emit(ProfileUpdateErrorState(e.toString()));
    }
  }
}