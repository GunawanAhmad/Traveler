import 'package:flutter/material.dart';
import 'package:traveler_mobile/type.dart';

class HomeUser extends StatelessWidget {
  const HomeUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomeUser createState() => _HomeUser();
}

class _HomeUser extends State<HomePage> {
  var _name = "Gunawan";

  final List<Wisata> daftarWisata = [
    Wisata(
        "Bandung adsadasdwkjaksdjlaksdjalksdkasdljkasd",
        "Bandung, Indonesia",
        "https://source.unsplash.com/7od8rzWvUVU",
        "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Accusamus aspernatur, illo quas dolores aperiam neque tempora odio. Consequatur, rerum obcaecati?"),
    Wisata(
        "Bandung",
        "Bandung, Indonesia",
        "https://images.unsplash.com/photo-1617234084793-11a2b9345949?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
        "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Accusamus aspernatur, illo quas dolores aperiam neque tempora odio. Consequatur, rerum obcaecati?"),
    Wisata(
        "Bandung",
        "Bandung, Indonesia",
        "https://images.unsplash.com/photo-1549473889-14f410d83298?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
        "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Accusamus aspernatur, illo quas dolores aperiam neque tempora odio. Consequatur, rerum obcaecati?"),
    Wisata(
        "Bandung",
        "Bandung, Indonesia",
        "https://images.unsplash.com/photo-1634300361357-4a41334a778d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
        "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Accusamus aspernatur, illo quas dolores aperiam neque tempora odio. Consequatur, rerum obcaecati?"),
  ];

  final wisataPopuler = Wisata(
      "Bandung",
      "Bandung, Indonesia",
      "https://images.unsplash.com/photo-1549473889-14f410d83298?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Accusamus aspernatur, illo quas dolores aperiam neque tempora odio. Consequatur, rerum obcaecati?");

  void daftarGuideScreen(context) {
    Navigator.pushNamed(context, '/daftarguide');
  }

  void detailGuideScreen(context, argument) {
    Navigator.pushNamed(context, '/user/detailguide', arguments: argument);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 20, top: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text("Welcome!",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey)),
                      Text(
                        _name,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            const Text(
              "Special for you",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
            ),
            Container(
              constraints: const BoxConstraints(maxHeight: 270, minHeight: 100),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: daftarWisata.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        daftarGuideScreen(context);
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.60,
                          margin: const EdgeInsets.only(right: 30),
                          clipBehavior: Clip.hardEdge,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 200,
                                child: FadeInImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(daftarWisata[index].foto),
                                  placeholder: const AssetImage(
                                      'images/placeholder.png'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(daftarWisata[index].namaWisata,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black)),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                child: Text(daftarWisata[index].alamat,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black)),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(15))));
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
            ),
            const Text(
              "Popular place",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.grey.withOpacity(0.3),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: 70,
                    height: 90,
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(wisataPopuler.foto),
                      placeholder: const AssetImage('images/placeholder.png'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        wisataPopuler.namaWisata,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        wisataPopuler.alamat,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16, color: Colors.black87),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text(
                          wisataPopuler.deskripsi,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black54),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
