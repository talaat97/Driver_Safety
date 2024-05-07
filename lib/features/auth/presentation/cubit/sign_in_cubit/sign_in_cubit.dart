import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_safety/features/auth/data/models/user_model.dart';
import 'package:driver_safety/features/auth/presentation/cubit/sign_in_cubit/sign_in_states.dart';
import 'package:driver_safety/features/home/data/model/contact_model.dart';
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
          var contactResponse1 = await FirebaseFirestore.instance.collection('users')
          .doc(checkUser.docs.first.id).collection('contacts')
          .doc('1').get();
          var contactResponse2 = await FirebaseFirestore.instance.collection('users')
          .doc(checkUser.docs.first.id).collection('contacts')
          .doc('2').get();
          if(contactResponse1.exists){userModel.firstContactModel = ContactModel.fromJson(contactResponse1.data()!);} 
        if(contactResponse2.exists){userModel.secondContactModel = ContactModel.fromJson(contactResponse2.data()!);}
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
        var contactResponse1 = await FirebaseFirestore.instance.collection('users')
        .doc(checkUser.docs.first.id).collection('contacts')
        .doc('1').get();
        var contactResponse2 = await FirebaseFirestore.instance.collection('users')
        .doc(checkUser.docs.first.id).collection('contacts')
        .doc('2').get();
        userModel = UserModel.fromJson(response.data()!);
        if(contactResponse1.exists){userModel.firstContactModel = ContactModel.fromJson(contactResponse1.data()!);} 
        if(contactResponse2.exists){userModel.secondContactModel = ContactModel.fromJson(contactResponse2.data()!);}

        emit(SignInSuccessState(userModel));
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