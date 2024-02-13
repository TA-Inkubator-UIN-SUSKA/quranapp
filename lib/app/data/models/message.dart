class Message {
  String msg;
  String question;
  String answer;
  final MessageType msgType;

  Message({
    required this.msg,
    required this.question,
    required this.answer,
    required this.msgType,
  });
}

enum MessageType { user, bot }
