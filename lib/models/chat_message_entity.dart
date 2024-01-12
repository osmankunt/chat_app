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
}

class Author {
  String userName;

  Author({required this.userName});
}
