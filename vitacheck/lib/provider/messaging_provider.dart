import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:vitacheck/controller/baseurl.dart';
import 'Database/db_provider.dart';



class MessagingDataApi extends ChangeNotifier {

Map respData={};
  Map _message = {};
  int _status=0;
  Map get message => _message;
  int get  status=>_status;
   Stream<Map> initChat() async* {
  var public = await DatabaseProvider().getUserId();
    try {
      var dio = Dio();
      Response response = await dio.get(
          "${APPBASEURL.baseUrl}chat_nurse/${public}");
         respData= response.data;
      if (respData["status"] == 200) {
        _message =respData;
        // print("<____Status:${respData["status"]}");
        notifyListeners();
       
      } else {
        print(respData['status']);
     _status =   respData['status'];
  
     print(_status);
        print("Error fetching Data");
         notifyListeners();
        
      }
    } catch (e) {
      print(e);
     
    }
  }
}

class ReplyDataApi extends ChangeNotifier {

Map respData={};
  String _message = "";
  int _status=0;
  String get message => _message;
  int get  status=>_status;
    replyChat({required String reply}) async {
      print(" my reply to you $reply");
  var public = await DatabaseProvider().getUserId();
  print(" my reply to you $reply");
  Map body={
"user_Id":public,
"message":reply
  };
 
    try {
      var dio = Dio();
      Response response = await dio.post(
          "${APPBASEURL.baseUrl}chat_nurse/6e3bceae-4016-4f57-9bf1-0fe695fb23ba",data:body);
         respData= response.data;

         print(respData);
      if (respData["status"] == 200) {
        _message =respData['msg'];
        print("<____Status:${respData["status"]}");
        notifyListeners();
       
      } else {
        print(respData['status']);
     _status =   respData['status'];
  
     print(_status);
        print("Error fetching Data");
         notifyListeners();
        
      }
    } catch (e) {
      print(e);
     
    }
  
  }
}
