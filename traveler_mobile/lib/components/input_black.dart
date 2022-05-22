import 'package:flutter/material.dart';

class InputBlack extends StatelessWidget {
  final String title;
  final bool isPassword;
  const InputBlack(this.title, this.isPassword, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: title,
          fillColor: Colors.black,
          filled: true,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.amber),
              borderRadius: BorderRadius.all(Radius.circular(8)))),
      obscureText: isPassword,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
    );
  }
}
