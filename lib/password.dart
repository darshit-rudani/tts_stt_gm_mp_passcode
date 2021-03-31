import 'dart:async';
import 'package:flutter/material.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'homepage.dart';

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();
  bool isAuthenticated = false;

  get strongpasscode => '123456';

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x61330355),
      appBar: AppBar(
        backgroundColor: Color(0xff6809e0),
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Project',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
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
                margin: EdgeInsets.only(top: 40,bottom: 130),
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Please Unlock Application !!!',
                    style: TextStyle(
                      color: Colors.black,
                      backgroundColor: Colors.white,
                      fontSize: 20,
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
            _lockScreenButton(context),
          ],
        ),
      ),
    );
  }

  _lockScreenButton(BuildContext context) => Container(
    width: 100,
    height: 70,
    child: FloatingActionButton(
          backgroundColor: Color(0xcb6809e0),
          child: Icon(Icons.lock,size: 40,color: Colors.cyan,),
          onPressed: () {
            _showLockScreen(
              context,
              opaque: false,
              cancelButton: Text(
                'Cancel',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                semanticsLabel: 'Cancel',
              ),
            );
          },
        ),
  );

  _showLockScreen(BuildContext context,
      {bool opaque,
      CircleUIConfig circleUIConfig,
      KeyboardUIConfig keyboardUIConfig,
      Widget cancelButton,
      List<String> digits}) {
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: opaque,
        pageBuilder: (context, animation, secondaryAnimation) => PasscodeScreen(
          title: Text(
            'Enter Passcode',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          circleUIConfig: circleUIConfig,
          keyboardUIConfig: keyboardUIConfig,
          passwordEnteredCallback: _passcodeEntered,
          cancelButton: cancelButton,
          deleteButton: Text(
            'Delete',
            style: const TextStyle(fontSize: 16, color: Colors.white),
            semanticsLabel: 'Delete',
          ),
          shouldTriggerVerification: _verificationNotifier.stream,
          backgroundColor: Colors.black.withOpacity(0.8),
          cancelCallback: _passcodeCancelled,
          digits: digits,
          passwordDigits: 6,
        ),
      ),
    );
  }

  _passcodeEntered(String enteredPasscode) {
    bool isValid = strongpasscode == enteredPasscode;
    _verificationNotifier.add(isValid);
    if (isValid) {
      setState(
        () {
          this.isAuthenticated = isValid;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return homePage();
              },
            ),
          );
        },
      );
    }
  }

  _passcodeCancelled() {
    Navigator.maybePop(context);
  }
}
