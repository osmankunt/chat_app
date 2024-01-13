import 'package:chat_app/models/chat_message_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class ChatInput extends StatelessWidget {
  final Function(ChatMessageEntity) onSubmit;
  ChatInput({Key? key, required this.onSubmit}) : super(key: key);

  final messageController = TextEditingController();

  void onSendButtonPressed() {
    print("sent message: ${messageController.text}");

    ChatMessageEntity _newMessage = ChatMessageEntity(
        message: messageController.text,
        id: "2342",
        createdAt: DateTime.now().millisecondsSinceEpoch,
        author: Author(username: "janeDoe"));

    onSubmit(_newMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          Expanded(
            child: TextField(
              controller: messageController,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Type your message here!", hintStyle: TextStyle(color: Colors.blueGrey)),
              style: const TextStyle(color: Colors.blueGrey),
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              minLines: 1,
            ),
          ),
          IconButton(onPressed: onSendButtonPressed, icon: const Icon(Icons.send)),
        ],
      ),
    );
  }
}
