import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sign_in_sign_up/helper/utilWidgets.dart';

class SignUp extends StatefulWidget {
  static final id = "SignInScreen";

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [
                      0.1,
                      0.4,
                      0.7,
                      0.9
                    ]),
              )),
          Container(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  // _buildEmailTF(),
                  buildTF(
                      'User name',
                      "Enter user name",
                      Icons.account_circle_sharp,
                      false,
                      TextInputType.emailAddress),
                  SizedBox(height: 10.0),
                  buildTF('Email', "Enter email address", Icons.email, false,
                      TextInputType.emailAddress),
                  SizedBox(height: 10.0),
                  buildTF('Password', "Enter password", Icons.lock, true, null),
                  buildButton(() => {print('Login btn pressed')}, 'Sign Up', 25.0),
                  buildButton(() => {print('Login btn pressed'),
                  Navigator.pop(context)}, 'Back to Sign In', 0.0),
                ],
              ),
            ),
          )
        ]),
      ),
    ));
  }
}
