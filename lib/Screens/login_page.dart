// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:chat_app/Screens/chat_page.dart';
import 'package:chat_app/Screens/register_page.dart';
import 'package:chat_app/Widgets/button_build.dart';
import 'package:chat_app/Widgets/text_field_build.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  static const id = 'login_page';
  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/splash1.jpg'),
          fit: BoxFit.cover,
          opacity: 0.5,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(height: 70),
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
                    title: 'Login',
                    onTap: () async {
                      Navigator.pushNamedAndRemoveUntil(
                          context, ChatPage.id, (route) => false);
                    }
                    //   hideKeyboard(context);
                    //   if (formKey.currentState!.validate()) {
                    //     try {
                    //       await signInUser();
                    //       showSnackBar(context, "Login successfully ✅");
                    //       Navigator.pushNamedAndRemoveUntil(
                    //           context, HomePage.id, (route) => false);
                    //     } on FirebaseAuthException catch (e) {
                    //       if (e.code == 'user-not-found') {
                    //         showSnackBar(
                    //             context, "No user found for that email ❌");
                    //       } else if (e.code == 'wrong-password') {
                    //         showSnackBar(context, "Wrong password ❌");
                    //       } else {
                    //         showSnackBar(context,
                    //             "${e.toString().substring(e.toString().indexOf("]") + 1, e.toString().length)} ❌");
                    //       }
                    //     } catch (e) {
                    //       showSnackBar(context, "There is a error ,try again ❌");
                    //     }
                    //   } else {
                    //     showSnackBar(context, "Please fill all the fields ❌");
                    //   }
                    // },
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
        ),
      ),
    );
  }

  Future<void> signInUser() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
