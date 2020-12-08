import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_sign_up/screens/landingPage.dart';

Future<void> regiterUser(final String userName, final String email,
    final String password, final BuildContext context) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  try {
    final User user = (await auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != null) {
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
    }

    await user.updateProfile(displayName: userName);
    final curUser = auth.currentUser;
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return LandingPage(curUser);
    }));
  } catch (e) {
    print("Exception while registering with email and password");
    print(e);
  }
}

Future<void> signUserWithEmailPassword(final String email,
    final String password, final BuildContext context) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  try {
    final User user = (await auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != null) {
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
    }

    final curUser = auth.currentUser;
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return LandingPage(curUser);
    }));
  } catch (e) {
    print("Exception while sign in using email and password" + e);
  }
}

Future signOut() async {
  try {
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
  } catch (e) {
    print(e);
  }
}
