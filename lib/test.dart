import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> nav = GlobalKey<NavigatorState>();

class MyAppp extends StatefulWidget {

  @override
  MyApppState createState() => MyApppState();
}

class MyApppState extends State<MyAppp> {

  StreamSubscription connectivitySubscription;

  ConnectivityResult _previousResult;
  Color color;

  @override
  void initState() {
    super.initState();
    connectivitySubscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult connectivityResult) {
      if (connectivityResult == ConnectivityResult.none) {
        color = Colors.red;
      }
      else {
        color = Colors.green;
      }
      
    });
  }

  @override
  void dispose() {
    super.dispose();

    connectivitySubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
        body: Center(
          child: RaisedButton(
            onPressed: (){
              checkConnectivity();
            },
            child: Text("Connectez"),
          ),
        ),
    );
  }
    showAlertDialog(BuildContext context, String title, String content) {
    Widget remindButton = FlatButton(
      child: Text("Me Rappeler après"),
      onPressed: () {},
    );
    Widget cancelButton = FlatButton(
      child: Text("Ok"),
      onPressed: () {
        Navigator.of(context).pop(); // dismiss dialog
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        remindButton,
        cancelButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  checkConnectivity() async{
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      showAlertDialog(context, "Aucune Connexion", "Verifiez Votre connexion svp");
    } else if (result == ConnectivityResult.mobile){
      showAlertDialog(context, "Connexion Mobile", "Vous avez La connexion Mobile");
    }
    else if (result == ConnectivityResult.wifi) {
      showAlertDialog(context, "Connexion Mobile", "Vous avez La connexion Wifi");
    }
  }
}