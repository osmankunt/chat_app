import 'package:chat_app/callback_function.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatefulWidget {
  Alignment alignment;
  String message;

  ChatBubble({Key? key, required this.alignment, required this.message}) : super(key: key);

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  var color = Colors.yellow;
  void changeColor(colorParam) {
    setState(() {
      color = colorParam;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: Container(
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius:
                BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.message,
              style: const TextStyle(fontSize: 20),
            ),
            Image.network(
              "https://3009709.youcanlearnit.net/Alien_LIL_131338.png",
              height: 90,
            ),
            Container(
              height: 50,
              color: color,
            ),
            CallbackFunction(color: Colors.deepPurple, callbackFunction: changeColor),
          ],
        ),
      ),
    );
  }
}
