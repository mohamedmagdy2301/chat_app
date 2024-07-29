import 'dart:developer';

import 'package:chat_app/Core/constant.dart';
import 'package:chat_app/Screens/home_page.dart';
import 'package:chat_app/Widgets/button_build.dart';
import 'package:chat_app/Widgets/text_field_build.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  static const id = 'register_page';
  String? email;
  String? password;
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
            TextFieldBuild(
              labelText: 'Email',
              hintText: 'Enter your Email',
              onChanged: (data) {
                email = data;
              },
            ),
            const SizedBox(height: 20),
            TextFieldBuild(
              labelText: 'Password',
              hintText: 'Enter your Password',
              onChanged: (data) {
                password = data;
              },
            ),
            const SizedBox(height: 20),
            ButtonBuild(
              title: 'Register',
              onTap: () async {
                var auth = FirebaseAuth.instance;
                UserCredential user = await auth.createUserWithEmailAndPassword(
                  email: email!,
                  password: password!,
                );

                log(user.user!.email.toString());

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
