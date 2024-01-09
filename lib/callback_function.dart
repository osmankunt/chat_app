import 'package:flutter/material.dart';

class CallbackFunction extends StatelessWidget {
  Color color;
  final Function callbackFunction;
  CallbackFunction({Key? key, required this.color, required this.callbackFunction}) : super(key: key);

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
