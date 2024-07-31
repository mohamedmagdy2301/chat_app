import 'package:chat_app/Widgets/chat_buble_build_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

StreamBuilder<QuerySnapshot<Object?>> showMessageInListViewFromFireBase(
    messages, controllerScroll) {
  return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('time', descending: true).snapshots(),
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.only(top: 5),
          child: ListView.builder(
            controller: controllerScroll,
            reverse: true,
            itemCount: snapshot.data?.docs.length ?? 0,
            itemBuilder: (context, index) {
              Map<String, dynamic> data =
                  snapshot.data!.docs[index].data()! as Map<String, dynamic>;

              return ChatBubleBuildWidget(
                message: data['message'],
                time: int.parse(data['time'].toString().substring(11, 13)) <= 12
                    ? "${data['time'].toString().substring(11, 16)} am"
                    : "${data['time'].toString().substring(11, 16)} pm",
              );
            },
          ),
        );
      });
}
