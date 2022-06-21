import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;
import 'package:traveler_mobile/component/Loading.dart';
import 'package:traveler_mobile/screens/login.dart';

enum RegisterType { user, guide }

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: MyStatefulWidget(),
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
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  String email = "", password = "", alamat = "", noHp = "", nama = "";
  bool loading = false;
  RegisterType? type = RegisterType.user;

  void switchLoading() {
    setState(() {
      loading = !loading;
    });
  }

  void register(context) async {
    switchLoading();
    String url = '';

    if (type == RegisterType.user) {
      url = 'http://127.0.0.1:8000/api/register/customer';
    } else {
      url = 'http://127.0.0.1:8000/api/register/guide';
    }

    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    var request = http.MultipartRequest('POST', Uri.parse(url));
    if (_imageFile != null) {
      var stream = http.ByteStream(Stream.castFrom(_imageFile!.openRead()));
      var length = _imageFile!.length();
      request.files.add(http.MultipartFile('foto', stream, await length,
          filename: path.basename(_imageFile!.path),
          contentType: MediaType('image', 'png')));
    }
    request.fields.addAll(headers);
    request.fields['name'] = nama;
    request.fields['email'] = email;
    request.fields['password'] = password;
    request.fields['no_hp'] = noHp;
    request.fields['alamat'] = alamat;

    var response = await request.send();
    response.stream.transform(utf8.decoder).listen((value) async {
      switchLoading();
      var data = json.decode(value);
      if (data['meta']['code'] == 200) {
        SharedPreferences.setMockInitialValues({});
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', json.encode(data['data']['token']));
        localStorage.setString('user', json.encode(data['data']['user']));
        if (type == RegisterType.user) {
          Navigator.pushNamed(context, '/dashboardUser');
        } else {
          Navigator.pushNamed(context, '/dasboardguide');
        }
      } else {
        final snackbar = SnackBar(
          content: Text(data['meta']['message']),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    });
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
                      "Register",
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
                        hintText: 'Enter your name',
                        border: OutlineInputBorder()),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      nama = value;
                      return null;
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Enter your phone number',
                        border: OutlineInputBorder()),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      noHp = value;
                      return null;
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Enter your Address',
                        border: OutlineInputBorder()),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      alamat = value;
                      return null;
                    },
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Text(_imageFile == null
                              ? "Not selected"
                              : _imageFile!.path.split('/').last),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              showBottomSheet(
                                  context: context,
                                  builder: (builder) => bottomSheet());
                            },
                            style:
                                ElevatedButton.styleFrom(primary: Colors.black),
                            child: const Text("Pilih gambar")),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: RegisterType.guide,
                              groupValue: type,
                              activeColor: Colors.black,
                              onChanged: (RegisterType? value) {
                                setState(() {
                                  type = value;
                                });
                              },
                            ),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    type = RegisterType.guide;
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
                              value: RegisterType.user,
                              groupValue: type,
                              activeColor: Colors.black,
                              onChanged: (RegisterType? value) {
                                setState(() {
                                  type = value;
                                });
                              },
                            ),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    type = RegisterType.user;
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

                          register(context);
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: const Center(
                          child: Text(
                            "Register",
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
                      const Text("Already have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text(
                            "Login",
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

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.black,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  child: Row(
                    children: [
                      const Icon(Icons.camera),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                      ),
                      const Text("Camera")
                    ],
                  ),
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                ),
                ElevatedButton(
                  child: Row(
                    children: [
                      const Icon(Icons.image),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                      ),
                      const Text("Gallery")
                    ],
                  ),
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                ),
              ]),
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
      Navigator.pop(context);
    });
  }
}
