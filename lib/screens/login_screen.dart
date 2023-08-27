import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: SizedBox(
                  height: 160.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              const SizedBox(
                height: 36.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kInputFieldDecoration.copyWith(
                  hintText: 'Enter Your Email',
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kInputFieldDecoration.copyWith(
                  hintText: 'Enter Your Password',
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              RoundedButtons(
                clr: Colors.lightBlueAccent,
                buttonTitle: 'Log In',
                onPressed: () async {
                  final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                  try{
                    if(user != null)
                      {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                  }
                  catch(e)
                  {
                    print (e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


