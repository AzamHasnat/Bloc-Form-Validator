import 'package:bloc_form_validation/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
                  children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: CupertinoButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SigninScreen()));
                },
                color: Colors.blue,
                child: Text('Sign In with Email'),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              child: CupertinoButton(
                onPressed: () {
                },
                color: Colors.blue,
                child: Text('Sign In with Google'),
              ),
            ),
                  ],
                ),
          )),
    );
  }
}
