import 'package:flutter/material.dart';
import 'package:vitacheck/pageNavigator.dart';
import 'package:vitacheck/views/login.dart';
import 'package:vitacheck/views/signup.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
            
              Text(
                "Welcome to",
                style: TextStyle(
                    color: Color(0xff3E64FF),
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 20),
              Image.asset(
                "images/VitaCheck.png",
                width: 216,
                height: 30,
              ),
              SizedBox(height: 10),
              Image.asset(
                "images/logo1.png",
                width: 140,
                height: 180,
              ),
              SizedBox(height: 40),
               GestureDetector(
                onTap: () {
                  pageNavigator(ctx: context).nextPage(page: SignUp());
                },
                child: Container(
                  width: 257,
                  height: 60,
                  color: Color(0xff3E64FF),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
          
                     GestureDetector(
                        onTap: (() {
                          pageNavigator(ctx: context).nextPage(page: LogIn());
                        }),
                
                child: Container(
                  width: 257,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(
                        color: Colors.black45,
                        width: 2,
                      )),
                  child: Center(
                      
                        child: Text(
                          "Log In",
                          style: TextStyle(
                              color: Color(0xff3E64FF),
                              fontSize: 24,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                
              
              // SizedBox(height: 25),
              // IconButton(
              //   onPressed: () {
              //     pageNavigator(ctx: context)
              //         .nextPageOnly(page: const Welcome());
              //   },
              //   icon: Image.asset("images/google2.png"),
              // ),
              SizedBox(height: 25),
              Text("Login using your Google account ?"),
            ],
          ),
        ),
      ),
    );
  }
}
// 