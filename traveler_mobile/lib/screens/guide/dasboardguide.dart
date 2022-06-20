// ignore: file_names
import 'package:flutter/material.dart';
import 'package:traveler_mobile/screens/guide/exploreguide.dart';
import 'package:traveler_mobile/screens/guide/homeguide.dart';
import 'package:traveler_mobile/screens/guide/profileguide.dart';

class DashboardGuide extends StatefulWidget {
  const DashboardGuide({Key? key}) : super(key: key);

  @override
  State<DashboardGuide> createState() => _DashboardGuideState();
}

class _DashboardGuideState extends State<DashboardGuide> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    HomeGuide(),
    ExploreGuide(),
    const ProfileGuide(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Work',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.black,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
