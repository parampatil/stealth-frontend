import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:stealth_frontend/providers/user_auth_provider.dart';
import 'package:stealth_frontend/models/user_model.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class SelectedUser {
  final String id;
  final String name;

  SelectedUser({required this.id, required this.name});
}

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<SelectedUser> selectedUsers = [];
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final userAuthProvider =
        Provider.of<UserAuthProvider>(context, listen: false);
    final currentUserId = userAuthProvider.userModel?.uid;
    userAuthProvider.initZegoCalling();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a User to Call'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(child: Text('Error loading users'));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No users found'));
                }

                final users = snapshot.data!.docs
                    .map((doc) =>
                        UserModel.fromJson(doc.data() as Map<String, dynamic>))
                    .where((user) => user.uid != currentUserId)
                    .where((user) =>
                        user.name.toLowerCase().contains(searchQuery) ||
                        user.email.toLowerCase().contains(searchQuery))
                    .toList();

                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    final isSelected = selectedUsers
                        .any((selectedUser) => selectedUser.id == user.uid);
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: ListTile(
                        title: Text(user.name),
                        subtitle: Text(user.email),
                        trailing: IconButton(
                          icon: Icon(
                            isSelected ? Icons.person_remove : Icons.person_add,
                            color: isSelected ? Colors.red : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              if (isSelected) {
                                selectedUsers.removeWhere((selectedUser) =>
                                    selectedUser.id == user.uid);
                              } else {
                                selectedUsers.add(SelectedUser(
                                    id: user.uid, name: user.name));
                              }
                            });
                          },
                        ),
                        tileColor: isSelected ? Colors.grey[300] : null,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          if (selectedUsers.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ZegoSendCallInvitationButton(
              isVideoCall: true,
              resourceID: "zego_call",
              invitees: [
                for (var user in selectedUsers)
                ZegoUIKitUser(
                  id: user.id,
                  name: user.name,
                ),
              ],
              ),
            ),
        ],
      ),
    );
  }
}
