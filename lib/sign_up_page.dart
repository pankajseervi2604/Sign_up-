import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice_1/sign_in_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignUpPage> {
  // firebase auth connecting
  void createUserNameAndPassword() async {
    try {
      final userLogData =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailData.text.trim(),
        password: passwordData.text.trim(),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("please fill the required fields first !!!"),
        ),
      );
    }
  }

  // setting the controller (which will retrve the data that user enters)
  final emailData = TextEditingController();
  final passwordData = TextEditingController();
  // changing the state of visibility of password
  bool obscureText = true;
  // password error would be known
  String? passwordError;

  // the value will be provided by onchange property
  void validatePassword(String value) {
    setState(() {
      passwordError = value.length <= 6
          ? "Password must be at least 6 characters :("
          : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
              ),
              Text(
                "Sign Up",
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
                      //setting up and conditions for user
                      onChanged: validatePassword,
                    ),
                    if (passwordError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            passwordError!,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
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
                        // setting the constraints for login button
                        if (passwordError == null &&
                            passwordData.text.isNotEmpty) {
                          createUserNameAndPassword();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SignInPage(),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Create account",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
