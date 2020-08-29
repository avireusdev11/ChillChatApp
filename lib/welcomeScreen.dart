import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'buttonn.dart';
import 'login.dart';
import 'main.dart';

class welcomeScreen extends StatefulWidget {
  @override
  _welcomeScreenState createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(width:135),
                    Container(
                      child: Image.asset('image/logo.png'),
                      height:60.0,
                    ),
                    Text(
                      'Chat',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                      ),
                    ),


                  ],
                ),
                SizedBox(height:10.0),
                button(
                  chilld: Text('Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),),
                  colour: Colors.white,
                  onpress: (){
                    Navigator.pushNamed(context, '/login');
                  },
                ),
                SizedBox(height: 10.0,),
                button(
                  chilld: Text('Register',
                    style: TextStyle(
                      color: Colors.black,
                    ),),
                  onpress: (){
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

