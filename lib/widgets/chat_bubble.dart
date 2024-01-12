import 'package:chat_app/callback_function.dart';
import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/utils/theme_textstyle.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatefulWidget {
  ChatMessageEntity entity;

  ChatBubble({Key? key, required this.entity}) : super(key: key);

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

  BorderRadius messageBubbleDirection() {
    if (widget.entity.author.userName == "Ositech") {
      return const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomRight: Radius.circular(20));
    } else {
      return const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: messageBubbleDirection(),
      ),
      child: Column(
        children: [
          Text(
            widget.entity.message,
            style: ThemeTextStyle.messageTextStyle,
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
    );
  }
}
