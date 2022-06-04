import 'package:flutter/material.dart';
import '../../type.dart';

class ExploreUser extends StatelessWidget {
  ExploreUser({Key? key}) : super(key: key);

  final List<Wisata> daftarWisata = [
    Wisata("Bandung", "Bandung, Indonesia",
        "https://source.unsplash.com/7od8rzWvUVU"),
    Wisata("Bandung", "Bandung, Indonesia",
        "https://source.unsplash.com/7od8rzWvUVU"),
    Wisata("Bandung", "Bandung, Indonesia",
        "https://source.unsplash.com/7od8rzWvUVU"),
    Wisata("Bandung", "Bandung, Indonesia",
        "https://source.unsplash.com/7od8rzWvUVU"),
  ];

  void daftarGuideScreen(context) {
    Navigator.pushNamed(context, '/daftarguide');
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
              "Explore wisata",
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
                      daftarGuideScreen(context);
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
