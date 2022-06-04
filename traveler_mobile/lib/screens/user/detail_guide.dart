import 'package:flutter/material.dart';
import 'package:traveler_mobile/type.dart';

class DetailGuideUser extends StatelessWidget {
  const DetailGuideUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Guide args = ModalRoute.of(context)!.settings.arguments as Guide;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Daftar Guide",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    width: double.infinity,
                    child: Image.network(
                      args.foto,
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                      height: 300,
                    ),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(10))),
                const Text("Nama"),
                Text(
                  args.nama,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                ),
                const Text("Alamat"),
                Text(args.alamat,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600)),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                      child: ElevatedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                    },
                    child: const Text('Pesan Guide'),
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                  )),
                )
              ],
            ),
          )),
    );
  }
}
