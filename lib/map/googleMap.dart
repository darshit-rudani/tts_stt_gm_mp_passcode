import 'package:flutter/material.dart';

class Googlemap extends StatelessWidget {
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
            Navigator.pop(context);
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Text(
            'Google Map',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30.0),
          ),
        ),
      ),
    );
  }
}

