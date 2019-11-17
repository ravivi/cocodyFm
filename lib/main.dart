import 'package:cocody_fm/screen/new.dart';
import 'package:cocody_fm/screen/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'radio.dart';
import 'screen/draw.dart';
import 'screen/home.dart';
import 'test.dart';
import 'testS.dart';

void main(){
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp
    ]
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cocody Fm',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: Category(),
    home: Home(),
      //home: MyAppp(),
      debugShowCheckedModeBanner: false,
      routes: {
        'article':(context)=>View()
      },
    );
  }
}

