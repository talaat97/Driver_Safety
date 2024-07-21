abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates{}
class SignUpLoadingState extends SignUpStates{}
class SignUpSuccessState extends SignUpStates
{
  String msg;
  SignUpSuccessState(this.msg);
}

class SignUpErrorState extends SignUpStates
{
  String error;
  SignUpErrorState(this.error);
}