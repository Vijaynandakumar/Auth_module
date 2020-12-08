import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sign_in_sign_up/helper/fireBaseAuthUtils.dart';
import 'package:sign_in_sign_up/helper/styleWidgets.dart';
import 'package:sign_in_sign_up/screens/signUp.dart';
import 'package:sign_in_sign_up/helper/utilWidgets.dart';

class SignIn extends StatefulWidget {
  static final id = "SignInScreen";

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailTextEditingController =
      new TextEditingController();
  final TextEditingController passwordTextEditingController =
      new TextEditingController();
  bool _rememberMe = false;

  Widget _buildFP() {
    return Container(
        alignment: Alignment.centerRight,
        child: FlatButton(
          onPressed: () => {print('Forgot password  pressed')},
          padding: EdgeInsets.only(right: 0.0),
          child: Text(
            'Forgot Password',
            style: labelUnderlineTextStyle,
          ),
        ));
  }

  Widget _buildRM() {
    return Container(
      height: 20.0,
      child: Row(
        children: [
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: labelTextStyle,
          )
        ],
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: [
        Text(
          "---- OR ----",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'OpenSans',
              color: Colors.white),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign in with',
          style: labelTextStyle,
        )
      ],
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        _buildSocialBtn(() => {print('Logging in with facebook')},
            AssetImage('assets/logos/facebook.jpg')),
        _buildSocialBtn(() => {print('Logging in with google')},
            AssetImage('assets/logos/google.jpg')),
      ]),
    );
  }

  Widget _buildSignUp() {
    return GestureDetector(
      onTap: () =>
          {print('Signup pressed'), Navigator.pushNamed(context, SignUp.id)},
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'Don\'t have an account? ',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0)),
          TextSpan(
            text: 'Sign up',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
        ]),
      ),
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            image: DecorationImage(
              image: logo,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
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
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign In',
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
                      buildTextFormField(
                          'Email',
                          "Enter email address",
                          Icons.email,
                          false,
                          TextInputType.emailAddress, (value) {
                        if (value.isEmpty) {
                          return "Please enter some text";
                        }
                      }, emailTextEditingController),
                      SizedBox(height: 10.0),
                      buildTextFormField(
                          'Password', "Enter password", Icons.lock, true, null,
                          (value) {
                        if (value.isEmpty) {
                          return "Please enter some text";
                        }
                      }, passwordTextEditingController),
                      _buildFP(),
                      _buildRM(),
                      buildButton(
                          () => {
                                print('Login btn pressed'),
                                if (_formKey.currentState.validate())
                                  {
                                    signUserWithEmailPassword(
                                        emailTextEditingController.text,
                                        passwordTextEditingController.text,
                                        context)
                                  }
                              },
                          'Sign In',
                          25.0),
                      _buildSignInWithText(),
                      _buildSocialBtnRow(),
                      _buildSignUp(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
