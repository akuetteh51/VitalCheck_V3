import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';
import 'package:vitacheck/pageNavigator.dart';
import '../provider/auth/auth_provider.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  final AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  String? _name, _email, _password;
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
          body: SafeArea(
            child: Stack(children: [
              Image.asset(
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  "images/auth.png"),
              const SizedBox(height: 20),
              Positioned(
                left: MediaQuery.of(context).size.width / 5.5,
                child: Image.asset(
                  "images/VitaCheck.png",
                  width: 216,
                  height: 30,
                ),
              ),
              const SizedBox(height: 10),
              Positioned(
                left: 110,
                child: Image.asset(
                  "images/logo1.png",
                  width: 140,
                  height: 180,
                ),
              ),
              const SizedBox(
                height: 90,
              ),
              Stack(
                children: [
                  Positioned(
                    top: MediaQuery.of(context).size.height*0.32,
                    left: MediaQuery.of(context).size.width*0.34,
                    child: Center(
                      child: Column(
                        children: [
                          const Text(
                            "SignUp",
                            style: TextStyle(
                                fontSize: 36,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 5,
                            width: 23,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height*0.42,
                    left:MediaQuery.of(context).size.width*0.18,
                    bottom: 0,
                  
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: 370,
                        width: 250,
                        child: Form(
                          key: _formKey,
                          autovalidateMode: _autovalidateMode,
                          child: ListView(shrinkWrap: true, children: [
                            TextFormField(
                              autocorrect: false,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                border: OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Your Full name",
                                errorStyle: TextStyle(color: Colors.white),
                                suffixIcon: Icon(Icons.person_outlined),
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              validator: (String? value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Name required';
                                }
                                if (value.trim().length < 2) {
                                  return 'Name  must be at least 2 characters long';
                                }
                                return null;
                              },
                              onSaved: (String? value) {
                                _name = value;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                border: OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Email",
                                errorStyle: TextStyle(color: Colors.white),
                                suffixIcon: Icon(Icons.mail),
                                labelStyle: TextStyle(color: Colors.black),
                              ),
                              validator: (String? value) {
                                if (value == null || value.trim().isEmpty) {
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
                              controller: _passwordController,
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(8),
                                border: const OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Password",
                                errorStyle:
                                    const TextStyle(color: Colors.white),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    icon: _obscureText
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.visibility)),
                                labelStyle: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              validator: (String? value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Password required';
                                }
                                if (value.trim().length < 6) {
                                  return 'Enter a valid password';
                                }
                                return null;
                              },
                              onSaved: (String? value) {
                                _password = value;
                              },
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              width: 257,
                              height: 50,
                              child: Consumer<Authentication>(
                                builder: (context, auth, child) {
                                  return TextButton(
                                      child: Text(
                                        auth.isloading == true
                                            ? "loading...."
                                            : "Create Account",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Color(0xff3E64FF),
                                        ),
                                      ),
                                      onPressed: () {
                                        final form = _formKey.currentState;
                                        if (form == null || !form.validate()) {
                                          return;
                                        }
                                        form.save();

                                        auth.signup(
                                            name: _name!.trim(),
                                            email: _email!.trim(),
                                            password: _password!.trim(),
                                            
                                            context: context,
                                            );
                                  
                                      });
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Already have an account ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                TextButton(
                                    onPressed: (() {
                                      pageNavigator(ctx: context)
                                          .nextPage(page: LogIn());
                                    }),
                                    child: const Text(
                                      "SignIn",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          )),
    );
  }
}
