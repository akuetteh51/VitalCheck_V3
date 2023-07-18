import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_navigation..dart';


class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    List<DateTime?> _rangeDatePickerWithActionButtonsWithValue = [
    DateTime.now(),
    // DateTime.now().add(const Duration(days: 5)),
  ];
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(       iconTheme: IconThemeData(color: const Color(0xFF3E64FF),),

          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                "images/doctor2.png",
              ),
            )
          ],
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          title: Expanded(
              child: Image.asset(
            "images/VitaCheck.png",
            width: 216,
            height: 19,
          )),
        ),
        bottomNavigationBar: BottomNavigation(
          selectedIndex: 2,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ]),
              width: 247,
              height: 47,
              child: TextButton(
                child: Text("CALENDAR"),
                onPressed: () {},
              ),
            ),SizedBox(height: 150,)
        ,Container(
          height: 250,
          width: double.infinity,
          //  color:Colors.blueGrey,
          margin: EdgeInsets.all(20),
        child:   
        CalendarDatePicker2(
          onValueChanged: ((value) {
            print(value);
          }),
  config: CalendarDatePicker2Config(dayTextStyle: TextStyle(color: Color(0xff3E64FF),fontWeight: FontWeight.w900),
  
  weekdayLabelTextStyle: TextStyle(color: Color(0xff3E64FF),fontWeight: FontWeight.w900),
  controlsTextStyle: TextStyle(color: Color(0xff3E64FF),fontWeight: FontWeight.w900),lastMonthIcon: Icon(Icons.arrow_back_ios_sharp,color: Color(0xff3E64FF),),
nextMonthIcon:  Icon(Icons.arrow_forward_ios,color: Color(0xff3E64FF),),
  ),
  initialValue: _rangeDatePickerWithActionButtonsWithValue 
),
        
        ),
          ],
        ));
  }
}
