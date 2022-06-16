import 'package:flutter/material.dart';
import 'package:traveler_mobile/screens/guide/dasboardguide.dart';
import 'package:traveler_mobile/screens/guide/exploreguide.dart';
import 'package:traveler_mobile/screens/guide/homeguide.dart';
import 'package:traveler_mobile/screens/user/daftar_guide.dart';
import 'package:traveler_mobile/screens/user/dashboard_user.dart';
import 'package:traveler_mobile/screens/register.dart';
import 'package:traveler_mobile/screens/user/detail_guide.dart';
import 'package:traveler_mobile/screens/user/wisata_favorite.dart';
import 'package:traveler_mobile/screens/welcome.dart';
import 'package:traveler_mobile/screens/login.dart';

void main() {
  runApp(const Traveler());
}

class Traveler extends StatelessWidget {
  const Traveler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Welcome(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/dashboardUser': (context) => const Dashboard(),
        '/daftarguide': (context) => DaftarGuideUser(),
        '/user/detailguide': (context) => const DetailGuideUser(),
        '/wisatafavorite': (context) => const WisataFavorite(),
        '/dasboardguide': (context) => const DashboardGuide(),
        '/exploreguide': (context) => ExploreGuide(),
        '/homeguide': (context) => HomeGuide()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
