import 'package:flutter/material.dart';
import 'package:sign_in_sign_up/screens/signIn.dart';
import 'package:sign_in_sign_up/screens/signUp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(),
      routes: {
        SignIn.id: (context) => SignIn(),
        SignUp.id: (context) => SignUp(),
      },
    );
  }
}