import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../homepage.dart';

class Musicplayer extends StatefulWidget {
  @override
  _MusicplayerState createState() => _MusicplayerState();
}

class _MusicplayerState extends State<Musicplayer> {
  AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String currentTime = "00:00";
  String completeTime = "00:00";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _audioPlayer.onAudioPositionChanged.listen((Duration duration) {
      setState(() {
        currentTime = duration.toString().split(".")[0];
      });
    });

    _audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        completeTime = duration.toString().split(".")[0];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x61190028),
      appBar: AppBar(
        backgroundColor: Color(0xff6809e0),
        leading: IconButton(
          icon: Icon(
            Icons.home,
            size: 40.0,
          ),
          color: Colors.grey,
          onPressed: () {
            _audioPlayer.pause();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return homePage();
                },
              ),
            );
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: Text(
            'Music Player',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.0),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50),
            child: FlatButton(
              onPressed: () async {
                _audioPlayer.pause();
                String filePath = await FilePicker.getFilePath();
                int status = await _audioPlayer.play(filePath, isLocal: true);
                if (status == 1) {
                  setState(() {
                    isPlaying = true;
                  });
                }
              },
              child: Image.asset(
                "images/s1.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: 80,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.7,
                left: MediaQuery.of(context).size.width * 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 50,
                      color: Colors.teal,
                    ),
                    onPressed: () {
                      if (isPlaying) {
                        _audioPlayer.pause();
                        setState(() {
                          isPlaying = false;
                        });
                      } else {
                        _audioPlayer.resume();
                        setState(() {
                          isPlaying = true;
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  currentTime,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Text(
                  " | ",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
                Text(
                  completeTime,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 17),
                  child: IconButton(
                    icon: Icon(
                      Icons.stop,
                      size: 50,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      _audioPlayer.stop();
                      setState(() {
                        isPlaying = false;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
