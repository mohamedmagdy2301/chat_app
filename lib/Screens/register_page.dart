// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:chat_app/Core/constant.dart';
import 'package:chat_app/Screens/login_page.dart';
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
    return Scaffold(
      backgroundColor: kPrimaryColor,
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
                  if (formKey.currentState!.validate()) {
                    try {
                      await createUser();
                      showSnackBar(context, "Account created successfully ✅");
                      Navigator.pushNamed(context, LoginPage.id);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        showSnackBar(
                            context, "The password provided is too weak ❌");
                      } else if (e.code == 'email-already-in-use') {
                        showSnackBar(context,
                            "The account already exists for that email ❌");
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
    );
  }

  Future<void> createUser() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
    log(user.user!.email.toString());
  }

  void showSnackBar(BuildContext context, message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
