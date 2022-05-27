import 'package:flutter/material.dart';
import 'package:traveler_mobile/screens/welcome.dart';

void main() {
  runApp(const Traveler());
}

class Traveler extends StatelessWidget {
  const Traveler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Welcome(),
    );
  }
}
