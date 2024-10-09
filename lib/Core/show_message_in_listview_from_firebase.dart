import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

StreamBuilder<QuerySnapshot<Object?>> showMessageInListViewFromFireBase(
    messages, userEmail) {
  ScrollController controllerScroll = ScrollController();

  return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('time', descending: true).snapshots(),
      builder: (context, snapshot) {
        controllerScroll.animateTo(
          0.0,
          duration: const Duration(microseconds: 800000),
          curve: Curves.easeIn,
        );
        return Padding(
          padding: const EdgeInsets.only(top: 5),
          child: ListView.builder(
            controller: controllerScroll,
            reverse: true,
            itemCount: snapshot.data?.docs.length ?? 0,
            itemBuilder: (context, index) {
              Map<String, dynamic> data =
                  snapshot.data!.docs[index].data()! as Map<String, dynamic>;
              return data["user"] != userEmail
                  ? ChatBubbleBuildWidget(
                      message: data['message'],
                      time: data['time'].toString(),
                      isSender: true,
                    )
                  : ChatBubbleBuildWidget(
                      message: data['message'],
                      time: data['time'].toString(),
                      isSender: false,
                    );
            },
          ),
        );
      });
}

class ChatBubbleBuildWidget extends StatelessWidget {
  final String message;
  final String time;
  final bool isSender;

  const ChatBubbleBuildWidget({
    super.key,
    required this.message,
    required this.time,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isSender ? Colors.blue : Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              message,
              style: TextStyle(
                color: isSender ? Colors.white : Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            time,
            style: TextStyle(
              color: isSender ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
