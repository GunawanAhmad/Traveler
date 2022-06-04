import 'package:flutter/material.dart';
import '../../type.dart';

class DaftarGuideUser extends StatelessWidget {
  DaftarGuideUser({Key? key}) : super(key: key);

  final List<Guide> daftarGuide = [
    Guide("Bandung", "Bandung, Indonesia",
        "https://source.unsplash.com/IF9TK5Uy-KI"),
    Guide("Bandung", "Bandung, Indonesia",
        "https://source.unsplash.com/IF9TK5Uy-KI"),
    Guide("Bandung", "Bandung, Indonesia",
        "https://source.unsplash.com/IF9TK5Uy-KI"),
    Guide("Bandung", "Bandung, Indonesia",
        "https://source.unsplash.com/IF9TK5Uy-KI"),
  ];

  void detailGuideScreen(context, argument) {
    Navigator.pushNamed(context, '/user/detailguide', arguments: argument);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Daftar Guide",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black,
          ),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: daftarGuide.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TextButton(
                        onPressed: () {
                          detailGuideScreen(context, daftarGuide[index]);
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
                ),
              ],
            ),
          )),
    );
  }
}
