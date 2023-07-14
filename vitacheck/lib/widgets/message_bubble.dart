import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({required this.sender, required this.text, required this.user});
  final String sender;
  final String text;
  final bool user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            user ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            "$sender",
            style: TextStyle(fontSize: 12.0, color: Colors.black45),
          ),
          Material(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: user ? Radius.circular(30) : Radius.circular(0),
                bottomRight: user ? Radius.circular(0) : Radius.circular(30)),
            elevation: 5.0,
            color: user ? Color(0xff3E64FF) : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: Text(
                "$text",
                style: TextStyle(
                    fontSize: 15.0,
                    color:
                        user ? Colors.white : Color.fromARGB(255, 37, 37, 37)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
