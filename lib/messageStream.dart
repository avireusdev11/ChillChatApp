import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'messagebubble.dart';

final _auth = FirebaseAuth.instance;
final _firestore = Firestore.instance;

class messageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').orderBy('date').snapshots(),
      // ignore: missing_return
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          final messages = snapshot.data.documents.reversed;
          List<bubble> messageWidgets = [];
          for (var mess in messages) {
            final messageText = mess.get('text');
            final messageSender = mess.get('sender');
            final messageBubble = bubble(messageText, messageSender);
            messageWidgets.add(messageBubble);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              children: messageWidgets,
            ),
          );
        }
      },
    );
  }
}
