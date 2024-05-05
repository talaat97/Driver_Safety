import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_safety/features/auth/data/models/user_model.dart';
import 'package:driver_safety/features/auth/presentation/cubit/sign_up_cubit/sign_up_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  Future signUp({required UserModel userModel}) async
  {
    emit(SignUpLoadingState());
    try {
        var checkUser = await FirebaseFirestore.instance.
        collection('users').where('phone', isEqualTo: userModel.phone).get(); 
        if(checkUser.docs.isNotEmpty)
        {
          emit(SignUpErrorState('Phone Number already exists.\nTry sign in'));
        }
        else
        {
          var crederntial = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: userModel.email!,
            password: userModel.password!
          );
          if (crederntial.user != null)
          {
            await FirebaseAuth.instance.currentUser!.sendEmailVerification();
            await FirebaseFirestore.instance.
            collection('users').doc(crederntial.user!.uid).set(userModel.toJson());
            emit(SignUpSuccessState('Verification Email has been sent to your email.\nPlease Verify Email'));
          }
        }
      } on FirebaseAuthException catch (e) 
      {
        String errorMsg = e.toString();
        if (e.code == 'weak-password')
        {
          errorMsg = 'The password provided is too weak.';
        } 
        else if (e.code == 'email-already-in-use')
        {
          errorMsg = 'The account already exists for that email.';
        }
        emit(SignUpErrorState(errorMsg));
      } catch (e) 
      {
        emit(SignUpErrorState(e.toString()));
      }
  }

}