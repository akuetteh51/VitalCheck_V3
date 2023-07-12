import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

import '../pageNavigator.dart';
import '../widgets/bottom_navigation..dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
      List<DateTime?> _rangeDatePickerWithActionButtonsWithValue = [
    DateTime.now(),
    // DateTime.now().add(const Duration(days: 5)),
  ];
    return Scaffold(
      appBar: AppBar(
               iconTheme: IconThemeData(color: const Color(0xFF3E64FF),),

        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white70,
        title: SizedBox(
          height: 52,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Schedule",
                style: const TextStyle(
                    color: const Color(0xFF3E64FF),
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                "appointment with your favorite\ndoctor.",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45),
              ),
            ],
          ),
        ),
        actions: [
          Image.asset("images/doc1.png"),
        ],
      ),
      bottomNavigationBar: const BottomNavigation(
        selectedIndex: 1,
      ),
      body: Column(
        children: [
          Stack(children: [
            Container(
              height: 100,
              width: 493,
              color: Colors.white24,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                // width: 493,
                height: 233,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              left: -20,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 22.0, bottom: 80),
                        child: SizedBox(
                          child: Container(
                            width: 265,
                            height: 294,
                            child: Image.asset("images/doct3.png",
                                fit: BoxFit.contain, width: 265, height: 294),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text("Dr Jason Smith",
                                  style: TextStyle(
                                      color: const Color(0xFF3E64FF),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              const Text("(Pediatrician) ",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                              Row(
                                children: const [
                                  const Icon(Icons.phone),
                                  const Text(" +233 54 0000 000",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color(0xFF3E64FF),
                                ),
                                width: 133,
                                height: 30,
                                child: Center(
                                  child: Text(
                                    "Book appointment",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ]),
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFF3E64FF),
          ),
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Stack(children: [
              Positioned
              
              (top: 20,
                left: 80,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: Offset(3, 3),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  width: 191,
                  height: 35,
                  child: Center(
                    child: Text(
                      "Schedule for the Month",
                      style: TextStyle(
                        color: const Color(0xFF3E64FF),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Positioned(
                top: 65,
                left: 90,
                child: Container(
                  width: 180,
                  height: 15,
                  color: Color(0xFFB9DCFB),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 80,
                left: 90,
                child: Container(
                  width: 180,
                  height: 165,
                  decoration: BoxDecoration(
                    color: Color(0xFFEFF7FF),
                  ),
                ),
              ),
              Positioned(
                top: 80,
                left: 90,
                child: Container(
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.all(20),
                  width: 145,
                  height: 130,
                  color:Colors.white,
                  child:  CalendarDatePicker2(
                          onValueChanged: ((value) {
                            print(value);
                          }),
                  config: CalendarDatePicker2Config(calendarType:   CalendarDatePicker2Type.single,dayTextStyle: TextStyle(fontSize: 6,color: Color(0xff3E64FF),fontWeight: FontWeight.w900),
                   disableYearPicker: true,
                  
                  weekdayLabelTextStyle: TextStyle(fontSize: 8,color: Color(0xff3E64FF),fontWeight: FontWeight.w900),
                  controlsTextStyle: TextStyle(fontSize: 0,color: Color(0xff3E64FF),fontWeight: FontWeight.w900),lastMonthIcon: Icon(size:0,Icons.arrow_back_ios_sharp,color: Color(0xff3E64FF),),
                  nextMonthIcon:  Icon(size:0,Icons.arrow_forward_ios,color: Color(0xff3E64FF),),
                  ),
                  initialValue: _rangeDatePickerWithActionButtonsWithValue 
                  ),
        
                           
                 
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
