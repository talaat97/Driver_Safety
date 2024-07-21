abstract class HomeStates {}

class HomeInitialState extends HomeStates{}
class HomeGetUserState extends HomeStates{}

class HomeGetUserFromCloudLoadingState extends HomeStates{}
class HomeUserFromCloudSuccessState extends HomeStates{}
class HomeUserFromCloudErrorState extends HomeStates
{
  String error;
  HomeUserFromCloudErrorState(this.error);
}