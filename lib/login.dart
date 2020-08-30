import 'package:chillchat/buttonn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'buttonn.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class login extends StatefulWidget {
  @override

  _loginState createState() => _loginState();
}
bool showSpinner=false;
String mail;
String pass;
final _auth=FirebaseAuth.instance;


class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          children: [
            SizedBox(height: 100.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('image/logo.png'),
                    height: 100.0,
                  ),
                ),
                Container(
                  child: Text(
                    'ChillChat',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter email id',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              onChanged: (value)
              {
                mail=value;
              },
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter Your Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              onChanged: (value)
              {
                pass=value;
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
              onpress: () async{
                setState(() {
                  showSpinner=true;
                });
                try{
                  final user = await _auth.signInWithEmailAndPassword(
                      email: mail, password: pass);
                  if (user != null) {
                    Navigator.pushNamed(context, '/chat');
                  }
                  setState(() {
                    showSpinner=false;
                  });
                }
                catch(e)
                {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
