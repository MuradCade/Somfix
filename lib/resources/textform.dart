import 'package:flutter/material.dart';

// components of textfield

class TextFormGlobal extends StatelessWidget {
  const TextFormGlobal(
      {super.key,
      required this.controller,
      required this.hintext,
      this.Obsecure,
      this.Textinputtype});

  final TextEditingController controller;
  final String hintext;
  final Obsecure;
  final Textinputtype;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: EdgeInsets.only(top: 3, left: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 7,
            )
          ]),
      child: TextField(
        controller: controller,
        keyboardType: Textinputtype,
        obscureText: Obsecure,
        decoration: InputDecoration(
          hintText: hintext,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(0),
          hintStyle: TextStyle(height: 1),
        ),
      ),
    );
  }
}
