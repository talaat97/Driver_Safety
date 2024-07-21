abstract class ChatStates{
}


class ChatInitialState extends ChatStates{}

//get all users
class SocialGetAllUsersLoadingState extends ChatStates{}
class SocialGeAllUsersSuccessState extends ChatStates{}
class SocialGetAllUsersErrorState extends ChatStates
{
  String error;
  SocialGetAllUsersErrorState(this.error);
}

// ADd Message
class SendLoadingMesState extends ChatStates{}
class SendSuccessMesState extends ChatStates{}
class SendErrorMesState extends ChatStates
{
  String error;
  SendErrorMesState(this.error);
}