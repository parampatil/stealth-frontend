import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:stealth_frontend/constants.dart';
import 'package:stealth_frontend/utilities/global_widgets.dart';

class AuthScreens {

  // Build sign in screen
  static Widget buildSignInScreen(BuildContext) {
    return SignInScreen(
      providers: FirebaseUIAuth.providersFor(FirebaseAuth.instance.app),
      actions: [
        _handleUserCreation(),
        _handleSignIn(),
      ],
    );
  }

  // build email verification screen
  static Widget buildEmailVerificationScreen(BuildContext context) {
    return EmailVerificationScreen(
      actions: [
        EmailVerifiedAction(() {
          Navigator.pushReplacementNamed(context, Constants.profileRoute);
        }),

        AuthCancelledAction((context) {
          FirebaseUIAuth.signOut(context: context);
          Navigator.pushReplacementNamed(context, Constants.signInRoute);
        })      
      ],
    );
  }

  // Handle user creation
  static AuthStateChangeAction<UserCreated> _handleUserCreation() {
    return AuthStateChangeAction<UserCreated>((context, state) {
      // navigate back to sign in screen
      Navigator.pushReplacementNamed(context, Constants.signInRoute);

      // show snackbar
      GlobalWidgets(context).showSnackBar(
        content: 'User created successfully!',
        backgroundColor: Colors.green,
      );
    });
  }

  // Handle sign in
  static AuthStateChangeAction<SignedIn> _handleSignIn() {
    return AuthStateChangeAction<SignedIn>((context, state) {
      if (!state.user!.emailVerified) {
        log('user email not verified');
        Navigator.pushReplacementNamed(context, Constants.verifyEmailRoute);
      } else {
        log('user email verified');
        // show snackbar
        GlobalWidgets(context).showSnackBar(
          content: 'Signed in successfully!',
          backgroundColor: Colors.green,
        );
        
        // todo: handle firebase check - check if user exist in firebase
      }
    });
  }
}
