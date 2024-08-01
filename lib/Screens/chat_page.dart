// ignore_for_file: must_be_immutable

import 'package:chat_app/Core/show_message_in_listview_from_firebase.dart';
import 'package:chat_app/Widgets/appbar_chat_build_widget.dart';
import 'package:chat_app/Widgets/text_field_chat_page_build_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static const id = 'home_page';

  @override
  Widget build(BuildContext context) {
    CollectionReference messages =
        FirebaseFirestore.instance.collection('messages');
    String userEmail = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarChatBuildWidget(),
      body: Column(
        children: [
          Expanded(
              child: showMessageInListViewFromFireBase(messages, userEmail)),
          TextFieldChatPageBuildWidget(messages: messages, userEmail: userEmail)
        ],
      ),
    );
  }
}
