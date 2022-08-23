class MessageChatModel {
  String? sender;
  String? message;
  bool? seen;
  DateTime? createdon;
  MessageChatModel({
    this.sender,
    this.message,
    this.seen,
    this.createdon,
  });

  MessageChatModel.fromMap(Map<String, dynamic> map) {
    sender = map['sender'];
    message = map['message'];
    seen = map['seen'];
    createdon = map['createdon'].toDate();
  }

  Map<String, dynamic> toMap() {
    return {
      'sender': sender,
      'message': message,
      'seen': seen,
      'createdon': createdon,
    };
  }
}
