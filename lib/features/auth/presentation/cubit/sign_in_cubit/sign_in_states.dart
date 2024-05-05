import 'package:driver_safety/features/auth/data/models/user_model.dart';

abstract class SignInStates {}

class SignInInitialState extends SignInStates{}
class SignInLoadingState extends SignInStates{}
class SignInSuccessState extends SignInStates
{
  UserModel userModel;
  SignInSuccessState(this.userModel);
}

class SignInErrorState extends SignInStates
{
  String error;
  SignInErrorState(this.error);
}