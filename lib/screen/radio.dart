import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cocody_fm/providers/fm.dart';
import 'package:flutter/material.dart';

class RadioPage extends StatefulWidget {
  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> with TickerProviderStateMixin {
   var counter = Stream<double>.periodic(
    Duration(milliseconds: 98), (x)=>x.toDouble()).take(99);
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
  AnimationController controller;
  Animation widAnimation;
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    musicActu = maListe[index];
    configAudioPlayer();
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    widAnimation = Tween(
      begin: 300,
      end: 500,
    ).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 40, 56, 1),
      body: Container(
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
                      children: <Widget>[
                        echo(50),
                        echo(20),
                        echo(10),
                        echo(35),
                        echo(19),
                        echo(50),
                        echo(8),
                        echo(33),
                        echo(50),
                        echo(20),
                        echo(10),
                        echo(35),
                        echo(19),
                        echo(50),
                        echo(8),
                        echo(33),
                        echo(50),
                        echo(20),
                        echo(10),
                        echo(35),
                        echo(19),
                        echo(50),
                        echo(8),
                        echo(33),
                        echo(50),
                        echo(20),
                        echo(10),
                        echo(35),
                        echo(19),
                        echo(50),
                        echo(8),
                        echo(50),
                        echo(20),
                        echo(10),
                        echo(35),
                        echo(19),
                        echo(50),
                        echo(8),
                        echo(33),
                      ],
                    ),
                    
                    Center(
            child: StreamBuilder(
              stream: counter,
              builder: (context,snapshot){
                if(!snapshot.hasData){
                return Container(
                  margin:EdgeInsets.all(20),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),

                );
                }
          return Center(
                      child: Container(
                        child: snapshot.data==98.0? Text(
                          "${snapshot.data + 0.5}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 70,
                              fontWeight: FontWeight.bold),
                        ):Text(
                          "${snapshot.data}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 70,
                              fontWeight: FontWeight.bold),
                        ) ,
                      ),
                    );
              },
            ),
          ),
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
                    Icon(Icons.favorite, color: Colors.pinkAccent),
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
                      "Cocody Fm la meilleure des radios",
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
                          col("90.0"),
                          echo2(Colors.grey, 60, 7),
                          echo2(Colors.grey, 60, 7),
                          echo2(Colors.grey, 60, 7),
                          echo2(Colors.grey, 60, 0),
                          col("90.0"),
                          echo2(Colors.grey, 60, 7),
                          echo2(Colors.grey, 60, 7),
                          echo2(Colors.grey, 60, 7),
                          echo2(Colors.grey, 60, 7),
                          echo2(Colors.grey, 60, 7),
                          echo2(Colors.grey, 60, 7),
                          echo2(Colors.grey, 60, 7),
                          echo2(Colors.grey, 60, 7),
                          echo2(Colors.grey, 60, 2),
                          col("90.0"),
                          echo2(Colors.grey, 60, 7),
                          echo2(Colors.grey, 60, 7),
                          echo2(Colors.grey, 60, 7),
                          echo2(Colors.grey, 60, 0),
                          col("90.0"),
                          echo2(Colors.grey, 60, 7),
                          echo2(Colors.grey, 60, 7),
                          echo2(Colors.grey, 60, 7),
                          echo2(Colors.grey, 60, 0),
                          col("90.0"),
                          echo2(Colors.grey, 60, 7),
                          echo2(Colors.grey, 60, 7),
                          echo2(Colors.grey, 60, 7),
                          echo2(Colors.grey, 60, 0),
                          col("90.0"),
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
                              color: Colors.pink,
                            ),
                          ),
                          Icon(Icons.arrow_drop_up,
                              size: 50, color: Colors.pink)
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
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Transform.rotate(
                        angle: -1.0,
                        child: IconButton(
                            icon: Icon(setIcon(status)),
                            color: Colors.white,
                            iconSize: 50.0,
                            onPressed: () {
                              (status == PlayerState.playing)
                                  ? pause()
                                  : play();
                              setState(() {
                                controller.repeat();
                                controller.reverse();
                                print(controller.value);
                              });
                            }),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget echo(double top) {
    return Padding(
        padding: EdgeInsets.only(top: top, right: 5),
        child: Container(
          height: 80,
          width: 4,
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ));
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
            color: Colors.pinkAccent,
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
    });
  }

  Future pause() async {
    await advancedPlayer.pause();
    setState(() {
      status = PlayerState.paused;
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
}

enum ActionMusic { play, pause, rewind, forward }
enum PlayerState { playing, stopped, paused }
