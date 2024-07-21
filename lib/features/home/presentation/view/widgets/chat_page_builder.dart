import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_safety/features/home/data/model/contact_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chat_widgets/message_bubble.dart';
import 'chat_widgets/new_message.dart';

class ChatPageBuilder extends StatefulWidget {
  const ChatPageBuilder({super.key, required this.contactModel});

  final ContactModel contactModel;

  @override
  State<ChatPageBuilder> createState() => _ChatPageBuilderState();
}

class _ChatPageBuilderState extends State<ChatPageBuilder> {
  final String myId = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('chats')
        .doc(widget.contactModel.id!)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots();

    return Column(
      children: [
        Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: _usersStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');

                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }

                  return ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                     return  MessageBubble(
                         message: data['text'],
                         isMe: data['senderId'] == myId);
                    }).toList(),
                  );
                })),
        NewMessage(
          id: widget.contactModel.id!,
        ),
      ],
    );
  }
}
