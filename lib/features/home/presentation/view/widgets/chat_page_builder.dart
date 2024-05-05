import 'package:flutter/material.dart';

class ChatPageBuilder extends StatelessWidget {
  const ChatPageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _messageController = TextEditingController();

    return Column(
      children: [
        
        Container(

          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey, width: 1)),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 1,
              bottom: 14,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration:
                        const InputDecoration(labelText: "send a message.."),
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    enableSuggestions: true,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.send,
                        color: Theme.of(context).colorScheme.primary))
              ],
            ),
          ),
        )
      ],
    );
  }
}
