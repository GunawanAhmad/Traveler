import 'package:flutter/material.dart';
import 'package:traveler_mobile/Style/style.dart';
import 'package:traveler_mobile/screens/login.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [MyStatefulWidget()],
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: Text(
                  "Register",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your name',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your phone number',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const RadioGroup(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                    child: ElevatedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState!.validate()) {
                      // Process data.

                    }
                  },
                  child: const Text('Register'),
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              )
            ],
          ),
        ));
  }
}

enum RegisterType { user, guide }

class RadioGroup extends StatefulWidget {
  const RadioGroup({Key? key}) : super(key: key);

  @override
  State<RadioGroup> createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  RegisterType? type = RegisterType.user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            title: const Text("Tour guide"),
            value: RegisterType.guide,
            groupValue: type,
            activeColor: Colors.black,
            onChanged: (RegisterType? value) {
              setState(() {
                type = value;
              });
            },
          ),
        ),
        Expanded(
          child: RadioListTile(
            title: const Text("User"),
            value: RegisterType.user,
            groupValue: type,
            activeColor: Colors.black,
            onChanged: (RegisterType? value) {
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
