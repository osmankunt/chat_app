import 'package:chat_app/login_page.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'models/chat_message_entity.dart';
import 'widgets/chat_bubble.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  final List<ChatMessageEntity> _messages = [
    ChatMessageEntity(
        message: 'How you doing mate?',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: '123445566',
        author: Author(
          userName: 'Ositech',
        )),
    ChatMessageEntity(
        message: 'Its alright?',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: '123445566',
        author: Author(
          userName: 'Bruder',
        )),
    ChatMessageEntity(
        message: 'All good mate',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: '123445566',
        author: Author(
          userName: 'Ositech',
        )),
    ChatMessageEntity(
        message: 'Thanks',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: '123445566',
        author: Author(
          userName: 'Bruder',
        )),
  ];

  @override
  Widget build(BuildContext context) {
    final userName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Hi $userName",
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(
                    entity: _messages[index],
                  );
                }),
          ),
          ChatInput(),
        ],
      ),
    );
  }
}
