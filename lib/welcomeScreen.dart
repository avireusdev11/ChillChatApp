import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'buttonn.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class welcomeScreen extends StatefulWidget {
  @override
  _welcomeScreenState createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff394263),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(width: 50),
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('image/logo.png'),
                    height: 100.0,
                  ),
                ),
                Flexible(
                  child: TyperAnimatedTextKit(
                    text: ['ChillChat'],
                    speed: Duration(milliseconds: 300),
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 60.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.0),
            button(
              chilld: Text(
                'Login',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                ),
              ),
              colour: Color(0xff0ffa525fe),
              onpress: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            SizedBox(
              height: 50.0,
            ),
            button(
              chilld: Text(
                'Register',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                ),
              ),
              onpress: () {
                Navigator.pushNamed(context, '/registration');
              },
              colour: Color(0xffa525fe),
            ),
          ],
        ),
      ),
    );
  }
}
