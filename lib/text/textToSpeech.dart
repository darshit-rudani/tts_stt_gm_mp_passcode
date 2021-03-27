import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';
import '../constant.dart';

class Texttospeech extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Texttospeech> {

  VoiceController controller = FlutterTextToSpeech.instance.voiceController();
  TextEditingController textController = TextEditingController();
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    controller.init();
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
            'Text To Speech',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30.0),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
              controller: textController,
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.0, right: 40.0),
            // ignore: deprecated_member_use
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(
                  width: 3,
                  color: Color(0xff6809e0),
                ),
              ),
              onPressed: () {
                setState(() {
                  _isListening = true;
                });
                controller.speak(
                  "${textController.text}",
                );
                textController.clear();
              },
              child: Center(
                child: Text(
                  'Tap For Speak',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              padding: EdgeInsets.all(8.0),
              color: Color(0xff6809e0),
            ),
          ),
          Expanded(
            flex: 5,
            child: AvatarGlow(
              glowColor: Colors.white,
              animate: _isListening,
              endRadius: 100,
              repeat: true,
              duration: Duration(milliseconds: 2000),
              repeatPauseDuration: Duration(milliseconds: 100),
              child: FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.mic),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
