import 'package:flutter/material.dart';
import 'package:chillchat/welcomeScreen.dart';
import 'login.dart';
import 'Register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => welcomeScreen(),
       '/registration':(context)=>registration(),
        '/login':(context)=>login(),
       // '/chat':(context)=>chatScreen(),
      },
    );
  }
}
