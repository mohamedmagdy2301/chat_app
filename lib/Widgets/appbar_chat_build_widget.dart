import 'package:chat_app/Core/constant.dart';
import 'package:flutter/material.dart';

class AppBarChatBuildWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarChatBuildWidget({
    super.key,
    required this.userEmail,
  });
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        userEmail.substring(0, userEmail.indexOf('@')),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w800,
        ),
      ),
      centerTitle: true,
      backgroundColor: kPrimaryColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
