import 'package:flutter/material.dart';
import 'package:vitacheck/widgets/bar_graph.dart';

import '../widgets/bottom_navigation..dart';

class Graph extends StatelessWidget {
  const Graph({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigation(
      //   selectedIndex: 4,
      // ),
      appBar: AppBar(
               iconTheme: IconThemeData(color: const Color(0xFF3E64FF),),

        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white70,
        title: Expanded(
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                "Statistics",
                style: TextStyle(
                  overflow: TextOverflow.clip,
                  color: const Color(0xFF3E64FF),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Image.asset("images/doc1.png"),
        ],
      ),
      body: bar(height: 50,label: 'beat',month: 'january',),
    );
  }
}
