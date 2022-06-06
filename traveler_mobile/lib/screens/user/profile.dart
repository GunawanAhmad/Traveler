import 'package:flutter/material.dart';
import 'package:traveler_mobile/type.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  final List<Wisata> daftarWisata = [
    Wisata("Kuple", "Bandung, Indonesia",
        "https://images.unsplash.com/photo-1525748822304-6807cb1348ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8YXNpYW4lMjBwZW9wbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
        
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(left: 60, bottom: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 20, top: 10, left: 100),
                child: const Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                margin: const EdgeInsets.only(right: 10),
                clipBehavior: Clip.hardEdge,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      color: Colors.black12,
                      width: double.infinity,
                      child: Image.network(
                        daftarWisata[0].foto,
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                        height: 150,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        daftarWisata[0].namaWisata,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10),
                      child: Text(
                        daftarWisata[0].alamat,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 30),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
