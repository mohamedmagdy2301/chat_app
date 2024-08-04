import 'package:chat_app/Core/constant.dart';
import 'package:chat_app/Core/hide_keyboard.dart';
import 'package:chat_app/Core/send_message_to_firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TextFieldChatPageBuildWidget extends StatelessWidget {
  TextFieldChatPageBuildWidget({
    super.key,
    required this.messages,
    required this.userEmail,
  });

  TextEditingController controllerTextField = TextEditingController();

  final CollectionReference<Object?> messages;
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: TextField(
        controller: controllerTextField,
        onSubmitted: (value) {
          value.isNotEmpty
              ? sendMessageToFireBase(messages, controllerTextField, userEmail)
              : null;
          controllerTextField.clear();
          hideKeyboard(context);
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(224, 234, 234, 234),
          hintText: 'Type a message...',
          hintStyle: const TextStyle(color: Color.fromARGB(255, 136, 136, 136)),
          contentPadding: const EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey, width: .8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey, width: .8),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              controllerTextField.text.isNotEmpty
                  ? sendMessageToFireBase(
                      messages, controllerTextField, userEmail)
                  : null;
              controllerTextField.clear();
              hideKeyboard(context);
            },
            icon: Icon(
              Icons.send,
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
