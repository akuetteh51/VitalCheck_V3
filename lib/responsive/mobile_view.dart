import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';
import 'package:vitacheck/views/ai_chat.dart';
import '../views/data_sensor.dart';
import '../views/splash.dart';
import '../views/welcome.dart';

class mobileView extends StatelessWidget {
  const mobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}





class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return  startScreen();
  }
}

class startScreen extends StatelessWidget {
  startScreen({super.key});
  PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
 ToastContext().init(context);
    return AnimatedSplashScreen(splash: Splash(),
    
    // AnimatedSplashScreen(
    //     duration: 3000,
    //     splash: SizedBox(
    //       child: Image.asset("images/VitaCheck.png"),
    //       width: MediaQuery.of(context).size.width,
    //       height: MediaQuery.of(context).size.height,
    //     
        // nextScreen: PageView(
        //   controller: _controller,
        //   children: const [
            // Splash(),
          nextScreen:  Welcome(),
          // ],
      
        splashTransition: SplashTransition.fadeTransition,
        // backgroundColor: Colors.white
        );
  }
}
