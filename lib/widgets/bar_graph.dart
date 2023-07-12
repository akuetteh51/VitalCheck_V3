import 'package:fl_animated_linechart/chart/animated_line_chart.dart';
import 'package:fl_animated_linechart/chart/area_line_chart.dart';
import 'package:fl_animated_linechart/common/pair.dart';
import 'package:flutter/material.dart';


class bar extends StatelessWidget {
  int height;
  String label;
  String month;

   bar({ required this.height ,required this.label,required this.month});

  @override
  Widget build(BuildContext context) {
 Map<DateTime, double> line1 ={DateTime.parse('2002-02-27T12:10:00'):12,DateTime.parse('2002-02-27T12:13:00'):34,DateTime.parse('2002-02-27T12:15:00'):24,DateTime.parse('2002-02-27T12:18:00'):14,DateTime.parse('2002-02-27T12:20:00'):14};
    Map<DateTime, double> line2 = {DateTime.parse('2002-02-27T12:10:00'):15,DateTime.parse('2002-02-27T12:13:00'):21,DateTime.parse('2002-02-27T12:15:00'):20,DateTime.parse('2002-02-27T12:18:00'):18,DateTime.parse('2002-02-27T12:20:00'):24};
      AreaLineChart lineChart= AreaLineChart.fromDateTimeMaps([line1,line2],[Colors.blue,Colors.red],["Days","Time"], yAxisName: "Blood pressure",
          gradients: [Pair(Colors.yellow.shade400, Color.fromARGB(255, 9, 148, 136)),Pair(Colors.green.shade400, Color.fromARGB(255, 93, 211, 47))]);
  
    return Container(
      height: 600,
      width: double.infinity,
      margin: EdgeInsets.only(left: 20,right: 20),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black26,offset: Offset(0,2))],
      color: Colors.white,
        borderRadius: BorderRadius.circular(10)
        ),
      child: Column(
        
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Icon(Icons.arrow_back_ios_new),Text("Your Health Data Statistics on  "),Icon(Icons.arrow_forward_ios)],),
          ),      SizedBox(height: 10,),         
                 Container(
                  margin: EdgeInsets.all(10),
                   height: 450,
                   child:Column(mainAxisSize: MainAxisSize.max,
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         crossAxisAlignment: CrossAxisAlignment.stretch,
                     children: [
                    
                       Expanded(child:AnimatedLineChart(lineChart,gridColor: Color(0xffB9DCFB),toolTipColor:Color(0xff3E64FF),)),
                     ],
                   ),
                  
                 ),
                 SizedBox(height: 10,),
                Center(
                   child: Row(children: [  SizedBox(width: 30,),Container(width: 20,height: 20,
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromARGB(255, 9, 148, 136),
                   ),
                   
                   ), SizedBox(width: 30,),Text("Month"),SizedBox(width: 30,),
                   Container(width: 20,height: 20,
                     decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color:
                    Color.fromARGB(255, 93, 211, 47),
                    
                
                   ),), SizedBox(width: 30,),Text("Month"),SizedBox(width: 30,),],),
                 )
               
            
          
          
        ],
      ));
      
    
  }
}