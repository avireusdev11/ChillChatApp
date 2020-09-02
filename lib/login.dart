import 'package:chillchat/buttonn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'buttonn.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

bool showSpinner = false;
String mail;
String pass;
final _auth = FirebaseAuth.instance;

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff394263),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        child: Image.asset('image/logo.png'),
                        height: 100.0,
                      ),
                    ),
                  ),
                  Container(
                    child: TyperAnimatedTextKit(
                      text: ['ChillChat'],
                      speed: Duration(milliseconds: 300),
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 60.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            TextField(
              style: TextStyle(color: Colors.white, fontSize: 25),
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                hintText: 'Enter Your Email Id',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              onChanged: (value) {
                mail = value;
              },
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              style: TextStyle(color: Colors.white, fontSize: 25),
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                hintText: 'Enter Your Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              onChanged: (value) {
                pass = value;
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            button(
              chilld: Text(
                'Login',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              colour: Color(0xffA525FE),
              onpress: () async {
                setState(() {
                  showSpinner = true;
                });
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: mail, password: pass);
                  if (user != null) {
                    Navigator.pushNamed(context, '/chat');
                  }
                  setState(() {
                    showSpinner = false;
                  });
                } catch (e) {
                  print(e);
                  setState(() {
                    showSpinner = false;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
