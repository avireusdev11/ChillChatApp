import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
final _auth = FirebaseAuth.instance;
final user= _auth.currentUser;
String mail=user.email;
class bubble extends StatelessWidget {
  @override
  bubble(this.text,this.sender);
  final String text;
  final String sender;
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: mail==sender?CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Text(sender,
          style: TextStyle(fontSize: 12),),
          Material(
            borderRadius: mail==sender?BorderRadius.only(topLeft: Radius.circular(30.0),bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0)):BorderRadius.only(topRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0)),
            color: mail==sender?Colors.blue:Colors.deepOrange,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Text('$text',
                style: TextStyle(fontSize: 15.0,color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
