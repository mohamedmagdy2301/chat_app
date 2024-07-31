// ignore_for_file: must_be_immutable

import 'package:chat_app/Core/constant.dart';
import 'package:chat_app/Core/hide_keyboard.dart';
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
    CollectionReference messages =
        FirebaseFirestore.instance.collection('messages');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarChatBuildWidget(),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: messages.orderBy('time', descending: true).snapshots(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    reverse: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> data = snapshot.data!.docs[index]
                          .data()! as Map<String, dynamic>;

                      return ChatBubleBuildWidget(
                        message: data['message'],
                        time: int.parse(data['time']
                                    .toString()
                                    .substring(11, 13)) <=
                                12
                            ? "${data['time'].toString().substring(11, 16)} AM"
                            : "${data['time'].toString().substring(11, 16)} PM",
                      );
                    },
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: TextField(
              controller: controller,
              onSubmitted: (value) {
                messages.add({
                  'message': controller.text,
                  'time': DateTime.now().toString(),
                  'sender': 'user1',
                });
                controller.clear();
                hideKeyboard(context);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                prefixIcon: const Icon(Icons.emoji_emotions),
                hintText: 'Type a message',
                hintStyle: const TextStyle(color: Colors.grey),
                suffixIcon: IconButton(
                  onPressed: () {
                    messages.add({
                      'message': controller.text,
                      'time': DateTime.now().toString(),
                      'sender': 'user1',
                    });
                    controller.clear();
                    hideKeyboard(context);
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
