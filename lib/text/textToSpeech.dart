import 'package:flutter/material.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';
import '../homepage.dart';

class Texttospeech extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Texttospeech> {
  VoiceController controller = FlutterTextToSpeech.instance.voiceController();
  TextEditingController textController = TextEditingController();
  bool _isListening = false;
  bool value = false;
  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
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
            'Text To Speech',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30.0),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal),
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
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: keyboardIsOpened
          ? null
          : FloatingActionButton.extended(
              backgroundColor: Color(0xff6809e0),
              icon: Icon(Icons.backspace),
              label: Text(
                'Back',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
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
    );
  }
}
