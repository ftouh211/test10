import 'package:flutter/material.dart';
import 'package:untitled2/Home_screen.dart';
import 'package:untitled2/firebase_function.dart';
import 'package:untitled2/sign_up.dart';


class LoginScreen extends StatefulWidget {
  static const String routeName = "login";
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.tealAccent,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(30.0),
            child: Container(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text("Log in !", style: TextStyle(fontSize: 35)),
                    SizedBox(height: 40),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.black),
                        // prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      obscureText: !isPasswordVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.black),
                        // prefixIcon: Icon(Icons.lock),
                        // suffixIcon: IconButton(
                        //   icon: Icon(
                        //     isPasswordVisible
                        //         ? Icons.visibility
                        //         : Icons.visibility_off,
                        //   ),
                        //   onPressed: () {
                        //     setState(() {
                        //       isPasswordVisible = !isPasswordVisible;
                        //     });
                        //   },
                        // ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () async {
                          if (formKey.currentState?.validate() ?? false) {
                            bool success = await FirebaseFunctions.login(
                              emailController.text,
                              passwordController.text,
                            );
                            if (success) {
                              Navigator.pushNamed(context, HomeScreen.routeName);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Login failed.')),
                              );
                            }
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text("Don't have an account? ", style: TextStyle(color: Colors.black, fontSize: 20)),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignUp.routeName);
                      },
                      child: Text("Sign UP", style: TextStyle(color: Colors.blue, fontSize: 15)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}