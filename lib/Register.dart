import 'package:flutter/material.dart';
import 'buttonn.dart';

class registration extends StatefulWidget {
  @override
  _registrationState createState() => _registrationState();
}

class _registrationState extends State<registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
            onpress: (){},
          ),
        ],
      ),
    );
  }
}
