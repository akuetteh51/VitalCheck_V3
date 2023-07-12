import 'package:flutter/material.dart';
import 'package:outlined_text/outlined_text.dart';
import 'package:vitacheck/views/graph.dart';

import '../pageNavigator.dart';

class sensorData extends StatelessWidget {
  final Padding positionIcon;
  final String text;
  final double sized_height;

  // final String dataIcon;
  final Color outlineColor;
  final String data;
  final Color color;
  final Color fontcolor;
  const sensorData(
      {super.key,
      required this.text,
      required this.data,
      this.sized_height = 8,
      required this.color,
      required this.fontcolor,
      required this.outlineColor,
      required this.positionIcon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          pageNavigator(ctx: context).nextPage(page: const Graph());
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(43),
            color: color,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width / 1.4,
          height: 167,
          child: Stack(children: [
            Positioned(
              top: 40,
              left: 10,
              child: SizedBox(
                width: 190,
                height: 140,
                // color: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      OutlinedText(
                          text: Text(
                            text,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: fontcolor,
                            ),
                          ),
                          strokes: [ 
                            OutlinedTextStroke(color: outlineColor, width: 3),
                          ]),
                      SizedBox(
                        height: sized_height,
                      ),
                      Expanded(
                        child: OutlinedText(
                            text: Text(
                              data,
                              style: TextStyle(
                                fontSize: 36.0,
                                fontWeight: FontWeight.bold,
                                color: fontcolor,
                              ),
                            ),
                            strokes: [
                              OutlinedTextStroke(color: outlineColor, width: 3),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: positionIcon,
            )
          ]),
        ),
      ),
    );
  }
}
