import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'buttonn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';



class registration extends StatefulWidget {
  @override
  _registrationState createState() => _registrationState();
}
bool showSpinner=false;
String email;
String password;
final FirebaseAuth _auth=FirebaseAuth.instance;
class _registrationState extends State<registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
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
              onChanged: (value)
              {
                email=value;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Enter email id',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              onChanged: (value)
              {
                password=value;
              },
              decoration: InputDecoration(
                hintText: 'Set Your Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
            ),
            SizedBox(height: 10),
            button(
              chilld: Text(
                'Register',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              colour: Color(0xffA525FE),
              onpress: () async{
                setState(() {
                  showSpinner=true;
                });
                try{
                  final newuser=await _auth.createUserWithEmailAndPassword(email: email, password: password);
                  if(newuser!=null)
                  {
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
