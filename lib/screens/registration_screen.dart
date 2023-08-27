import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String name;

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
                textAlign: TextAlign.center,
                onChanged: (value) {
                  name = value;
                },
                decoration: kInputFieldDecoration.copyWith(
                  hintText: 'Enter Your Name',
                ),
              ),
              const SizedBox(
                height: 8.0,
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
                clr: Colors.blueAccent,
                buttonTitle: 'Register',
                onPressed: () async {
                  try{
                    final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                      if(newUser != null)
                        {
                          Navigator.pushNamed(context, ChatScreen.id);
                        }
                  }
                  catch(e){
                    print(e);
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
