import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:driver_safety/features/chat/presentation/cubit/chat_cubit/chat_cubit.dart';
import 'package:driver_safety/features/chat/presentation/cubit/chat_cubit/chat_states.dart';
import 'package:driver_safety/features/home/data/model/contact.dart';
import 'package:driver_safety/features/home/data/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewMessage extends StatelessWidget {
  const NewMessage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    TextEditingController _messageController = TextEditingController();
    return BlocConsumer<ChatCubit, ChatStates>(
        listener: (context, state) {
          if (state is SendSuccessMesState) {
            _messageController.text = '';
          }
        },
        builder: (context, state) => Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            labelText: "Write a message with your location",
                            labelStyle: TextStyle(
                                color: ColorsManager.primary,
                                fontWeight: FontWeight.normal,
                                fontSize: 17)),
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        enableSuggestions: true,
                      ),
                    ),
                    IconButton(
                        onPressed: () => ChatCubit.get(context).sendMessage(
                            receiverId: id, text: _messageController.text),
                        icon: Icon(Icons.send,
                            color: Theme.of(context).colorScheme.primary))
                  ],
                ),
              ),
            ));
  }
}

/* await FirebaseFirestore.instance.collection('chat').add({
      'text': enteredMessage,
      'createdAt': Timestamp.now(),
      'userId': user.phoneNumber,
      'username': userdata.data()!['name'],
    });*/
