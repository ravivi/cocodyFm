import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class Day {
  final int id;
  final String jour;

  Day({this.id, this.jour});

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(id: json['id'], jour: json['jour']);
  }
}

class DayList {
  final List<Day> listJour;

  DayList({this.listJour});
  factory DayList.fromJson(List<dynamic> json) {
    List<Day> arr = new List<Day>();
    arr = json.map((item) => Day.fromJson(item)).toList();
    return DayList(listJour: arr);
  }
}

class Presentator {
  final int id;
  final String nom;
  final String prenom;

  Presentator({this.id, this.nom, this.prenom});

  factory Presentator.fromJson(Map<String, dynamic> json) {
    return Presentator(
        id: json['id'], nom: json['nom'], prenom: json['prenom']);
  }
}

class PresentatorList {
  final List<Presentator> listpresentateur;

  PresentatorList({this.listpresentateur});
  factory PresentatorList.fromJson(List<dynamic> json) {
    List<Presentator> arr = new List<Presentator>();
    arr = json.map((item) => Presentator.fromJson(item)).toList();
    return PresentatorList(listpresentateur: arr);
  }
}

class Emission {
  final int id;
  final String titre;
  final String miniDescription;
  final String description;
  final PresentatorList presentateurs;

  Emission(
      {this.id,
      this.titre,
      this.miniDescription,
      this.description,
      this.presentateurs
      }
      );

  factory Emission.fromJson(Map<String, dynamic> json) {
    return Emission(
        id: json['id'],
        titre: json['titre'],
        miniDescription: json['mini_description'],
        description: json['description'],
        presentateurs: PresentatorList.fromJson(json['presentateurs'])
        );
  }
}

class CategoryEmission{
  final int id;
  final String heur_debut;
  final String heur_fin;
  final Emission emission;
  final DayList jour;
CategoryEmission({this.id, this.heur_debut, this.heur_fin, this.emission, this.jour});

  factory CategoryEmission.fromJson(Map<String, dynamic> json) {
    return CategoryEmission(
        id: json['id'],
        heur_debut: json['heur_debut'],
        heur_fin: json['heur_fin'],
        emission: Emission.fromJson(json['emission']),
        jour: DayList.fromJson(json['jour'])
        );
  }
}

class ListEmission {
  final List<CategoryEmission> listEmisson;

  ListEmission({this.listEmisson});
    factory ListEmission.fromJson(List<dynamic> json){
      List<CategoryEmission> arr = new List<CategoryEmission>();
      arr = json.map((item)=> CategoryEmission.fromJson(item)).toList();
    return ListEmission(
      listEmisson: arr
    );
  }
  
}

//   Future loadJson() async{
//       String url = ;
//     return await http.get(url); 
// }
  Future getListEmission() async{
    final res = await http.get("http://radiococodyfm.ci/playlist/api/planning/");
    Iterable list = json.decode(res.body);
    List<CategoryEmission> arr = list.map((item)=> CategoryEmission.fromJson(item)).toList();
    return arr;
  }
