import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({required this.sender,required this.date, required this.text, required this.user});
  final String sender;
  final String date;
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
              child:Stack(
          
                children: [
                  Positioned(
                    bottom: 30,
                     right: 150,
                    left: 10,
                    child: Container(margin:EdgeInsets.only(bottom:0,left: 20),
                      width: 10,
                      height: 10,
                      color: Colors.red,
                      child: Text(
                        "$text",
                        style: TextStyle(
                            fontSize: 15.0,
                            color:
                                user ? Colors.white : Color.fromARGB(255, 37, 37, 37)),
                      ),
                    ),
                  ),

                  Positioned(
                  right: 150,
                    left: 150,
                    child: Container(color: Colors.amber,
                    margin:EdgeInsets.all(8),
                      child: Text("$date" ,style: TextStyle(
                              fontSize: 12.0,
                              color:
                                  user ? Colors.white : Color.fromARGB(255, 37, 37, 37)),
                      ),
                    ),
                  )
          
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class MessageBubble2 extends StatelessWidget {
  const MessageBubble2({required this.sender,required this.date, required this.text, required this.user});
  final String sender;
  final String date;
  final String text;
  final bool user;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: user ?  CrossAxisAlignment.end : CrossAxisAlignment.start,
           mainAxisAlignment:
            user ? MainAxisAlignment.end :MainAxisAlignment.start,

      children: [SizedBox(height: 17,child: Text( user ?  " " : sender),),
        Row(
           crossAxisAlignment: user ?  CrossAxisAlignment.end :CrossAxisAlignment.start ,
            mainAxisAlignment:
            user ? MainAxisAlignment.end :MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(margin:EdgeInsets.only(left: 3,right: 3),
                
                  decoration: BoxDecoration(
 borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                    bottomLeft: user ? Radius.circular(30) : Radius.circular(0),
                bottomRight: user ? Radius.circular(0) : Radius.circular(30)),
                  color: Color(0xff3E64FF),
                  ),
                  child: Row(children: [
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Text(text,style: TextStyle(
                                          fontSize: 15.0,
                                          color:
                                         Colors.white ),),
),

Positioned(
  bottom: 0,
  right: 0,
  left: 0,top: 30,
  child:   Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(date,style: TextStyle(
                                  fontSize: 12.0,
                                  color:
        
                                      Colors.white),),
  ),
),
                  ],),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}