import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_safety/features/auth/data/models/user_model.dart';
import 'package:driver_safety/features/auth/presentation/cubit/sign_in_cubit/sign_in_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(SignInInitialState());

  static SignInCubit get(context) => BlocProvider.of(context);

  /*void checkUserSignIn({required String input1, required String password, UserModel? userModel}) async
  {
    
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: input1,
      password: password
    );  
    if(credential.user!.emailVerified)
    {
      if(userModel != null)
      {
        emit(SignInSuccessState(userModel));
      }
      else
      {
        var response = await FirebaseFirestore.instance.collection('users')
        .where('email', isEqualTo: input1).get();
        emit(SignInSuccessState(UserModel.fromJson(response.docs[0].data())));
      }
    }
    else
    {
      emit(SignInErrorState('Email has not been verified yet\nPlease check your email'));
    }
  }
  */
  Future signIn({required String emailOrPhone, required String password}) async
  {
    emit(SignInLoadingState());
    try 
    {
      var checkUser = await FirebaseFirestore.instance.
        collection('users').where('phone', isEqualTo: emailOrPhone).get(); 
        String input1 = emailOrPhone;
        UserModel? userModel;
        if(checkUser.docs.isNotEmpty)
        {
          userModel = UserModel.fromJson(checkUser.docs.first.data());
          input1 = userModel.email!;
        }
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: input1,
          password: password
        );  
    if(credential.user!.emailVerified)
    {
      if(userModel != null)
      {
        emit(SignInSuccessState(userModel));
      }
      else
      {
        var response = await FirebaseFirestore.instance.collection('users')
        .doc(credential.user!.uid).get();
        emit(SignInSuccessState(UserModel.fromJson(response.data()!)));
      }
    }
    else
    {
      emit(SignInErrorState('Email has not been verified yet\nPlease check your email'));
    }
    }
     on FirebaseAuthException catch (e) 
     {
      print('object--------------');
      print(e.code);
      String errMsg = e.toString();
      if (e.code == 'user-not-found') {
        errMsg = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errMsg = 'Wrong password provided for that user.';
      }
       else if (e.code == 'invalid-credential') {
        errMsg = 'Wrong email or password';
      }
      emit(SignInErrorState(errMsg));
    }
    catch(e)
    {
      emit(SignInErrorState(e.toString()));
    }
  }

}