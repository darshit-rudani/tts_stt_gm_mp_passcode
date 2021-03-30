import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';
import '../homepage.dart';

class Speechtotext extends StatefulWidget {
  @override
  _SpeechtotextState createState() => _SpeechtotextState();
}

class _SpeechtotextState extends State<Speechtotext> {
  stt.SpeechToText _speech;
  bool _isListening = false;
  String _textSpeech = 'Press the button to start speaking';
  int count = 0;
  List data = [];
  void onListen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(
          () {
            _isListening = true;
          },
        );
        _speech.listen(
          onResult: (val) => setState(
            () {
              _textSpeech = val.recognizedWords;
            },
          ),
        );
      }
    } else {
      setState(
        () {
          _isListening = false;
          _speech.stop();
          data.insert(count, _textSpeech);
          count++;
          _textSpeech = 'Press the button to speak again';
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x61330355),
      appBar: AppBar(
        backgroundColor: Color(0xff6809e0),
        leading: IconButton(
          icon: Icon(
            Icons.home,
            size: 40.0,
          ),
          color: Colors.grey,
          onPressed: () {
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
          padding: const EdgeInsets.only(left: 40.0),
          child: Text(
            'Speech To Text',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30.0),
          ),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: EdgeInsets.fromLTRB(25, 25, 25, 150),
          child: Text(
            _textSpeech,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Theme.of(context).primaryColor,
        endRadius: 100,
        duration: Duration(milliseconds: 2000),
        repeatPauseDuration: Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          backgroundColor: Color(0xff6809e0),
          onPressed: () => onListen(),
          child: Icon(_isListening ? Icons.mic : Icons.mic_none,),
        ),
      ),
    );
  }
}
