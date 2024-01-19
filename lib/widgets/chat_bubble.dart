import 'package:chat_app/message_seen.dart';
import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/utils/theme_textstyle.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatefulWidget {
  ChatMessageEntity entity;
  Alignment alignment;

  ChatBubble({Key? key, required this.entity, required this.alignment}) : super(key: key);

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
    if (widget.entity.author.username == "janeDoe") {
      return const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomRight: Radius.circular(20));
    } else {
      return const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20));
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isAuthor = widget.entity.author.username == "janeDoe";
    return Align(
      alignment: widget.alignment,
      child: Container(
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.width * 0.6),
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isAuthor ? Theme.of(context).primaryColor : Colors.blueGrey,
          borderRadius: messageBubbleDirection(),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                widget.entity.message,
                style: ThemeTextStyle.messageTextStyle,
              ),
              if (widget.entity.imageUrl != null)
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(widget.entity.imageUrl!)),
                      borderRadius: BorderRadius.circular(12)),
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
      ),
    );
  }
}
