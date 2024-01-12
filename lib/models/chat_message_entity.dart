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
      author: json['author'],
    );
  }
}

class Author {
  String userName;

  Author({required this.userName});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(userName: json['username']);
  }
}
