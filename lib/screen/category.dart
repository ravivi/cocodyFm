import 'dart:convert';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../providers/radioCharge.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  String utf8convert(String text) {
    List<int> bit = text.toString().codeUnits;
    return utf8.decode(bit);
  }

  @override
  void initState() {
    super.initState();
    getListEmission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 40, 56, 1),
      body: FutureBuilder(
          future: getListEmission(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<dynamic> categories = snapshot.data;
              return ListView.builder(
                padding: EdgeInsets.only(top: 20),
                itemCount: categories.length,
                itemBuilder: (context, i) {
                  var l = categories[i]
                      .emission
                      .presentateurs
                      .listpresentateur
                      .map((f) {
                    return f.nom;
                  });
                  print(l);
                  return Container(
                    margin: EdgeInsets.only(bottom: 40),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Transform.rotate(
                              angle: 1.0,
                              child: Container(
                                color: Colors.black,
                                height: 30,
                                width: 30,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, right: 5),
                              width: 250,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Lundi Mardi Mercredi Jeudi Vendredi ${categories[i].heur_debut} - ${categories[i].heur_fin} ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 6,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  categories[i].emission.titre,
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text(
                                    categories[i].emission.miniDescription,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                    // textAlign: TextAlign.justify,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Presenté Par :",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxHeight: 30, maxWidth: 300),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: categories[i]
                                        .emission
                                        .presentateurs
                                        .listpresentateur
                                        .length,
                                    itemBuilder: (context, index) {
                                      return Text(
                                        " ${categories[i].emission.presentateurs.listpresentateur[index].nom} ${categories[i].emission.presentateurs.listpresentateur[index].prenom}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.justify,
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.only(right: 20),
                                  child: Text(
                                    utf8convert(
                                        categories[i].emission.description),
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white,
                                        fontSize: 18),
                                    //textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: SpinKitPouringHourglass(
                  color: Color.fromRGBO(210, 3, 6, 1),
                  size: 90.0,
                ),
              );
            }
            // if (snapshot.connectionState == ConnectionState.none) {
            //   return Center(
            //     child: Container(
            //       margin: EdgeInsets.all(20),
            //       child: CircularProgressIndicator(
            //         valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            //       ),
            //     ),
            //   );
            // } else {
            //   return Center(
            //     child: SpinKitPouringHourglass(
            //       color: Color.fromRGBO(210, 3, 6, 1),
            //       size: 90.0,
            //       // duration: Duration(seconds: click ? 1: 50),
            //     ),
            //   );
            // }
          }),
    );
  }
}
