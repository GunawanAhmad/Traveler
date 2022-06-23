import 'package:flutter/material.dart';
import 'package:traveler_mobile/type.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traveler_mobile/component/Loading.dart';

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
  var _name = "";
  var _token = "";
  bool loading = false;

  final List<Wisata> daftarWisata = [];
  late Wisata wisataPopuler;

  //fungsi untuk memanggil API
  Future<http.Response> logoutAPI(url) async {
    return await http.post(Uri.parse(url), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer " + _token
    });
  }

  //fungsi untuk memanggil API
  Future<http.Response> getData(url) async {
    return await http.get(Uri.parse(url), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer " + _token
    });
  }

  void loadData() async {
    switchLoading();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      var _userVal = prefs.getString('user');
      if (_userVal != null) {
        var data = json.decode(_userVal);
        _name = data!['name'] ?? "";
      }
      var _tokenVal = prefs.getString('token');
      if (_tokenVal != null) {
        _token = json.decode(_tokenVal);
      }
    });

    String url = "http://127.0.0.1:8000/api/dashboard/customer";
    var res = await getData(url);
    var body = json.decode(res.body);
    if (res.statusCode == 200) {
      switchLoading();

      List<dynamic> wisataArr = body['data']['wisata'];
      setState(() {
        var temp = body['data']['popular'];
        wisataPopuler = Wisata(
            temp['nama_daerah'] ?? "",
            temp['provinsi'] ?? "",
            "http://127.0.0.1:8000/" + temp['foto'],
            temp['deskripsi'] ?? "");
      });
      for (var i = 0; i < wisataArr.length; i++) {
        var temp = wisataArr[i];
        Wisata wisata = Wisata(temp['nama_daerah'], temp['provinsi'],
            "http://127.0.0.1:8000/" + temp['foto']);
        setState(() {
          daftarWisata.add(wisata);
        });
      }
    } else {
      switchLoading();
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void switchLoading() {
    setState(() {
      loading = !loading;
    });
  }

  void logout(context) async {
    switchLoading();
    var url = "http://127.0.0.1:8000/api/logout/customer";
    var res = await logoutAPI(url);
    var body = json.decode(res.body);

    switchLoading();
    SharedPreferences.setMockInitialValues({});
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('token', json.encode(body['data']['token']));
    localStorage.setString('user', json.encode(body['data']['user']));
    Navigator.pushNamed(context, '/login');
  }

  void daftarGuideScreen(context, argument) {
    Navigator.pushNamed(context, '/daftarguide', arguments: argument);
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(bottom: 20, top: 10, right: 10),
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
                          onPressed: () {
                            logout(context);
                          },
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
                    constraints:
                        const BoxConstraints(maxHeight: 270, minHeight: 100),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: daftarWisata.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {
                              daftarGuideScreen(context, daftarWisata[index]);
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
                                        image: NetworkImage(
                                            daftarWisata[index].foto),
                                        placeholder: const AssetImage(
                                            'images/placeholder.png'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                          daftarWisata[index].namaWisata,
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
                  GestureDetector(
                    onTap: () {
                      daftarGuideScreen(context, wisataPopuler);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            width: 70,
                            height: 90,
                            child: FadeInImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(wisataPopuler.foto),
                              placeholder:
                                  const AssetImage('images/placeholder.png'),
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
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
