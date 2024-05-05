import 'package:flutter/material.dart';

import 'chat_widgets/chat_messages.dart';
import 'chat_widgets/new_message.dart';

class ChatPageBuilder extends StatelessWidget {
  const ChatPageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [

        Expanded(child: ChatMessage()),
        NewMessage(),
      ],
    );
  }
}

