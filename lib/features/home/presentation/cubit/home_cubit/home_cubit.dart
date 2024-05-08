
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_safety/features/auth/data/models/user_model.dart';
import 'package:driver_safety/features/auth/presentation/views/sign_in_view.dart';
import 'package:driver_safety/features/home/data/model/contact_model.dart';
import 'package:driver_safety/features/home/presentation/cubit/home_cubit/home_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;
  void assignUser({required UserModel userModel})
  {
    this.userModel = userModel;
    emit(HomeGetUserState());
  }

  void getUserFromCloud() async
  {
    if(FirebaseAuth.instance.currentUser !=null)
    {
      emit(HomeGetUserFromCloudLoadingState());
      try{
      var response = await FirebaseFirestore.instance.collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid).get();

      var contactResponse1 = await FirebaseFirestore.instance.collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid).collection('contacts')
      .doc('1').get();
      var contactResponse2 = await FirebaseFirestore.instance.collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid).collection('contacts')
      .doc('2').get();

      userModel = UserModel.fromJson(response.data()!);
      if(contactResponse1.exists){userModel!.firstContactModel = ContactModel.fromJson(contactResponse1.data()!);}
      if(contactResponse2.exists){userModel!.secondContactModel = ContactModel.fromJson(contactResponse2.data()!);}


      emit(HomeUserFromCloudSuccessState());
      }
      catch(e)
      {
        emit(HomeUserFromCloudErrorState('Sorry, there is an issue \nTry again later'));
        print(e.toString());
        Get.off(const SignInView());
      }
    }
  }
}