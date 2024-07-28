import 'package:chat_app/Core/constant.dart';
import 'package:chat_app/Screens/home_page.dart';
import 'package:chat_app/Widgets/button_build.dart';
import 'package:chat_app/Widgets/text_field_build.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  static const id = 'register_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            const SizedBox(height: 100),
            const Text(
              'Register',
              style: TextStyle(
                color: Colors.white,
                fontSize: 33,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 50),
            const TextFieldBuild(
              labelText: 'Email',
              hintText: 'Enter your Email',
            ),
            const SizedBox(height: 20),
            const TextFieldBuild(
              labelText: 'Password',
              hintText: 'Enter your Password',
            ),
            const SizedBox(height: 20),
            ButtonBuild(
              title: 'Register',
              onTap: () {
                Navigator.pushNamed(context, HomePage.id);
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
