import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class ChatInput extends StatelessWidget {
  ChatInput({Key? key}) : super(key: key);

  final messageController = TextEditingController();

  void onSendButtonPressed() {
    print("sent message: ${messageController.text}");
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
