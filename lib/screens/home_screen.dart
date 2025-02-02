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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          MenuAnchor(
            builder: (context, controller, child) {
              return GestureDetector(
                onTap: () => controller.open(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Text(
                        userAuthProvider.userModel?.name ?? 'Guest',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 8),
                      UserImageAvatar(
                        radius: 20,
                        fileImage: userAuthProvider.fileImage,
                        imageUrl: userAuthProvider.userModel?.imageUrl ?? '',
                        vieweOnly: true,
                        onPressed: () => log('User Image Avatar pressed'),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Logo and App Name
            Container(
              height: size.height * 0.3,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.network(
                      'https://static.thenounproject.com/png/1332258-200.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Stealth App',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                  ),
                ],
              ),
            ),

            // Action Buttons
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildActionCard(
                    context,
                    'Earnings Chart',
                    'View your earnings in an interactive chart',
                    Icons.show_chart,
                    () => Navigator.pushNamed(
                        context, Constants.earningsChartRoute),
                  ),
                  const SizedBox(height: 16),
                  _buildActionCard(
                    context,
                    'Earnings Table',
                    'View detailed earnings in tabular format',
                    Icons.table_chart,
                    () => Navigator.pushNamed(
                        context, Constants.earningTableRoute),
                  ),
                  const SizedBox(height: 16),
                  _buildActionCard(context, 'Video Call',
                      'Connect with other people', Icons.video_call, 
                      () => Navigator.pushNamed(context, Constants.userListRoute)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(BuildContext context, String title, String subtitle,
      IconData icon, VoidCallback onTap) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSelected(BuildContext context, int item) {
    final GlobalNavigation _navigation = GlobalNavigation();
    switch (item) {
      case 0:
        _navigation.navigateTo(Constants.profileRoute);
        break;
      case 1:
        final userAuthProvider =
            Provider.of<UserAuthProvider>(context, listen: false);
        userAuthProvider.signOut().then((_) {
          log('User signed out');
          _navigation.navigateToReplacement(Constants.signInRoute);
        });
        break;
    }
  }
}
