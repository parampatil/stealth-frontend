import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stealth_frontend/api/firebase_auth_config.dart';
import 'package:stealth_frontend/constants.dart';
import 'package:stealth_frontend/providers/user_auth_provider.dart';
import 'package:stealth_frontend/screens/earning_table_screen.dart';
import 'package:stealth_frontend/screens/earnings_chart_screen.dart';
import 'package:stealth_frontend/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stealth_frontend/screens/landing_screen.dart';
import 'package:stealth_frontend/screens/user_list_screen.dart';
import 'package:stealth_frontend/utilities/auth_screens.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stealth_frontend/utilities/global_navigation.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(GlobalNavigation().navigatorKey);
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // initianlize environment variables file
  await dotenv.load(fileName: ".env");

  // configure providers
  FirebaseAuthConfig.configureProvider();

  ZegoUIKit().initLog().then((value) {
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );
      runApp(MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => UserAuthProvider()),
      ], child: MyApp(navigatorKey: GlobalNavigation().navigatorKey)));
  });
}

class MyApp extends StatefulWidget  {
   final GlobalKey navigatorKey;
   const MyApp({
    required this.navigatorKey,
    Key? key,
  }) : super(key: key);

  @override
  State createState() => MyAppState();
}

class MyAppState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: GlobalNavigation().navigatorKey,
      initialRoute: Constants.landingRoute,
      routes: _buildAppRoutes(),
    );
  }

  Map<String, WidgetBuilder> _buildAppRoutes() {
    return {
      Constants.landingRoute: (context) => const LandingScreen(),
      Constants.signInRoute: (context) =>
          AuthScreens.buildSignInScreen(context),
      Constants.profileRoute: (context) =>
          AuthScreens.buildProfileScreen(context),
      Constants.homeRoute: (context) => const HomeScreen(),
      Constants.earningsChartRoute: (context) => const EarningsChartScreen(),
      Constants.earningTableRoute: (context) => const EarningsTableScreen(),
      Constants.verifyEmailRoute: (context) =>
          AuthScreens.buildEmailVerificationScreen(context),
      Constants.phoneVerificationRoute: (context) =>
          AuthScreens.buildPhoneInputScreen(context),
      Constants.smsVerificationRoute: (context) =>
          AuthScreens.buildSMSVerificationScreen(context),
          Constants.userListRoute: (context) => const UserListScreen(), // Add the new route
    };
  }
}
