// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:chat_app/Core/hide_keyboard.dart';
import 'package:chat_app/Core/show_sankbar.dart';
import 'package:chat_app/Widgets/button_build.dart';
import 'package:chat_app/Widgets/text_field_build.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  static const id = 'register_page';
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
                    hideKeyboard(context);
                    if (formKey.currentState!.validate()) {
                      try {
                        await createUser();
                        showSnackBar(context, "Account created successfully ✅");
                        Navigator.pop(context);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(
                              context, "The password provided is too weak ❌");
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context,
                              "The account already exists for that email ❌");
                        } else {
                          showSnackBar(context,
                              "${e.toString().substring(e.toString().indexOf("]") + 1, e.toString().length)} ❌");
                        }
                      } catch (e) {
                        showSnackBar(context, "There is a error ,try again ❌");
                      }
                    } else {
                      showSnackBar(context, "Please fill all the fields ❌");
                    }
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
        ),
      ),
    );
  }

  Future<void> createUser() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
