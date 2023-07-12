import 'package:flutter/material.dart';
import 'package:vitacheck/views/doctor_prof.dart';

import '../pageNavigator.dart';
import '../widgets/bottom_navigation..dart';
import 'about.dart';
import 'data_sensor.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(
        selectedIndex: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "welcome to",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff3E64FF),
                ),
              ),
              Image.asset("images/VitaCheck.png"),
              Image.asset("images/logo2.png"),
              Text(
                "What you want \n to do today ?",
                style: TextStyle(fontSize: 24),
              ),
              TextButton(
                  onPressed: () {},
                  child: GestureDetector(
                    onTap: (){

                    pageNavigator(ctx: context).nextPage(page: SensorHome());
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            )
                          ],
                        ),
                        height: 60,
                        width: 257,
                        child: Center(
                          child: Text(
                            "Check Vitals",
                            style:
                                TextStyle(color: Color(0xff3E64FF), fontSize: 24),
                          ),
                        )),
                  )),
              Text(
                "OR",
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff3E64FF),
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector( onTap: (){

                    pageNavigator(ctx: context).nextPage(page: DoctorProfile());
                    },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  height: 60,
                  width: 257,
                  child: Center(
                    child: Text(
                      "Book appointment",
                      style: TextStyle(color: Color(0xff3E64FF), fontSize: 24),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                   pageNavigator(ctx: context).nextPage(page:About()  );
                 
                },
                child: Text(
                  "Read more about us ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff3E64FF),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
