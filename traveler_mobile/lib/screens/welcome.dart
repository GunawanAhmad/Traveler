import 'package:flutter/material.dart';
import 'package:traveler_mobile/screens/login.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/bgImg.png'), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          const Text(
            "Traveler",
            style: TextStyle(
                fontSize: 48, color: Colors.white, fontWeight: FontWeight.w800),
          ),
          const Text(
            "Explore with Our Best Tourguide",
            style: TextStyle(
                fontSize: 12, color: Colors.white, fontWeight: FontWeight.w400),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 50, top: 30),
            child: MaterialButton(
              padding: const EdgeInsets.all(15),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              color: const Color(0xC4C4C4).withOpacity(0.5),
              textColor: Colors.white,
              child: const Icon(
                Icons.chevron_right,
                size: 32,
              ),
              shape: const CircleBorder(),
            ),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.end,
      ),
    ));
  }
}
