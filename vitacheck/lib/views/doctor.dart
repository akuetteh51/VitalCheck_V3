import 'package:flutter/material.dart';

import '../widgets/bottom_navigation..dart';

class Doctor extends StatelessWidget {
  const Doctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "Welcome \n Kwame",
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
      bottomNavigationBar: BottomNavigation(
        selectedIndex: 1,
      ),
      body: Stack(children: [
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(fit: BoxFit.cover, "images/doctor_bg.png"),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        const Positioned(
          top: 60,
          left: 100,
          child: Text(
            "Your Booked \n Appointment ",
            style: TextStyle(
              color: const Color(0xFF3E64FF),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        Positioned(
          top: 180,
          left: 40,
          child: SizedBox(
            height: 36,
            width: 318,
            child: TextField(
                decoration: InputDecoration(
              hintText: "search for your favorite doctor",
              labelStyle: const TextStyle(color: Colors.black),
              suffixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              filled: false,
              fillColor: Colors.blue,
            )),
          ),
        ),
        Positioned(
          top: 260,
          left: 30.5,
          child: Container(
            width: 307,
            height: 145,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 17.0),
                  child: Image.asset("images/doct1.png"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22.0),
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
                              fontSize: 12, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Icon(Icons.phone),
                          Text(" +233 54 0000 000",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.normal)),
                        ],
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: const Color(0xFF3E64FF),
                              ),
                              width: 133,
                              height: 30,
                              child: const Center(
                                  child: Text(
                                "Book appointment",
                                style: TextStyle(color: Colors.white),
                              ))))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 450,
          left: 30.5,
          child: Container(
            width: 307,
            height: 145,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Image.asset("images/doct2.png"),
                Padding(
                  padding: const EdgeInsets.only(left: 22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Dr. Godliva Brown",
                          style: TextStyle(
                              color: const Color(0xFF3E64FF),
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      const Text("(Radiologists) ",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold)),
                      Row(
                        children: const [
                          Icon(Icons.phone),
                          Text(" +233 54 0000 000",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.normal)),
                        ],
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: const Color(0xFF3E64FF),
                              ),
                              width: 133,
                              height: 30,
                              child: const Center(
                                  child: Text(
                                "Book appointment",
                                style: TextStyle(color: Colors.white),
                              ))))
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
