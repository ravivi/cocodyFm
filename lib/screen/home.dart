import 'package:cocody_fm/providers/radioCharge.dart';
import 'package:cocody_fm/screen/category.dart';
import 'package:cocody_fm/screen/new.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cocody_fm/providers/fm.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import 'radio.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool click = false;
  TabController _tabController;

  List<Music> maListe = [
    new Music(
        "NRJ radio", "http://radio.nan.ci:8000/stream", "images/arafat.jpg"),
  ];
  Music musicActu;
  Duration _duration = new Duration();
  Duration _position = new Duration();
  var blueColor = Color(0xFF090e42);
  var pinkColor = Color(0xFFff6b80);
  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  PlayerState status = PlayerState.stopped;
  bool _repeat = false;
  bool _shuffle = false;
  int index = 0;

  @override
  void initState() {
    musicActu = maListe[index];
    configAudioPlayer();
    _tabController = new TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd MMM yyyy').format(now);
    var nowh = new DateTime.now();
    var formatterh = new DateFormat('H').format(nowh);
    print(formatterh);
    print(click);
    return new Scaffold(
      backgroundColor: Color.fromRGBO(24, 40, 56, 1),
      appBar: new AppBar(
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
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Color.fromRGBO(210, 3, 6, 1).withOpacity(0.8),
          tabs: [
            new Tab(
              icon: new Icon(Icons.radio),
              text: "Radio",
            ),
            new Tab(
              icon: new Icon(Icons.playlist_play),
              text: "Programme",
            ),
            new Tab(
              icon: new Icon(Icons.fiber_new),
              text: "Annonce",
            ),
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomOpacity: 1,
      ),
      body: TabBarView(
        children: [radio(formatter, formatterh), Category(), New()],
        controller: _tabController,
      ),
    );
  }

  void configAudioPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);
    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });
    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });

    advancedPlayer.completionHandler = () {
      setState(() {});
    };
  }

  Future play() async {
    await advancedPlayer.play(musicActu.beat);
    setState(() {
      status = PlayerState.playing;
      click = !click;
    });
  }

  Future pause() async {
    await advancedPlayer.pause();
    setState(() {
      status = PlayerState.paused;
      click = !click;
    });
  }

  void forward() {
    if (index == maListe.length - 1) {
      index = 0;
    } else {
      index++;
    }
    musicActu = maListe[index];
    advancedPlayer.stop();
    configAudioPlayer();
    play();
  }

  IconData setIcon(status) {
    switch (status) {
      case PlayerState.playing:
        return Icons.pause;
      case PlayerState.paused:
        return Icons.play_arrow;
      case PlayerState.stopped:
        return Icons.play_arrow;
    }
  }

  Widget echo2(Color color, double heigth, double right) {
    return Padding(
      padding: EdgeInsets.only(right: right),
      child: Container(
        height: heigth,
        width: 2,
        decoration: BoxDecoration(
          color: color,
        ),
      ),
    );
  }

  Widget col(String freq) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Container(
          height: 70,
          width: 2,
          decoration: BoxDecoration(
            color: Color.fromRGBO(210, 3, 6, 1),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          freq,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }

  Widget radio(String formatter, String formatterh) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(24, 40, 56, 1),
          image: DecorationImage(
              image: ExactAssetImage("images/radi.jpg"),
              colorFilter: ColorFilter.mode(
                  Color.fromRGBO(24, 40, 56, 1).withOpacity(0.2),
                  BlendMode.dstATop),
              fit: BoxFit.cover)),
      child: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Stack(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SpinKitWave(
                        color: Color.fromRGBO(210, 3, 6, 1),
                        size: 90.0,
                        //duration: (status == PlayerState.playing)?Duration(seconds:1):Duration(microseconds: 1)
                      ),
                      SpinKitWave(
                        color: Color.fromRGBO(210, 3, 6, 1),
                        size: 90.0,
                        // duration: Duration(seconds: click ? 1: 50),
                      ),
                      SpinKitWave(
                        color: Color.fromRGBO(210, 3, 6, 1),
                        size: 90.0,
                        //duration: Duration(seconds: click ? 1: 50),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                        child: Text(
                      "98.5",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                    )),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.orangeAccent,
                    size: 25,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Cocody Fm",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Cocody Fm $formatter",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                    top: 20,
                    child: Row(
                      children: <Widget>[
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 0),
                        col("90.0"),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 0),
                        col("92.0"),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 0),
                        col("94.0"),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 2),
                        col("105.0"),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 0),
                        col("110.0"),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 0),
                        col("112.0"),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 0),
                        col("115.0"),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 7),
                        echo2(Colors.grey, 60, 0),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          height: 70,
                          width: 3,
                          decoration: BoxDecoration(
                            color: Colors.red,
                          ),
                        ),
                        Icon(Icons.arrow_drop_up, size: 50, color: Colors.red)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Transform.rotate(
                angle: 1.0,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(210, 3, 6, 1).withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Transform.rotate(
                        angle: -1.0,
                        child: IconButton(
                            icon: Icon(setIcon(status)),
                            color: Colors.white,
                            iconSize: 50.0,
                            onPressed: () async {
                              var result =
                                  await Connectivity().checkConnectivity();
                              if (result == ConnectivityResult.none) {
                                return showAlertDialog(context, 'Notification',
                                    'Connectez Vous a Internet pour ecouter Cocody Fm');
                              }
                              if (double.parse(formatterh) >= 8 &&
                                  double.parse(formatterh) < 22) {
                                (status == PlayerState.playing)
                                    ? pause()
                                    : play();
                              } else {
                                return showAlertDialog(context, 'Notification',
                                    'Cocody Fm est Ouvert de 8H à 22H');
                              }
                            })),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, String title, String content) {
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
}

enum ActionMusic { play, pause, rewind, forward }
enum PlayerState { playing, stopped, paused }
