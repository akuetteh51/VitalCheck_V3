// import 'package:flutter/material.dart';

// import '../provider/Database/db_provider.dart';

// class DropDown extends StatelessWidget {

//   DropDown({super.key});

//   @override
//   Widget build(BuildContext context) {
//         return Drawer(
//     child: ListView(
//       padding: EdgeInsets.zero,
//       children: const <Widget>[
      
//         ListTile(
//           leading: Icon(Icons.account_circle),
//           title: Text('Profile'),
//         ),
//         ListTile(
//           leading: Icon(Icons.settings),
//           title: Text('Settings'),
//         ),
//         ListTile(
//           leading: const Icon(Icons.exit_to_app),
//           title:const  Text('Sign OUT'),
//           onTap:(){
//              DatabaseProvider().logOut(context);
//           }
//           //   //
//           // },
//         ),
//       ],
//     ),
//   );
//   }
// }