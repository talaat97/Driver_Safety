import 'package:driver_safety/features/auth/data/models/user_model.dart';

abstract class ProfileUpdateStates {}

class ProfileUpdateInitialState extends ProfileUpdateStates{}

class ProfileUpdateLoadingState extends ProfileUpdateStates{}
class ProfileUpdateSuccessState extends ProfileUpdateStates
{
  UserModel userModel;
  ProfileUpdateSuccessState(this.userModel);
}
class ProfileUpdateErrorState extends ProfileUpdateStates
{
  String error;
  ProfileUpdateErrorState(this.error);
}