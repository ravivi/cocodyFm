import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import './providers/radioCharge.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  List<CategoryEmission> liste = [];
  // @override
  // initState() {
  //   charge();
  //   super.initState();
  // }

  Future charge() async {
    print('Chagement.......................');
    List<CategoryEmission> myList = await getListEmission();
    print(myList);
    setState(() {
      liste = myList;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(liste[1].emission.titre);
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: FutureBuilder(
        future: getListEmission(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List<dynamic> categories = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.separated(
              itemCount: categories.length,
              itemBuilder: (context, i) {
                var l = categories[i]
                    .emission
                    .presentateurs
                    .listpresentateur
                    .map((f) => f.nom);

                return ListTile(
                  leading: Text(l.toString()),
                  title: Text(categories[i].emission.titre),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            );
          } else {
            return Container(
              margin: EdgeInsets.all(20),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            );
          }
        },
      ),
    );
  }
}

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<CategoryEmission> liste = [];
  // @override
  // initState() {
  //   charge();
  //   super.initState();
  // }

  Future charge() async {
    print('Chagement.......................');
    List<CategoryEmission> myList = await getListEmission();
    print(myList);
    setState(() {
      liste = myList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 40, 56, 1),
      body: FutureBuilder(
          future: getListEmission(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            List<dynamic> categories = snapshot.data;
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                padding: EdgeInsets.only(top: 20),
                itemCount: categories.length,
                itemBuilder: (context, i) {
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
                                    "${categories[i].heur_debut} - ${categories[i].heur_fin} ",
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
                              width: MediaQuery.of(context).size.width / 4,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  categories[i].emission.titre,
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  categories[i].emission.miniDescription,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Presentée par Mondésir-Hervé",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  categories[i].emission.description,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                  textAlign: TextAlign.justify,
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
            }
            if (snapshot.connectionState == ConnectionState.none) {
              return Center(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
              );
            } else {
              return Center(
                child: SpinKitPouringHourglass(
                  color: Color.fromRGBO(210, 3, 6, 1),
                  size: 60.0,
                  // duration: Duration(seconds: click ? 1: 50),
                ),
              );
            }
          }),
    );
  }

}
