import 'package:flutter/material.dart';

import '../widgets/bottom_navigation..dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigation(
          selectedIndex: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Color(0xff3E64FF),
                    ),
                    height: 43,
                    width: 274,
                    child: Center(
                      child: Text("What we do :",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "• Improve healthcare delivery \n   with patients’ vitals data.",
                  style: TextStyle(color: Color(0xff3E64FF)),
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "images/about.png",
                  width: 270,
                  height: 166,
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "•	Monitor and manage healthcare  \n   data in a convenient manner.",
                  style: TextStyle(color: Color(0xff3E64FF)),
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "images/data.png",
                  // width: 256,
                  // height: 45,
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "•	Train and educate hospital staff \n especially nurse about  \n htechnology in healthcare delivery",
                  style: TextStyle(
                    color: Color(0xff3E64FF),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "images/check.png",
                  width: 248,
                  height: 230,
                ),
              ],
            ),
          ),
        ));
  }
}
