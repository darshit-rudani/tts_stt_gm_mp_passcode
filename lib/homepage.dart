import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/hp/AndroidStudioProjects/project/lib/map/googleMap.dart';
import 'file:///C:/Users/hp/AndroidStudioProjects/project/lib/speech/speechToText.dart';
import 'bottomButton.dart';
import 'text/textToSpeech.dart';
import 'package:project/cameraapp/cameraapp.dart';
import 'package:project/music/musicPlayer.dart';
import 'password.dart';

// ignore: camel_case_types
class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  return Demo();
                },
              ),
            );
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 55.0),
          child: Text(
            'Music Player',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30.0),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: BottomButton(
              buttontitle: 'Text To Speech',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Texttospeech();
                    },
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: BottomButton(
              buttontitle: 'Speech To Text',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Speechtotext();
                    },
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: BottomButton(
              buttontitle: 'Music Player',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Musicplayer();
                    },
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: BottomButton(
              buttontitle: 'Camera',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CameraScreen();
                    },
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: BottomButton(
              buttontitle: 'Google Map',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Googlemap();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
