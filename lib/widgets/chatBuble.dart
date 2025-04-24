import 'package:chat_app/Constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key,
    required this.message,
  });
  final Message message;
  @override
  Widget build(BuildContext context) {
    String timeSent = DateFormat('hh:mm a').format(DateTime.now());
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 16, bottom: 8, right: 16),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32)),
            color: kPrimaryColor),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text(
            message.message,
            style: TextStyle(color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(timeSent, // Display the time message was sent
                style: TextStyle(color: Colors.white70, fontSize: 12)),
          ),
        ]),
      ),
    );
  }
}

class ChatBubleForFriend extends StatelessWidget {
  const ChatBubleForFriend({
    super.key,
    required this.message,
  });
  final Message message;
  @override
  Widget build(BuildContext context) {
    String timeSent = DateFormat('hh:mm a').format(DateTime.now());
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 16, bottom: 8, right: 16),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomLeft: Radius.circular(32)),
            color: Color(0xffFFCB45)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text(
            message.message,
            style: TextStyle(color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(timeSent, // Display the time message was sent
                style: TextStyle(color: Colors.white70, fontSize: 12)),
          ),
        ]),
      ),
    );
  }
}
