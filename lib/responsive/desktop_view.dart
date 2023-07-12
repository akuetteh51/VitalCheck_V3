import 'package:flutter/material.dart';

import '../widgets/drop_down.dart';


class desktopView extends StatelessWidget {
  const desktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text('App doesn\'t support Desktop view \n kindly switch to mobile view',style: TextStyle(color: Colors.white,decoration: TextDecoration.none),)),

      color: Colors.blueAccent,
    );
  }
}