// import 'package:cocody_fm/screen/home.dart';
// import 'package:flutter/material.dart';
// import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
// import 'package:hidden_drawer_menu/menu/item_hidden_menu.dart';
// import 'package:hidden_drawer_menu/hidden_drawer/screen_hidden_drawer.dart';

// import 'radio.dart';

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<ScreenHiddenDrawer> itens = new List();

//   @override
//   void initState() {
//     itens.add(new ScreenHiddenDrawer(
//         new ItemHiddenMenu(
//           name: "Cocody Fm",
//           colorLineSelected: Colors.teal,
//           baseStyle:
//               TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 25.0),
//           selectedStyle: TextStyle(color: Colors.teal),
//         ),
//         Home()));

//     itens.add(new ScreenHiddenDrawer(
//         new ItemHiddenMenu(
//           name: "Screen 2",
//           colorLineSelected: Colors.orange,
//           baseStyle:
//               TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 25.0),
//           selectedStyle: TextStyle(color: Colors.orange),
//         ),
//         Container(
//           color: Colors.orange,
//           child: Center(
//             child: Text(
//               "Screen 2",
//               style: TextStyle(color: Colors.white, fontSize: 30.0),
//             ),
//           ),
//         )));

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return HiddenDrawerMenu(
//       initPositionSelected: 0,
//       screens: itens,
//       backgroundColorMenu: Colors.cyan,
//       typeOpen: TypeOpen.FROM_RIGHT,
//       slidePercent: 80.0,
//       verticalScalePercent: 80.0,
//       contentCornerRadius: 10.0,
//       iconMenuAppBar: Icon(Icons.menu),
//       //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
//       //    whithAutoTittleName: true,
//       //    styleAutoTittleName: TextStyle(color: Colors.red),
//       //    actionsAppBar: <Widget>[],
//       //    backgroundColorContent: Colors.blue,
//       //    backgroundColorAppBar: Colors.blue,
//       //    elevationAppBar: 4.0,
//       //    tittleAppBar: Center(child: Icon(Icons.ac_unit),),
//       //    enableShadowItensMenu: true,
//       //    backgroundMenu: DecorationImage(image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
//     );
//   }
// }


// import 'package:cocody_fm/screen/home.dart';
// import 'package:flutter/material.dart';
// import 'package:flippo_navigation/flippo_navigation.dart';

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Flippo(
//       mask: new Scaffold(
//         backgroundColor: Colors.blueGrey,

//       ),
//       body: new Scaffold(
//         body: Home(),

//       ),
//       drawer: new Scaffold(
        
//         backgroundColor: Color.fromRGBO(49, 49, 49, 1),
//         body: Container(
//           width: double.infinity,
//         ),

//       ),
//     );
//   }
// }