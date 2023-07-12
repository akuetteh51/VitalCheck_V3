import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:vitacheck/controller/baseurl.dart';
import 'Database/db_provider.dart';



class SensorDataApi extends ChangeNotifier {

Map respData={};
  Map _sensorData1 = {};
  int _status=0;
  Map get sensorData1 => _sensorData1;
  int get  status=>_status;
   Stream<Map> initStream() async* {
  var public = await DatabaseProvider().getUserId();
    try {
      var dio = Dio();
      Response response = await dio.get(
          APPBASEURL.baseUrl+"sensorData/f0562ba7-8fc4-4fea-919a-f8592b8fe251");
         respData= response.data;

         print(respData);
      if (respData["status"] == 200) {
        _sensorData1 =respData;
        print("<____Status:${respData["status"]}");
        notifyListeners();
       
      } else {
        print(respData['status']);
     _status =   respData['status'];
     _sensorData1 =respData;
  
     print(_status);
        print("Error fetching Data");
         notifyListeners();
        
      }
    } catch (e) {
      print(e);
     
    }
  }
}
