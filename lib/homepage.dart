import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/googleMap.dart';
import 'package:project/speechToText.dart';
import 'bottomButton.dart';
import 'textToSpeech.dart';

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Flutter Project',
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
          Expanded(
            child: BottomButton(
              buttontitle: 'Music Player',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
