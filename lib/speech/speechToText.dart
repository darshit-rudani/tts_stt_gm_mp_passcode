import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';
import '../constant.dart';

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
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.home,
            size: 40.0,
          ),
          color: Colors.grey,
          onPressed: () {
            Navigator.pop(context);
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
      body: Column(
        children: [
          SingleChildScrollView(
            reverse: true,
            child: Container(
              child: Text(
                _textSpeech,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
            ),
          ),
          Container(
            child: AvatarGlow(
              animate: _isListening,
              glowColor: Theme.of(context).primaryColor,
              endRadius: 100,
              duration: Duration(milliseconds: 2000),
              repeatPauseDuration: Duration(milliseconds: 100),
              repeat: true,
              child: FloatingActionButton(
                onPressed: () => onListen(),
                child: Icon(_isListening ? Icons.mic : Icons.mic_none),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: keyboardIsOpened
          ? null
          : FloatingActionButton.extended(
              icon: Icon(Icons.backspace),
              label: Text(
                'Back',
                style: kLableTextStyle,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
    );
  }
}
