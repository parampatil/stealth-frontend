import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FirebaseAuthConfig {
  static void configureProvider() {
    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
      PhoneAuthProvider(),
      GoogleProvider(
        clientId: getGoogleClientId,
      ),
    ]);
  }

  // get the google client id from .env file
  static String get getGoogleClientId {
    return dotenv.env['GOOGLE_WEB_CLIENT_ID'] ?? '375632463645-3vfrv5aav4hs6v2651v7i55k7qoh11g8.apps.googleusercontent.com';
  }
}