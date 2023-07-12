import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import 'package:provider/provider.dart';
import 'package:vitacheck/pageNavigator.dart';
import 'package:vitacheck/provider/auth/auth_provider.dart';


import 'signup.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  String? _email, _password;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          leading: const BackButton(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  Image.asset(
                    "images/VitaCheck.png",
                    width: 216,
                    height: 30,
                  ),
                  const SizedBox(height: 10),
                  Image.asset(
                    "images/logo1.png",
                    width: 140,
                    height: 180,
                  ),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Stack(
                        children: [
                          Image.asset(
                            fit: BoxFit.fill,
                            "images/login.png",
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height / 1.4,
                          ),
                           Positioned(
                             top: MediaQuery.of(context).size.height*0.01,
                    left: MediaQuery.of(context).size.width*0.35,
                            child: Column(
                              children: [
                                Text(
                                  "LogIn",
                                  style: TextStyle(
                                      fontSize: 36,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 5,
                            width: 23,
                            color: Colors.white,
                          ),
                              ],
                            ),
                          ),
                          Positioned(
                            top:MediaQuery.of(context).size.height*0.1,
                            left: 80,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 270,
                                  width: 250,
                                  child: Form(
                                    key: _formKey,
                                    autovalidateMode: _autovalidateMode,
                                    child: ListView(
                                      shrinkWrap: true,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          autofocus: false,
                                          decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              contentPadding: EdgeInsets.all(8),
                                              fillColor: Colors.white,
                                              filled: true,
                                              hintText: "Email",
                                              suffixIcon: Icon(Icons.mail),
                                              errorStyle: TextStyle(
                                                  color: Colors.white)),
                                          validator: (String? value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'Email required';
                                            }
                                            if (!isEmail(value.trim())) {
                                              return 'Enter a valid Email';
                                            }
                                            return null;
                                          },
                                          onSaved: (String? value) {
                                            _email = value;
                                          },
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                            border: const OutlineInputBorder(),
                                            contentPadding:
                                                const EdgeInsets.all(8),
                                            fillColor: Colors.white,
                                            filled: true,
                                            hintText: "Password",
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  _obscureText = !_obscureText;
                                                });
                                              },
                                              icon: _obscureText
                                                  ? const Icon(
                                                      Icons.visibility_off)
                                                  : const Icon(
                                                      Icons.visibility),
                                            ),
                                            errorStyle: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          obscureText: _obscureText,
                                          validator: (String? value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'Password required';
                                            }
                                            if (value.trim().length < 6) {
                                              return 'Password must be at least 6 characteers long';
                                            }
                                            return null;
                                          },
                                          onSaved: (String? value) {
                                            _password = value;
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          "Forgot Password ? ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),SizedBox(height: 50,),
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    width: 257,
                                    height: 60,
                                    child: Consumer<Authentication>(
                                      builder: (context, auth, child) {
                                        return TextButton(
                                            child: Text(
                                              auth.isloading == true
                                                  ? "loading...."
                                                  : "Login",
                                              style: const TextStyle(
                                                fontSize: 24,
                                                color: Color(0xff3E64FF),
                                              ),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _autovalidateMode =
                                                    AutovalidateMode.always;
                                              });
                                              final form =
                                                  _formKey.currentState;
                                              if (form == null ||
                                                  !form.validate()) return;
                                              form.save();

                                              auth.loginUser(
                                                  email: _email!.trim(),
                                                  password: _password!.trim(),
                                                  context: context
                                                  );
                                           
                                            });
                                      },
                                    )),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    pageNavigator(ctx: context)
                                        .nextPage(page: const SignUp());
                                  },
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Don’t have an account? ",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          pageNavigator(ctx: context)
                                              .nextPage(page: const SignUp());
                                        },
                                        child: const Text(
                                          "SignUp",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 1034,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
