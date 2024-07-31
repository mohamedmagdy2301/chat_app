import 'package:chat_app/Core/constant.dart';
import 'package:flutter/material.dart';

class ChatBubbleBuildWidget extends StatelessWidget {
  const ChatBubbleBuildWidget({
    super.key,
    required this.message,
    required this.time,
    required this.isSender,
  });
  final String message, time;

  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
        padding: const EdgeInsets.only(top: 12, bottom: 5, left: 15, right: 18),
        decoration: BoxDecoration(
          color: isSender
              ? kPrimaryColor
              : const Color.fromARGB(255, 70, 104, 132),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(isSender ? 0 : 26),
            bottomRight: Radius.circular(isSender ? 26 : 0),
            topRight: const Radius.circular(18),
            topLeft: const Radius.circular(26),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: const TextStyle(
                height: 1.4,
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              int.parse(time.substring(11, 13)) <= 12
                  ? "${time.substring(11, 16)} am"
                  : "${time.substring(11, 16)} pm",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
