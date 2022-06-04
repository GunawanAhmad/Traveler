import 'package:flutter/material.dart';
import 'package:traveler_mobile/type.dart';

class HomeUser extends StatelessWidget {
  HomeUser({Key? key}) : super(key: key);

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

  final List<Guide> daftarGuide = [
    Guide("John Doe", "Bandung, Indonesia",
        "https://source.unsplash.com/IF9TK5Uy-KI"),
    Guide("John Doe", "Bandung, Indonesia",
        "https://source.unsplash.com/IF9TK5Uy-KI"),
    Guide("John Doe", "Bandung, Indonesia",
        "https://source.unsplash.com/IF9TK5Uy-KI"),
    Guide("John Doe", "Bandung, Indonesia",
        "https://source.unsplash.com/IF9TK5Uy-KI"),
    Guide("John Doe", "Bandung, Indonesia",
        "https://source.unsplash.com/IF9TK5Uy-KI"),
    Guide("John Doe", "Bandung, Indonesia",
        "https://source.unsplash.com/IF9TK5Uy-KI"),
  ];

  void daftarGuideScreen(context) {
    Navigator.pushNamed(context, '/daftarguide');
  }

  void detailGuideScreen(context, argument) {
    Navigator.pushNamed(context, '/user/detailguide', arguments: argument);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 20, top: 10),
                child: const Text(
                  "Selamat Datang Kuple !",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
              const Text(
                "Wisata Populer",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: daftarWisata.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TextButton(
                        onPressed: () {
                          daftarGuideScreen(context);
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.65,
                            margin: const EdgeInsets.only(right: 10),
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
                                borderRadius: BorderRadius.circular(10))));
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 30),
              ),
              const Text(
                "Guide di sekitar anda",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: daftarGuide.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TextButton(
                      onPressed: () {
                        detailGuideScreen(context, daftarGuide[index]);
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          margin: const EdgeInsets.only(right: 10),
                          clipBehavior: Clip.hardEdge,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.black12,
                                width: double.infinity,
                                child: Image.network(
                                  daftarGuide[index].foto,
                                  fit: BoxFit.fitWidth,
                                  width: double.infinity,
                                  height: 150,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(daftarGuide[index].nama,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                child: Text(daftarGuide[index].alamat,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
