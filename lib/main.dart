import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitacheck/provider/Database/db_provider.dart';
import 'package:vitacheck/provider/dark_theme_provider.dart';
import 'package:vitacheck/provider/sensor_provider.dart';
import 'package:vitacheck/provider/auth/auth_provider.dart';
import 'package:vitacheck/responsive/Responsive.dart';
import 'package:vitacheck/responsive/desktop_view.dart';
import 'package:vitacheck/responsive/mobile_view.dart';
import 'package:vitacheck/theme_data.dart';

import 'provider/messaging_provider.dart';


void main() async {
  DarkThemeProvider darktheme = DarkThemeProvider();
  return runApp(
    MyApp()
    );
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Authentication()),
        ChangeNotifierProvider(create: (_) => DatabaseProvider()),
        ChangeNotifierProvider(create: (_) => SensorDataApi()),
        ChangeNotifierProvider(create: (_) => MessagingDataApi()),
        ChangeNotifierProvider(create: (_) =>ReplyDataApi()),
        
        StreamProvider<Map>(
            create: (_) => SensorDataApi().initStream(), initialData: {}),
         
        StreamProvider<Map>(
            create: (_) => MessagingDataApi().initChat(), initialData: {}),
            ChangeNotifierProvider<DarkThemeProvider>(
              create: (context) =>DarkThemeProvider() ,
            )
      ],
      child: Consumer<DarkThemeProvider
      >(builder: (context,darktheme,child){

    return  MaterialApp(
      theme: Styles.themeData(darktheme.darktheme,context ),
          debugShowCheckedModeBanner: false,
          home: responsive(Mobile: mobileView(),Desktop: desktopView(),),
        );
      },
      ),);
  }
}