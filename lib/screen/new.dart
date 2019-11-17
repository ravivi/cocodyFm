import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class New extends StatelessWidget {
  List<String> liste=[
    "un.jpg",
    "deux.jpg",
    "trois.jpg",
    "quatre.jpg",
    "cinq.jpg"
  ];
  List<String> info=[
    "Ceremonie d'ouverture cgeci academy 2019",
    "Diverses formes de consommations du café presentées",
    "La 5ieme edition du sara du 22 novembre au 1er decembre a abidjan",
    "Festival international de films des lacs et lagunes la 8e édition",
    "Cote d'ivoire Guillaume Soro candidat à la présidentielle de 2020"
  ];
  List<String> listLien =[
    'http://www.radiococodyfm.ci/ceremonie-douverture-cgeci-academy-2019/article/',
    'http://www.radiococodyfm.ci/diverses-formes-de-consommations-du-cafe-presentees/article/',
    'http://www.radiococodyfm.ci/la-5ieme-edition-du-sara-du-22-novembre-au-1er-decembre-a-abidjan/article/',
    'http://www.radiococodyfm.ci/festival-international-de-films-des-lacs-et-lagunes-la-8e-edition/article/',
    'http://www.radiococodyfm.ci/cote-divoire-guillaume-soro-candidat-a-la-presidentielle-de-2020/article/',

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 40, 56, 1),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        itemCount: liste.length,
        itemBuilder: (context, i) {
          return Container(
            margin: EdgeInsets.only(bottom: 30),
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              //color: Color(0xFFfaecfb),
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.grey.withOpacity(.3),
                width: 4,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 191,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)
                    ),
                    image: DecorationImage(
                      image: ExactAssetImage(
                        "images/${liste[i]}",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "15 Octobre 2019 22h:01",
                      style: TextStyle(color: Colors.grey),
                    )),
                SizedBox(
                  height: 35,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    info[i],
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "En savoir plus",
                        style: TextStyle(fontSize: 17),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: 60,
                          width: 50,
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'article', arguments: {'lien':listLien[i]});
                              //launchUrl(listLien[i]);
                            },
                            color: Colors.white,
                            child: Center(
                              child: Icon(Icons.play_arrow),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  void launchUrl(String lien){
  launch(lien);
}
}
