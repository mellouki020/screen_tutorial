import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink[100],
      padding: (
      const EdgeInsets.all(8.0)
      ),
      child: Center(
            child: Text(
              'mellouki',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5.0,
                  color: Colors.blueAccent,
                  fontFamily: 'IndieFlower',
              )
              ),
            ),
    );
  }
}
