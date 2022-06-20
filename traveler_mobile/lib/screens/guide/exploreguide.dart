import 'package:flutter/material.dart';
import "../../type.dart";

class ExploreGuide extends StatelessWidget {
  ExploreGuide({Key? key}) : super(key: key);

  final List<Wisata> daftarWisata = [
    Wisata("Bandung", "Bandung, Indonesia",
        "https://images.unsplash.com/photo-1549473889-14f410d83298?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
    Wisata("Bandung", "Bandung, Indonesia",
        "https://images.unsplash.com/photo-1617234084793-11a2b9345949?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
    Wisata("Bandung", "Bandung, Indonesia",
        "https://images.unsplash.com/photo-1549473889-14f410d83298?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
    Wisata("Bandung", "Bandung, Indonesia",
        "https://images.unsplash.com/photo-1634300361357-4a41334a778d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
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
              "Tempat Wisata Anda Bekerja",
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
                    onPressed: () {},
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
                            color: Colors.orangeAccent,
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
