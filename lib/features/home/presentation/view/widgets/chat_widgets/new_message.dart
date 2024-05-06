import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _messageController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
  }

  _messageSend() async {
    final enteredMessage = _messageController.text;
    if (enteredMessage.trim().isEmpty) {
      return;
    }

    FocusScope.of(context).unfocus();
    _messageController.clear();
    //////////////////////////////////
    final User user = FirebaseAuth.instance.currentUser!;
    final contact1 = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('contacts')
        .doc('1')
        .get()
        .then((value) {
      if (value.exists) {
        print(value.data()!['name']);
      } else {
        print('no data exist');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                onPressed: _messageSend,
                icon: Icon(Icons.send,
                    color: Theme.of(context).colorScheme.primary))
          ],
        ),
      ),
    );
  }
}

/* await FirebaseFirestore.instance.collection('chat').add({
      'text': enteredMessage,
      'createdAt': Timestamp.now(),
      'userId': user.phoneNumber,
      'username': userdata.data()!['name'],
    });*/

/*
 final User user = FirebaseAuth.instance.currentUser!;
    print(user.email);
    print(user.uid);

    final userdata = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    final contactCollection = await FirebaseFirestore.instance.collection('users').doc(user.uid);

     final contactData= contactCollection.collection('contacts').doc('1').get();
    final chat = await FirebaseFirestore.instance.collection('chats').doc(user.uid);

    chat.set({
      'senderMassage': enteredMessage,
      'createdAt': Timestamp.now(),
      'senderName': userdata.data()!['name'],
      'senderPhone': userdata.data()!['phone'],
      'ReceiverMassage': '' ,
      'ReceiverName': contactData,
      'ReceivePhone': ,
    });
*/
