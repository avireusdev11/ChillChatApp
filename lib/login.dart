import 'package:chillchat/buttonn.dart';
import 'package:flutter/material.dart';
import 'buttonn.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset('image/logo.png'),
                height: 100.0,
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
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter Your Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
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
            onpress: (){
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}
