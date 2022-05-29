import 'package:flutter/material.dart';
import 'package:traveler_mobile/screens/dashboard.dart';
import 'package:traveler_mobile/screens/register.dart';
import 'package:traveler_mobile/screens/welcome.dart';
import 'package:traveler_mobile/screens/login.dart';

void main() {
  runApp(const Traveler());
}

class Traveler extends StatelessWidget {
  const Traveler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/': (context) => const Welcome(),
      '/login': (context) => const Login(),
      '/register': (context) => const Register(),
      '/dashboard': (context) => const Dashboard(),
    });
  }
}
