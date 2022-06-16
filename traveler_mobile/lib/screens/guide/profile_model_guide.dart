import 'package:flutter/material.dart';
import '../guide/profileguide.dart';

abstract class ProfileModelGuide extends State<ProfileGuide> {
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
