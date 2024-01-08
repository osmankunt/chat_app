import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  Alignment alignment;
  String message;

  ChatBubble({Key? key, required this.alignment, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
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
              message,
              style: const TextStyle(fontSize: 20),
            ),
            Image.network(
              "https://3009709.youcanlearnit.net/Alien_LIL_131338.png",
              height: 90,
            ),
          ],
        ),
      ),
    );
  }
}
