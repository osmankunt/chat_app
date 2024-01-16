import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:chat_app/models/activity_model.dart';
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

    //print(_messages.length);
  }

  Future<ActivityModel> _getNetworkImages() async {
    var urlEndPoint = Uri.parse("https://www.boredapi.com/api/activity");

    final response = await http.get(urlEndPoint);

    if (response.statusCode == 200) {
      final dynamic decodedList = jsonDecode(response.body);

      final _networkImage = ActivityModel.fromJson(decodedList);
      //final List<ImageModel> _networkImages = decodedList.map((e) {
      //  return ImageModel.fromJson(e);
      //}).toList();

      print(_networkImage.price);
      return _networkImage;
    } else {
      print("bulunamadi.");
      throw Exception('API has no data');
    }
  }

  onSubmit(ChatMessageEntity entity) {
    _messages.add(entity);
    setState(() {});
  }

  initState() {
    _getInitialMessages();
    _getNetworkImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _getNetworkImages();
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
              future: _getNetworkImages(),
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
