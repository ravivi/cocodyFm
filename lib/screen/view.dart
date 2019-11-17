import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

class View extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  final Set<String> _favorites = Set<String>();

  @override
  Widget build(BuildContext context) {
    Map<String, Object> args =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    print(args['lien']);
    return Scaffold(
        backgroundColor: Color.fromRGBO(24, 40, 56, 1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(24, 40, 56, 1),
          title: Row(
            children: <Widget>[
              Image.asset(
                "images/image.png",
                height: 30,
              ),
              Text("Cocody Fm"),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  ".",
                  style: TextStyle(
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              )
            ],
          ),
          // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
        ),
        body: FutureBuilder(
          future: web(args['lien']),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              
             return WebView(
                initialUrl: args['lien'],
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
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
          },
        ));
  }

  Future web(String lien) async {
    return await http.get(lien);
  }
}
