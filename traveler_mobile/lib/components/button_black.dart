import 'package:flutter/material.dart';

class ButtonBlack extends StatelessWidget {
  final String title;
  final callback;
  const ButtonBlack(this.title, this.callback, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      child: Text(title),
      style: ElevatedButton.styleFrom(
          primary: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15)),
    );
  }
}
