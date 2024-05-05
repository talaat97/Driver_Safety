import 'package:driver_safety/features/home/data/model/contact_model.dart';

abstract class ContactsStates {}

class ContactsInitialState extends ContactsStates{}

class ContactsUpdateLoadingState extends ContactsStates{}
class ContactsUpdateSuccessState extends ContactsStates
{
  ContactModel firstContactModel;
  ContactModel secondContactModel;
  ContactsUpdateSuccessState(this.firstContactModel, this.secondContactModel);
}
class ContactsUpdateErrorState extends ContactsStates
{
  String error;
  ContactsUpdateErrorState(this.error);
}