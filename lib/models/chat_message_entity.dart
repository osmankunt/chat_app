import 'dart:convert';

class ChatMessageEntity {
  String message;
  String id;
  int createdAt;
  String? imageUrl;
  bool? isMessageSeen;
  Author author;

  ChatMessageEntity(
      {required this.message,
      required this.id,
      this.imageUrl,
      required this.createdAt,
      required this.author,
      this.isMessageSeen = false});

  factory ChatMessageEntity.fromJson(Map<String, dynamic> json) {
    return ChatMessageEntity(
      message: json['text'],
      id: json['id'],
      createdAt: json['createdAt'],
      imageUrl: json['image'],
      author: Author.fromJson((json['author'])),
    );
  }
}

class Author {
  String username;

  Author({required this.username});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(username: json['username']);
  }
}
