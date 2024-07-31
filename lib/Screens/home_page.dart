// ignore_for_file: must_be_immutable

import 'package:chat_app/Core/constant.dart';
import 'package:chat_app/Widgets/appbar_chat_build_widget.dart';
import 'package:chat_app/Widgets/chat_buble_build_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static const id = 'home_page';
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('messages');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarChatBuildWidget(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const ChatBubleBuildWidget(
                  message: 'hi, this is a chat app.',
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                prefixIcon: const Icon(Icons.emoji_emotions),
                suffixIcon: IconButton(
                  onPressed: () {
                    users.add({
                      'message': controller.text,
                      'time': DateTime.now().toString(),
                      'sender': 'user1',
                    });
                    controller.clear();
                  },
                  icon: Icon(
                    Icons.send,
                    color: kPrimaryColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
