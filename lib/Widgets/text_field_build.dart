import 'package:flutter/material.dart';

class TextFieldBuild extends StatelessWidget {
  const TextFieldBuild({
    super.key,
    required this.labelText,
    required this.hintText,
  });
  final String labelText;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
        // border: const OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.white),
        //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
        // ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 143, 143, 143)),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }
}
