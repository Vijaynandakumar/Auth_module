import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_sign_up/helper/utilWidgets.dart';
import 'package:sign_in_sign_up/helper/fireBaseAuthUtils.dart';
import 'package:sign_in_sign_up/screens/signIn.dart';
import 'package:sign_in_sign_up/screens/signUp.dart';

class LandingPage extends StatefulWidget {
  final User user;

  LandingPage(this.user);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.user.displayName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            buildButton(
                () => {
                      signOut().whenComplete(() {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => SignIn()));
                      })
                    },
                "Sign out",
                25.0)
          ],
        ),
      ),
    );
  }
}
