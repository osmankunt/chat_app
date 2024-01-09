import 'package:flutter/material.dart';

class MessageSeen extends StatelessWidget {
  Color color;
  final Function callbackFunction;
  MessageSeen({Key? key, required this.color, required this.callbackFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          callbackFunction(color);
        },
        child: Text("Change color"),
      ),
    );
  }
}
