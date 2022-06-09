import 'package:flutter/material.dart';
import 'package:traveler_mobile/screens/user/detail_guide.dart';
import 'package:traveler_mobile/screens/user/wisata_favorite.dart';
import "../../type.dart";

class FavoriteUser extends StatelessWidget {
  FavoriteUser({Key? key}) : super(key: key);

  final List<Wisata> daftarWisata = [
    Wisata("Bandung", "Bandung, Indonesia",
        "https://images.unsplash.com/photo-1634300361357-4a41334a778d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
    Wisata("Bandung", "Bandung, Indonesia",
        "https://source.unsplash.com/7od8rzWvUVU"),
    Wisata("Bandung", "Bandung, Indonesia",
        "https://images.unsplash.com/photo-1627999490849-0ab41c1b215a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGJhbmR1bmclMjBjaXR5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
    Wisata("Bandung", "Bandung, Indonesia",
        "https://source.unsplash.com/7od8rzWvUVU"),
  ];
  final List<Guide> Wisatafavorite = [
    Guide("Bandung", "Bandung, Indonesia",
        "https://images.unsplash.com/photo-1634300361357-4a41334a778d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
    Guide("Bandung", "Bandung, Indonesia",
        "https://source.unsplash.com/7od8rzWvUVU"),
    Guide("Bandung", "Bandung, Indonesia",
        "https://images.unsplash.com/photo-1627999490849-0ab41c1b215a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGJhbmR1bmclMjBjaXR5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
    Guide("Bandung", "Bandung, Indonesia",
        "https://source.unsplash.com/7od8rzWvUVU"),
  ];
  void WisataFavorite(context, argument) {
    Navigator.pushNamed(context, '/wisatafavorite', arguments: argument);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Favorite",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: daftarWisata.length,
                itemBuilder: (BuildContext context, int index) {
                  return TextButton(
                    onPressed: () {
                      WisataFavorite(context, Wisatafavorite[index]);
                    },
                    child: Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        width: MediaQuery.of(context).size.width * 1,
                        margin: const EdgeInsets.only(bottom: 20),
                        clipBehavior: Clip.hardEdge,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.black12,
                              width: double.infinity,
                              child: Image.network(
                                daftarWisata[index].foto,
                                fit: BoxFit.fitWidth,
                                width: double.infinity,
                                height: 150,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(daftarWisata[index].namaWisata,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              child: Text(daftarWisata[index].alamat,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(10))),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
