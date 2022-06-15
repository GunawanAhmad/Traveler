// import 'package:flutter/material.dart';
// import 'package:traveler_mobile/screens/user/constants.dart';
// import 'package:traveler_mobile/screens/user/data.dart';
// import 'package:traveler_mobile/screens/user/detail.dart';

import 'package:flutter/material.dart';
import 'package:traveler_mobile/type.dart';

class HomeUser extends StatelessWidget {
  HomeUser({Key? key}) : super(key: key);

  final List<Wisata> daftarWisata = [
    Wisata("Bandung", "Bandung, Indonesia",
        "https://source.unsplash.com/7od8rzWvUVU"),
    Wisata("Bandung", "Bandung, Indonesia",
        "https://images.unsplash.com/photo-1617234084793-11a2b9345949?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
    Wisata("Bandung", "Bandung, Indonesia",
        "https://images.unsplash.com/photo-1549473889-14f410d83298?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
    Wisata("Bandung", "Bandung, Indonesia",
        "https://images.unsplash.com/photo-1634300361357-4a41334a778d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
  ];

  final List<Guide> daftarGuide = [
    Guide("John Doe", "Bandung, Indonesia",
        "https://images.unsplash.com/photo-1611403119860-57c4937ef987?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
    Guide("John Doe", "Bandung, Indonesia",
        "https://images.unsplash.com/photo-1548142813-c348350df52b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YXNpYW4lMjBwZW9wbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
    Guide("John Doe", "Bandung, Indonesia",
        "https://images.unsplash.com/photo-1540569014015-19a7be504e3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YXNpYW4lMjBwZW9wbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
    Guide("John Doe", "Bandung, Indonesia",
        "https://images.unsplash.com/photo-1515077678510-ce3bdf418862?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGFzaWFuJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
    Guide("John Doe", "Bandung, Indonesia",
        "https://images.unsplash.com/photo-1525748822304-6807cb1348ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8YXNpYW4lMjBwZW9wbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
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
                                  height: 150,
                                  child: FadeInImage(
                                    fit: BoxFit.cover,
                                    image:
                                        NetworkImage(daftarWisata[index].foto),
                                    placeholder: const AssetImage(
                                        'images/placeholder.png'),
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
                                height: 150,
                                child: FadeInImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(daftarGuide[index].foto),
                                  placeholder: const AssetImage(
                                      'images/placeholder.png'),
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
