import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/widgets/dog_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatefulWidget {
  final Function(ChatMessageEntity) onSubmit;

  ChatInput({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final messageController = TextEditingController();
  String _selectedImageUrl = '';

  void onSendButtonPressed() {
    print("sent message: ${messageController.text}");

    ChatMessageEntity _newMessage = ChatMessageEntity(
        message: messageController.text,
        id: "2342",
        createdAt: DateTime.now().millisecondsSinceEpoch,
        author: Author(username: "janeDoe"));

    if (_selectedImageUrl.isNotEmpty) {
      _newMessage.imageUrl = _selectedImageUrl;
    }

    widget.onSubmit(_newMessage);

    messageController.clear();
    _selectedImageUrl = '';
    setState(() {});
  }

  void onItemSelected(String url) {
    setState(() {
      _selectedImageUrl = url;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return DogBottomSheet(
                        onSelection: onItemSelected,
                      );
                    });
              },
              icon: const Icon(Icons.add)),
          Expanded(
            child: Column(
              children: [
                TextField(
                  controller: messageController,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Type your message here!",
                      hintStyle: TextStyle(color: Colors.blueGrey)),
                  style: const TextStyle(color: Colors.blueGrey),
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  minLines: 1,
                ),
                if (_selectedImageUrl.isNotEmpty)
                  Image.network(
                    _selectedImageUrl,
                    height: 50,
                  )
              ],
            ),
          ),
          IconButton(onPressed: onSendButtonPressed, icon: const Icon(Icons.send)),
        ],
      ),
    );
  }
}
