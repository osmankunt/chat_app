import 'dart:async';
import 'dart:convert';
import 'package:chat_app/models/activity_model.dart';
import 'package:chat_app/repo/activity_repo.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/chat_message_entity.dart';
import 'widgets/chat_bubble.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatMessageEntity> _messages = [];

  _getInitialMessages() async {
    rootBundle.loadString('assets/mock_messages.json').then((response) {
      final List<dynamic> decodedList = jsonDecode(response) as List;

      final List<ChatMessageEntity> _chatMessages = decodedList.map((e) {
        return ChatMessageEntity.fromJson(e);
      }).toList();

      setState(() {
        _messages = _chatMessages;
      });
    }).then((value) => {print('get messages operation is done')});
  }

  final ActivityRepo _activityRepo = ActivityRepo();

  onSubmit(ChatMessageEntity entity) {
    _messages.add(entity);
    setState(() {});
  }

  initState() {
    _getInitialMessages();
    _activityRepo.getNetworkImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _activityRepo.getNetworkImages();
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
          FutureBuilder<ActivityModel>(
              future: _activityRepo.getNetworkImages(),
              builder: (BuildContext context, AsyncSnapshot<ActivityModel> snapshot) {
                if (snapshot.hasData) return Text(snapshot.data!.activity);

                return const CircularProgressIndicator();
              }),
          Expanded(
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(
                    alignment: _messages[index].author.username == "janeDoe" ? Alignment.centerLeft : Alignment.centerRight,
                    entity: _messages[index],
                  );
                }),
          ),
          ChatInput(
            onSubmit: onSubmit,
          ),
        ],
      ),
    );
  }
}
