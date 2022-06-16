import 'package:flutter/material.dart';
import './profile_model.dart';
import '../colors.dart' as warna;

class ProfileView extends ProfileModel {
  get navigateSecondPage => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [warna.grey, warna.darkgrey])),
        ),
        CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              backgroundColor: Colors.transparent,
              title: Text('PROFILE'),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 40.0),
                Center(
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white.withOpacity(.2),
                              blurRadius: 20.0)
                        ],
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.white, Colors.grey.shade200])),
                    child: Text('K',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 100.0, color: warna.black)),
                  ),
                ),
                const SizedBox(height: 40.0),
                Center(
                  child: Column(
                    children: [
                      Text('Haloo Kuple',
                          style:
                              TextStyle(color: Colors.black, fontSize: 25.0)),
                      Text('(Customer)',
                          style: TextStyle(color: Colors.black, fontSize: 15.0))
                    ],
                  ),
                )
              ]),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(
                  height: 200.0,
                  child: GridView.count(
                    padding: const EdgeInsets.all(40.0),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    crossAxisSpacing: 20.0,
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            AlertDialog alert = AlertDialog(
                              title: Text('Hi'),
                            );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: warna.grey.withOpacity(.2),
                                        blurRadius: 10.0)
                                  ],
                                  color: warna.darkgrey),
                              child: const Icon(Icons.favorite,
                                  size: 40.0, color: Colors.white))),
                      InkWell(
                          onTap: () {
                            AlertDialog alert = AlertDialog(
                              title: Text('(+62) 8221319280'),
                            );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: warna.grey.withOpacity(.2),
                                        blurRadius: 10.0)
                                  ],
                                  color: warna.darkgrey),
                              child: const Icon(Icons.call,
                                  size: 40.0, color: Colors.white))),
                      InkWell(
                          onTap: () {
                            AlertDialog alert = AlertDialog(
                              title: Text('@kuple123@gmail.com'),
                            );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: warna.grey.withOpacity(.2),
                                        blurRadius: 10.0)
                                  ],
                                  color: warna.darkgrey),
                              child: const Icon(Icons.email,
                                  size: 40.0, color: Colors.white))),
                    ],
                  ),
                )
              ]),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      margin: const EdgeInsets.only(top: 20.0),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0)),
                          color: Colors.white),
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60.0, vertical: 20.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              gradient: LinearGradient(
                                  colors: [warna.black, warna.lightblack])),
                          child: const Text('Scroll Up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 60.0),
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                                const Text('80',
                                    style: TextStyle(fontSize: 20.0)),
                                const Text('Favorite',
                                    style: TextStyle(fontSize: 15.0))
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ]),
            ),
          ],
        )
      ],
    ));
  }
}
