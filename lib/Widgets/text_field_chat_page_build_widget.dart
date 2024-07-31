import 'package:chat_app/Core/constant.dart';
import 'package:chat_app/Core/hide_keyboard.dart';
import 'package:chat_app/Core/send_message_to_firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TextFieldChatPageBuildWidget extends StatelessWidget {
  TextFieldChatPageBuildWidget({
    super.key,
    required this.messages,
  });

  TextEditingController controllerTextField = TextEditingController();

  final CollectionReference<Object?> messages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: TextField(
        controller: controllerTextField,
        onSubmitted: (value) {
          value.isEmpty
              ? null
              : sendMessageToFireBase(
                  messages,
                  controllerTextField,
                );
          controllerTextField.clear();
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
              controllerTextField.text.isEmpty
                  ? null
                  : sendMessageToFireBase(
                      messages,
                      controllerTextField,
                    );
              controllerTextField.clear();
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
    );
  }
}
