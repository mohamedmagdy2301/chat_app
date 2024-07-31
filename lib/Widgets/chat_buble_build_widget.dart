import 'package:chat_app/Core/constant.dart';
import 'package:flutter/material.dart';

class ChatBubleBuildWidget extends StatelessWidget {
  const ChatBubleBuildWidget({
    super.key,
    required this.message,
    required this.time,
  });
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
        padding: const EdgeInsets.only(top: 12, bottom: 5, left: 15, right: 18),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(26),
            topRight: Radius.circular(18),
            topLeft: Radius.circular(26),
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
              time,
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
