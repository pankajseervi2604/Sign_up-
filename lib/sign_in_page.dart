import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // setting the controller (which will retrve the data that user enters)
  final emailData = TextEditingController();
  final passwordData = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/login_illusturation.png",
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Welcome",
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // email textfield
                    TextField(
                      // setting up the keyboardtype (you can set the keyboard according to your requirements)
                      keyboardType: TextInputType.emailAddress,
                      // assigning the controller
                      controller: emailData,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // password textfield
                    TextField(
                      // assigning the controller
                      controller: passwordData,
                      obscureText: obscureText,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          icon: obscureText
                              ? Icon(CupertinoIcons.eye_slash)
                              : Icon(CupertinoIcons.eye),
                        ),
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    // login button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        String userEmail = emailData.text.toString();
                        String userPassword = passwordData.text;
                        print("$userEmail passed");
                        print("$userPassword passed");
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
