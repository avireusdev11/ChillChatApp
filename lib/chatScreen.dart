import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'buttonn.dart';
import 'messageStream.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class chatScreen extends StatefulWidget {
  @override
  _chatScreenState createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  final _auth = FirebaseAuth.instance;
  String message;
  String mail;
  final messageTextController = TextEditingController();
  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        mail = user.email;
      }
    } catch (e) {
      print(e);
    }
  }

  void getMessages() async {
    final messages = await _firestore.collection('messages').getDocuments();
  }

  void messagesStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var messages in snapshot.documents) {
        print(messages.data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff394263),
      appBar: AppBar(
        title: Text(
          "chillChat",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await _auth.signOut();
              Navigator.pushNamed(context, '/');
            },
            icon: Icon(Icons.remove),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            messageStream(),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 2000,
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: messageTextController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                        onChanged: (value) {
                          message = value;
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: 90,
                    child: button(
                      chilld: Text(
                        'Send',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      colour: Color(0xff4285F4),
                      onpress: () {
                        messageTextController.clear();
                        _firestore.collection('messages').add({
                          'text': message,
                          'sender': mail,
                          'date': DateTime.now().toIso8601String().toString(),
                        });
                      },
                    ),
                  ),
                  /*Container(
                  child:
                ),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
