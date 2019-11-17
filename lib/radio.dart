import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

import 'providers/fm.dart';

class Homes extends StatefulWidget{
  final String title;
  Homes({Key key, this.title}): super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new _Homes();
  }
}

class _Homes extends State<Homes>{
  List<Music> maListe = [
    new Music("NRJ radio",  "http://185.52.127.163/fr/30001/mp3_128.mp3", "images/arafat.jpg"),

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
    super.initState();
    musicActu = maListe[index];
    configAudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: Column(
        children: <Widget>[
          Container(
            height: 320,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(musicActu.img), fit: BoxFit.cover)),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [blueColor.withOpacity(0.4), blueColor],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 52.0),

                      Spacer(),

                      Text(musicActu.nom,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,)),
                      SizedBox(
                        height: 6.0,
                      ),
                      Icon(Icons.radio, color: Colors.white, size: 85,),

                      SizedBox(height: 16.0),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 42.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 32.0),
              Container(

                  child: Center(
                    child: IconButton(icon: Icon(setIcon(status), size: 58.0,), color: Colors.white, onPressed: () => (status == PlayerState.playing) ? pause() : play()),
                  )),
              SizedBox(width: 32.0),
            ],
          ),


          SizedBox(height: 58.0),
        ],
      ),
    );
  }


  Text myText(String data, double scale, double size){
    return new Text(data, textScaleFactor: scale, style: TextStyle(color: Colors.white, fontSize: size, fontStyle: FontStyle.italic),);
  }

  void configAudioPlayer(){
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);
    advancedPlayer.durationHandler = (d) => setState(() {
      _duration = d;
    });
    advancedPlayer.positionHandler = (p) => setState(() {
      _position = p;
    });

    advancedPlayer.completionHandler = () {
      setState(() {
      });
    };
  }

  Future play() async{
    await advancedPlayer.play(musicActu.beat);
    setState(() {
      status = PlayerState.playing;
    });
  }
  Future pause() async{
    await advancedPlayer.pause();
    setState(() {
      status = PlayerState.paused;
    });
  }
  void forward(){
    if(index == maListe.length - 1){
      index = 0;
    }else{
      index ++;
    }
    musicActu = maListe[index];
    advancedPlayer.stop();
    configAudioPlayer();
    play();
  }


  IconData setIcon(status){
    switch (status){
      case PlayerState.playing:
        return Icons.pause;
      case PlayerState.paused:
        return Icons.play_circle_filled;
      case PlayerState.stopped:
        return Icons.play_circle_filled;
    }
  }


}

enum ActionMusic{
  play,
  pause,
  rewind,
  forward
}
enum PlayerState{
  playing,
  stopped,
  paused
}

