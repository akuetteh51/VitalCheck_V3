

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitacheck/provider/messaging_provider.dart';

import '../widgets/message_bubble.dart';
import 'package:intl/intl.dart';



class aichat extends StatefulWidget {
  const aichat({Key? key}) : super(key: key);

  @override
  State<aichat> createState() => _aichatState();
}

class _aichatState extends State<aichat> {
  String reply_message ="";
  bool _user= false;
//  getMessages ( ) async{
//  await  MessageBubble(
//                     sender: "messageSend[0]",
//                     text: "",
//                     user: true,
//                   );
// }

  @override
  Widget build(BuildContext context) {
    MessagingDataApi message =context.watch<MessagingDataApi>();
    
    bool _ishintTextcleared=false;
    
    final messageTextController = TextEditingController();
      List<dynamic> messages=[];
      // messages.add(message.message['msg']);

    return StreamBuilder<Map>(
      stream: message.initChat(),
      initialData: {},
      builder: (context, snapshot) {
      
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff3E64FF),
            leading: IconButton(icon:Icon(Icons.arrow_back_ios_new),onPressed:() => Navigator.of(context).pop() ,),
            title: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("images/doct2.png"),
                  radius: 18,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dr Esther Brown"),
                    Text(
                      "last seen today at 5:12 am",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    )
                  ],
                )
              ],
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Stack(children: [
              Image.asset(
                "images/chatback.png",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              Expanded(
                  child: 
                 SingleChildScrollView(
                   child: Column(
    
                    children: [
                       MessageBubble2(
                      sender:"message",
                      text:message.message["msg"].toString(),
                      date: message.message["date"].toString(),
                      user:false,
                    ), MessageBubble2(
                      sender:"message",
                      text:message.message["msg"].toString(),
                      date: message.message["date"].toString(),
                      user:true,
                    ),
                    ],
                   ),
                 )
              
           
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    // decoration:  ,
    
                    color: Color(0xff3E64FF),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: TextField(showCursor: true,
                            // controller: messageTextController,
                              // cursorColor:Colors.white,
                          decoration: InputDecoration(
                              hintText: "Type your message ",
                              hintStyle: TextStyle(color: Colors.white),
                              prefixIcon: IconButton(
                                onPressed: () {

                                DateTime now = DateTime.now();

String formattedTime = DateFormat('h:mm a').format(now);
print(formattedTime);

                                },
                                icon: Icon(
                                  Icons.attach_file,
                                  color: Colors.white,
                                ),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                 

                                  Consumer<ReplyDataApi>(
                                    builder: (context, reply, child) {
                                      return 
                                 
                              reply.replyChat(reply:reply_message);
                                      
                                    },

                                  );
                       
                                },
                                icon: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                              )),
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        
                          cursorColor: Colors.white,
                          
onSubmitted: (value) {
  
reply_message=value;
//  messageTextController.clear();
} ,
                        onTap:(){
                       

                        }),
                        )
                      ],
                    ),
                  ))
            ]),
          ),
        );
      }
    );
  }
}

