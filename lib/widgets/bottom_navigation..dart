import 'package:flutter/material.dart';
import 'package:vitacheck/views/about.dart';
import 'package:vitacheck/views/calendar.dart';
import 'package:vitacheck/views/data_sensor.dart';
import 'package:vitacheck/views/doctor.dart';
import 'package:vitacheck/views/loading.dart';
import '../pageNavigator.dart';
import '../views/ai_chat.dart';

class BottomNavigation extends StatefulWidget {
  final int selectedIndex;
  const BottomNavigation({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List<IconData> data = [
    Icons.home,
    Icons.person,
    Icons.calendar_month,
    Icons.chat,
    Icons.heart_broken_sharp,
  ];
  final _pages = [About(), Doctor(), Calendar(), aichat(), SensorHome()];
  @override
  Widget build(BuildContext context) {
    print(widget.selectedIndex);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(25),
        color: const Color(0xff3E64FF),
        child: Container(
          margin: EdgeInsets.only(left: 20, top:10, right: 20, bottom:10),

            height: 48,
            width: double.infinity ,
            child: ListView.builder(
              itemCount: data.length,
              padding: const EdgeInsets.symmetric(horizontal: 1),
              itemBuilder: (ctx, i) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: GestureDetector(
                  onTap: () {
                    try{

                      pageNavigator(ctx: context).nextPage(page: _pages[i]);
                    }catch (e) {
      print(e);
Container(child:splashPage(),width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,);
   pageNavigator(ctx: context).nextPage(page:splashPage());

       
    }
                    
                  },
                  child: (AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: 50,
            
                    
                    decoration: BoxDecoration(
                      border: i == widget.selectedIndex
                          ? const Border(
                              top: BorderSide(width: 5.0, color: Colors.white),
                            )
                          : null,
                      // color: i == selectedIndex ? Colors.white : null,
                    ),
                    child: Center(
                      child: Icon(
                        data[i],
                        size: 24,
                        color: i == widget.selectedIndex
                            ? Colors.white
                            : Colors.grey.shade800,
                      ),
                    ),
                  )),
                ),
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
      
    );
  }
}
