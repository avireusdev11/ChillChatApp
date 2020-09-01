import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'buttonn.dart';

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
      appBar: AppBar(
        title: Text(
          "chillChat",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('messages').snapshots(),
              // ignore: missing_return
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  final messages = snapshot.data.documents;
                  List<Text> messageWidgets = [];
                  for (var mess in messages) {
                    final messageText = mess.get('text');
                    final messageSender = mess.get('sender');
                    final messageWidget = Text('$messageText from $messageSender');
                    messageWidgets.add(messageWidget);
                  }
                  return Column(
                    children: messageWidgets,
                  );
                }
              },
              /*builder: (context,snapshot){
                if(snapshot.hasData)
                  {
                    final messages=snapshot.data.documents;
                    List<Widget> messageWidgets=[];
                    for(var message in messages){
                      final messageText=message.data['text'];
                      final messageSender=message.data['sender'];
                      final messageWidget=Text('$message from $messageSender');
                      messageWidgets.add(messageWidget);
                    }
                    return Column(
                      children: [
                        messageWidgets,
                      ],
                    );
                  }
              },*/
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: TextField(
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
                  Expanded(
                    child: Container(
                      child: button(
                        chilld: Text('Send'),
                        colour: Color(0xff4285F4),
                        onpress: () {
                          _firestore.collection('messages').add({
                            'text': message,
                            'sender': mail,
                          });
                        },
                      ),
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
