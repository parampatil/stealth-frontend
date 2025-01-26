import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stealth_frontend/providers/user_auth_provider.dart';
import 'package:stealth_frontend/widgets/user_image_avatar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Assuming userAuthProvider is available in the context
    final userAuthProvider = Provider.of<UserAuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            icon: UserImageAvatar(
              radius: 20,
              fileImage: userAuthProvider.fileImage,
              imageUrl: userAuthProvider.userModel?.imageUrl ?? '',
              vieweOnly: true,
              onPressed: () {
                // Handle profile icon press
              },
            ),
            onPressed: () {
              // Handle profile icon press
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}