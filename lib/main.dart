import 'package:chat_app/chat_page.dart';
import 'package:chat_app/login_page.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      title: "Chat App",
      home: LoginPage(),
      routes: {'/chat': (context) => ChatPage()},
    );
  }
}
