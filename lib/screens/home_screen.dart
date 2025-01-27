import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stealth_frontend/constants.dart';
import 'package:stealth_frontend/providers/user_auth_provider.dart';
import 'package:stealth_frontend/utilities/global_navigation.dart';
import 'package:stealth_frontend/widgets/user_image_avatar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userAuthProvider = Provider.of<UserAuthProvider>(context);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
            MenuAnchor(
            builder: (context, controller, child) {
              return GestureDetector(
                onTap: () {
                  controller.open();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding here
                  child: Row(
                    children: [
                      Text(
                        userAuthProvider.userModel?.name ?? 'Guest',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      UserImageAvatar(
                        radius: 20,
                        fileImage: userAuthProvider.fileImage,
                        imageUrl: userAuthProvider.userModel?.imageUrl ?? '',
                        vieweOnly: true,
                        onPressed: () {
                          log('User Image Avatar pressed');
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            menuChildren: [
              MenuItemButton(
              onPressed: () => _onSelected(context, 0),
              child: const Text('Profile'),
              ),
              MenuItemButton(
              onPressed: () => _onSelected(context, 1),
              child: const Text('Sign Out'),
              ),
            ],
            ),
        ],
      ),
      body: const Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }

  void _onSelected(BuildContext context, int item) {
    final GlobalNavigation navigation = GlobalNavigation();
    switch (item) {
      case 0:
        navigation.navigateToReplacement(Constants.profileRoute);
        break;
      case 1:
        final userAuthProvider = Provider.of<UserAuthProvider>(context, listen: false);
        userAuthProvider.signOut().then((_) {
          log('User signed out');
          navigation.navigateToReplacement(Constants.signInRoute);
        });
        break;
    }
  }
}
