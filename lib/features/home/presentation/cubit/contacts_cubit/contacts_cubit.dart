import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_safety/features/auth/data/models/user_model.dart';
import 'package:driver_safety/features/home/data/model/contact_model.dart';
import 'package:driver_safety/features/home/presentation/cubit/contacts_cubit/contacts_states.dart';
import 'package:driver_safety/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsCubit extends Cubit<ContactsStates> {
  ContactsCubit() : super(ContactsInitialState());

  static ContactsCubit get(context) => BlocProvider.of(context);

  ContactModel? firstContact;
  ContactModel? secondContact;

  void updateContact({
    required String firstContactMsg,
    required String secondContactMsg,
    required UserModel userModel
  }) async
  {
    emit(ContactsUpdateLoadingState());
    try{
      if(secondContact ==null && userModel.secondContactModel==null)
      {
        emit(ContactsUpdateErrorState('Please add Contacts First'));
        return ;
      }
      if(secondContact ==null||firstContact==null)
      {
        firstContact = userModel.firstContactModel;
        secondContact = userModel.secondContactModel;
      }
      firstContact!.msgTo = firstContactMsg;
      secondContact!.msgTo = secondContactMsg;
      


      if(await checkExist(firstContact!) && await checkExist(secondContact!))
      {
        await FirebaseFirestore.instance.collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid).collection('contacts')
            .doc('1').set(firstContact!.toJson());

        await FirebaseFirestore.instance.collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid).collection('contacts')
            .doc('2').set(secondContact!.toJson());

        emit(ContactsUpdateSuccessState(firstContact!, secondContact!));
      }
      else
      {
        emit(ContactsUpdateErrorState('Phone Number seems that dosn\'t have an account'));
      }

    }catch(e)
    {
      emit(ContactsUpdateErrorState(e.toString()));
    }
  }

  Future<bool> checkExist(ContactModel contactModel)async{

    try{
    var response = await FirebaseFirestore.instance.collection('users')
    .where('phone', isEqualTo: contactModel.phone!).get();
    if(response.docs.isEmpty)
    {
      return false;
    }
    else
    {
      contactModel.id = response.docs.first.id;
      return true;
    }
  }catch(e)
    {
      return false;
    }
  }

}