import 'package:flutter/material.dart';
import 'package:traveler_mobile/components/button_black.dart';
import 'package:traveler_mobile/components/input_black.dart';
import 'package:traveler_mobile/screens/register.dart';

enum userType { user, guide }

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  login() {
    print("login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: [
            const Text(
              "Login",
              style: TextStyle(
                  fontSize: 36,
                  color: Colors.black,
                  fontWeight: FontWeight.w800),
            ),
            Container(
              height: 1.5,
              width: MediaQuery.of(context).size.width * 0.5,
              color: Colors.black,
              margin: const EdgeInsets.only(top: 10, bottom: 20),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20, top: 20),
              child: const InputBlack("Email", false),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: const InputBlack("Password", true),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: const RadioGroup(),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: ButtonBlack("Login", login),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("does not have an account ?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: const Text("Sign up"),
                  style: TextButton.styleFrom(primary: Colors.amber),
                ),
              ],
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      )),
    );
  }
}

enum LoginType { user, guide }

class RadioGroup extends StatefulWidget {
  const RadioGroup({Key? key}) : super(key: key);

  @override
  State<RadioGroup> createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  LoginType? type = LoginType.user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            title: const Text("Tour guide"),
            value: LoginType.guide,
            groupValue: type,
            activeColor: Colors.black,
            onChanged: (LoginType? value) {
              setState(() {
                type = value;
              });
            },
          ),
        ),
        Expanded(
          child: RadioListTile(
            title: const Text("User"),
            value: LoginType.user,
            groupValue: type,
            activeColor: Colors.black,
            onChanged: (LoginType? value) {
              setState(() {
                type = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
