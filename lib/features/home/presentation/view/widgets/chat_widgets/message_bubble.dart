import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble.first({
    super.key,
    required this.username,
    required this.message,
    required this.isMe,
  }) : isFirstInSequence = true;

  const MessageBubble.next({
    super.key,
    required this.message,
    required this.isMe,
  })  : isFirstInSequence = false,
        username = null;

  final bool isFirstInSequence;
  final String? username;
  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              if (isFirstInSequence) const SizedBox(height: 18),

              Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4),
                  ],
                  color: isMe ? ColorsManager.white : ColorsManager.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: !isMe
                        ? Radius.zero
                        : const Radius.circular(15),
                    bottomRight: isMe
                        ? Radius.zero
                        : const Radius.circular(15),
                    topLeft: const Radius.circular(15),
                    topRight: const Radius.circular(15),
                  ),
                ),
                constraints: const BoxConstraints(maxWidth: 200),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 14,
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 12,
                ),
                child: Text(
                  message,
                  style: TextStyle(
                    height: 1.3,
                    color: isMe ? ColorsManager.primary : ColorsManager.white,
                  ),
                  softWrap: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
