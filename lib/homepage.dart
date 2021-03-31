import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/password.dart';
import 'constant.dart';
import 'file:///C:/Users/hp/AndroidStudioProjects/project/lib/map/googleMap.dart';
import 'file:///C:/Users/hp/AndroidStudioProjects/project/lib/speech/speechToText.dart';
import 'text/textToSpeech.dart';
import 'package:project/cameraapp/cameraapp.dart';
import 'package:project/music/musicPlayer.dart';

// ignore: camel_case_types
class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x61330355),
      appBar: AppBar(
        backgroundColor: Color(0xff6809e0),
        title: Container(
          margin: EdgeInsets.all(65),
          child: Text(
            'Project',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 30,),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10,),
                child: Image.asset(
                  "images/s5.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 30,),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 40,bottom: 160),
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'You have complete Authentication..',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black45,
                          offset: Offset(10.0, 10.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Column(
              children: [
                DrawerHeader(
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage('images/s2.jpg'),
                    ),
                  ),
                ),
                Text(
                  'What you want to perform',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              //0xff450368
              title: Text(
                '->   Text To Speech',
                style: kSidebarText,
              ),
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
            ListTile(
              title: Text(
                '->   Speech To Text',
                style: kSidebarText,
              ),
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
            ListTile(
              title: Text(
                '->   Music Player',
                style: kSidebarText,
              ),
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
            ListTile(
              title: Text(
                '->   Google Map',
                style: kSidebarText,
              ),
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
            ListTile(
              title: Text(
                '->   Camera',
                style: kSidebarText,
              ),
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
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xff6809e0),
        icon: Icon(
          Icons.backspace,
          color: Colors.black,
        ),
        label: Text(
          'Back',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return DemoPage();
              },
            ),
          );
        },
      ),
    );
  }
}
