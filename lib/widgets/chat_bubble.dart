import 'package:chat_app/callback_function.dart';
import 'package:chat_app/models/chat_message_entity.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatefulWidget {
  ChatMessageEntity entity;
  Alignment alignment;

  ChatBubble({Key? key, required this.alignment, required this.entity}) : super(key: key);

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  var color = Colors.yellow;
  void changeColor(colorParam) {
    setState(() {
      color = colorParam;
      if (widget.entity.isMessageSeen != null) {
        widget.entity.isMessageSeen = !widget.entity.isMessageSeen!;
        print(widget.entity.isMessageSeen);
      }
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
              widget.entity.message,
              style: const TextStyle(fontSize: 20),
            ),
            if (widget.entity.imageUrl != null)
              Image.network(
                widget.entity.imageUrl!,
                height: 90,
              ),
            Container(
              height: 20,
              color: color,
            ),
            (color == Colors.yellow)
                ? MessageSeen(color: Colors.deepPurple, callbackFunction: changeColor)
                : MessageSeen(color: Colors.yellow, callbackFunction: changeColor),
          ],
        ),
      ),
    );
  }
}
