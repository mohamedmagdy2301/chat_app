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
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        decoration: BoxDecoration(
          color:
              isSender ? kPrimaryColor : const Color.fromARGB(255, 4, 39, 67),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(isSender ? 0 : 17),
            bottomRight: Radius.circular(isSender ? 17 : 0),
            topRight: const Radius.circular(15),
            topLeft: const Radius.circular(15),
          ),
        ),
        child: Column(
          crossAxisAlignment:
              isSender ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Text(
              message,
              textAlign: TextAlign.left,
              style: const TextStyle(
                height: 1.4,
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 8),
              child: Text(
                int.parse(time.substring(11, 13)) <= 12
                    ? "${time.substring(11, 16)} am"
                    : "${time.substring(11, 16)} pm",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
