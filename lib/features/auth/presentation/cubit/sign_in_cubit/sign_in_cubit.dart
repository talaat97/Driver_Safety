import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_safety/features/auth/data/models/user_model.dart';
import 'package:driver_safety/features/auth/presentation/cubit/sign_in_cubit/sign_in_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(SignInInitialState());

  static SignInCubit get(context) => BlocProvider.of(context);

  void checkUserSignIn(String email, String password) async
  {
    
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password
    );  
    if(credential.user!.emailVerified)
    {
      emit(SignInSuccessState());
    }
    else
    {
      emit(SignInErrorState('Email has not been verified yet\nPlease check your email'));
    }
  }
  Future signIn({required String emailOrPhone, required String password}) async
  {
    emit(SignInLoadingState());
    try 
    {
      var checkUser = await FirebaseFirestore.instance.
        collection('users').doc(emailOrPhone).get(); 
        if(checkUser.exists)
        {
          UserModel userModel = UserModel.fromJson(checkUser.data()!);
          checkUserSignIn(userModel.email!, password);
        }
        else
        {
          checkUserSignIn(emailOrPhone, password);
        }
    }
     on FirebaseAuthException catch (e) 
     {
      String errMsg = e.toString();
      if (e.code == 'user-not-found') {
        errMsg = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errMsg = 'Wrong password provided for that user.';
      }
      emit(SignInErrorState(errMsg));
    }
  }

}