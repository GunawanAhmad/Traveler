import 'package:flutter/material.dart';
import './profile.dart';

abstract class ProfileModel extends State<Profile> {
  late String nama;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    setState(() {
      nama = 'Kuple';
    });
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
  }
}
