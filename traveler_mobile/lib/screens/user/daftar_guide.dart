import 'package:flutter/material.dart';
import '../../type.dart';

class DaftarGuideUser extends StatelessWidget {
  DaftarGuideUser({Key? key}) : super(key: key);

  final List<Guide> daftarGuide = [
    Guide("John Doe", "Bandung, Indonesia",
        "https://images.unsplash.com/photo-1525748822304-6807cb1348ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8YXNpYW4lMjBwZW9wbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
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
