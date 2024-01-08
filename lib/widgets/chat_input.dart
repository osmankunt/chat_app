import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  const ChatInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          const Text(
            "Type your message here",
            style: TextStyle(color: Colors.blue),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
        ],
      ),
    );
  }
}
