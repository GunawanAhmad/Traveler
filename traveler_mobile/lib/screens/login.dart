import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

enum LoginType { user, guide }

LoginType selectedUser = LoginType.user;

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
  String email = "", password = "";

  //fungsi untuk memanggil API
  Future<http.Response> getData(data, url) async {
    return await http.post(Uri.parse(url), body: jsonEncode(data), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });
  }

  void login(context) async {
    var data = {'email': email, 'password': password};
    var res = await getData(data, 'http://127.0.0.1:8000/api/login/customer');

    var body = json.decode(res.body);
    if (body['meta']['code'] == 200) {
      SharedPreferences.setMockInitialValues({});
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['data']['token']));
      localStorage.setString('user', json.encode(body['data']['user']));
      Navigator.pushNamed(context, '/dashboardUser');
    } else {
      final snackbar = SnackBar(
        content: Text(body['meta']['message']),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

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
                  "Login",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  email = value;
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
                  password = value;
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
                      if (selectedUser == LoginType.user) {
                        login(context);
                      }
                    }
                  },
                  child: const Text('Login'),
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ))
                ],
              )
            ],
          ),
        ));
  }
}

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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Radio(
              value: LoginType.guide,
              groupValue: type,
              activeColor: Colors.black,
              onChanged: (LoginType? value) {
                setState(() {
                  type = value;
                });
              },
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    type = LoginType.guide;
                  });
                },
                child: const Text(
                  "Guide",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
        Row(
          children: [
            Radio(
              value: LoginType.user,
              groupValue: type,
              activeColor: Colors.black,
              onChanged: (LoginType? value) {
                setState(() {
                  type = value;
                });
              },
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    type = LoginType.user;
                  });
                },
                child: const Text(
                  "Customer",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ],
    );
  }
}
