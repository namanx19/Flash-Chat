import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 200.0,
              child: Image.asset('images/logo.png'),
            ),
            const SizedBox(
              height: 48.0,
            ),
            Container(
              child: Center(
                child: TextField(
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  // style: const TextStyle(  // Add this line to set the input text color
                  //   color: Colors.black,
                  // ),
                  decoration: kInputFieldDecoration.copyWith(
                    hintText: 'Enter Your Email',
                  ),
                  textAlign: TextAlign.center, // Center aligns the hint text
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              // style: const TextStyle(  // Add this line to set the input text color
              //   color: Colors.black,
              // ),
              decoration: kInputFieldDecoration.copyWith(
                hintText: 'Enter Your Password',
              ),
              textAlign: TextAlign.center, // Center aligns the hint text
            ),
            const SizedBox(
              height: 24.0,
            ),
            RoundedButtons(
              clr: Colors.lightBlueAccent,
              buttonTitle: 'Log In',
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}


