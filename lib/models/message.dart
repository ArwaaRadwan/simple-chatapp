import 'package:chat_app/Constants.dart';

class Message {
  final String message;
  //final String id;
  late String? id;

  Message(this.message, this.id);

  factory Message.fromJson(jsonData) {
    return Message(jsonData[kMessage], jsonData["id"]);
  }
}
