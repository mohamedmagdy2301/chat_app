import 'package:chat_app/Core/constant.dart';
import 'package:chat_app/Screens/home_page.dart';
import 'package:chat_app/Screens/register_page.dart';
import 'package:chat_app/Widgets/button_build.dart';
import 'package:chat_app/Widgets/text_field_build.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const id = 'login_page';

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
              'Login Page',
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
              onChanged: (data) {},
            ),
            const SizedBox(height: 20),
            TextFieldBuild(
              labelText: 'Password',
              hintText: 'Enter your Password',
              onChanged: (data) {},
            ),
            const SizedBox(height: 20),
            ButtonBuild(
              title: 'Login',
              onTap: () {
                Navigator.pushNamed(context, HomePage.id);
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Not have an account?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterPage.id);
                  },
                  child: const Text(
                    'Register',
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
