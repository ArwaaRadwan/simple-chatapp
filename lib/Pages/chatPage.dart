import 'package:chat_app/Constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/widgets/chatBuble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class Chatpage extends StatelessWidget {
  final ScrollController _controller = ScrollController();

  static String id = "ChatPage";

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              //automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    kLogo,
                    height: 50,
                  ),
                  Text(
                    " Chat ",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        return messagesList[index].id == email
                            ? ChatBuble(
                                message: messagesList[index],
                              )
                            : ChatBubleForFriend(message: messagesList[index]);
                      }),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.16),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        messages.add({
                          kMessage: data,
                          kCreatedAt: DateTime.now(),
                          "id": email
                        });
                        controller.clear();
                        _controller.animateTo(
                          0,
                          curve: Curves.easeIn,
                          duration: Duration(milliseconds: 500),
                        );
                      },
                      decoration: InputDecoration(
                        hintText: "Send Message",
                        suffixIcon: Icon(Icons.send),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: kPrimaryColor)),
                      ),
                    )),
              ],
            ),
          );
        } else {
          return Text("Loading..");
        }
      },
    );
  }
}
