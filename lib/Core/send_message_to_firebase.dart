import 'package:cloud_firestore/cloud_firestore.dart';

Future<DocumentReference<Object?>> sendMessageToFireBase(
    CollectionReference<Object?> messages, controller, user) {
  return messages.add(
    {
      'message': controller.text,
      'time': DateTime.now().toString(),
      'user': user,
    },
  );
}
