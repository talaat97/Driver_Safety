import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_safety/features/auth/data/models/user_model.dart';
import 'package:driver_safety/features/chat/models/message_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_states.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInitialState());

  static ChatCubit get(context) => BlocProvider.of(context);

  List<UserModel> users = [];

  Future getAllUsers() async {
    users = [];
    emit(SocialGetAllUsersLoadingState());
    try {
      var responseUsers =
          await FirebaseFirestore.instance.collection("users").get();
      await Future.forEach(responseUsers.docs, (element) {
        if (element.id != FirebaseAuth.instance.currentUser!.uid) {
          users.add(UserModel.fromJson(element.data()));
        }
      });
      emit(SocialGeAllUsersSuccessState());
    } catch (e) {
      print("Get All Users Error:- ${e.toString()}");
      emit(SocialGetAllUsersErrorState(e.toString()));
    }
  }

  void sendMessage({required String receiverId, required String? text}) async {
    emit(SendLoadingMesState());
    MessageModel messageModel = MessageModel(
      text: text,
      dateTime: DateTime.now().toString(),
      receiverId: receiverId,
      senderId: FirebaseAuth.instance.currentUser!.uid,
    );
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(messageModel.senderId)
          .collection("chats")
          .doc(receiverId)
          .collection("messages")
          .add(messageModel.toMap());

      await FirebaseFirestore.instance
          .collection("users")
          .doc(messageModel.receiverId)
          .collection("chats")
          .doc(messageModel.senderId)
          .collection("messages")
          .add(messageModel.toMap());
      emit(SendSuccessMesState());
    } catch (error) {
      print("send message error:- ${error.toString()}");
      emit(SendErrorMesState(error.toString()));
    }
  }
}
