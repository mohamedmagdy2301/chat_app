import 'package:chat_app/Core/constant.dart';
import 'package:flutter/material.dart';

class AppBarChatBuildWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarChatBuildWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Chat App',
        style: TextStyle(
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
