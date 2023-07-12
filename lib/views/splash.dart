import 'package:flutter/material.dart';
import 'package:vitacheck/provider/Database/db_provider.dart';
import 'package:vitacheck/views/welcome.dart';
import '../pageNavigator.dart';
import 'homeLogin.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10,
              ),
              Image.asset(
                "images/VitaCheck.png",
                width: 216,
                height: 19,
              ),
              Image.asset(
                "images/logo3.png",
                width: 241,
                height: 256,
              ),
              Image.asset(
                "images/splash.png",

                //
                width: 269,
                height: 269,
              ),
              Image.asset(
                "images/add.png",
                width: 27,
                height: 39,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Sign in",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "OR",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Create account",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigate() {
    Future.delayed(const Duration(seconds: 3), () {
      DatabaseProvider().getToken().then((value) {
        if (value == '') {
          pageNavigator(ctx: context).nextPageOnly(page: Home());
        } else {
          pageNavigator(ctx: context).nextPageOnly(page: Welcome());
        }
      });
    });
  }
}
