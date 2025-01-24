import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:stealth_frontend/api/firebase_auth_config.dart';
import 'package:stealth_frontend/constants.dart';
import 'package:stealth_frontend/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stealth_frontend/utilities/auth_screens.dart';
import 'firebase_options.dart';

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Configure FirebaseUI Auth providers
  FirebaseAuthConfig.configureProvider();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Constants.signInRoute,
      routes: _buildAppRoutes(),
    );
  }

  Map<String, WidgetBuilder> _buildAppRoutes() {
    return {
      Constants.signInRoute: (context) => AuthScreens.buildSignInScreen(context),
      Constants.profileRoute: (context) => const ProfileScreen(),
      Constants.homeRoute: (context) => const HomeScreen(),
      Constants.verifyEmailRoute: (context) => AuthScreens.buildEmailVerificationScreen(context),
    };
  }
}
