import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traveler_mobile/component/Loading.dart';

enum LoginType { user, guide }

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
  bool loading = false;
  LoginType? type = LoginType.user;

  //fungsi untuk memanggil API
  Future<http.Response> getData(data, url) async {
    return await http.post(Uri.parse(url), body: jsonEncode(data), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });
  }

  void switchLoading() {
    setState(() {
      loading = !loading;
    });
  }

  void login(context) async {
    switchLoading();
    var data = {'email': email, 'password': password};
    var url = "";
    if (type == LoginType.user) {
      url = 'http://127.0.0.1:8000/api/login/customer';
    } else {
      url = 'http://127.0.0.1:8000/api/login/guide';
    }
    var res = await getData(data, url);

    var body = json.decode(res.body);
    if (body['meta']['code'] == 200) {
      switchLoading();
      SharedPreferences.setMockInitialValues({});
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['data']['token']));
      localStorage.setString('user', json.encode(body['data']['user']));
      if (type == LoginType.user) {
        Navigator.pushNamed(context, '/dashboardUser');
      } else {
        Navigator.pushNamed(context, '/dasboardguide');
      }
    } else {
      switchLoading();
      final snackbar = SnackBar(
        content: Text(body['meta']['message']),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Container(
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
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Enter your email',
                        border: OutlineInputBorder()),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      email = value;
                      return null;
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: 'Enter your password',
                        border: OutlineInputBorder()),
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
                    child: Row(
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
                    ),
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
                          login(context);
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
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
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ))
                    ],
                  )
                ],
              ),
            ));
  }
}
