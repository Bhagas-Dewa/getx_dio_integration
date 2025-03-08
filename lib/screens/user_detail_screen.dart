import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dio_integration/controllers/user_controller.dart';
import 'package:getx_dio_integration/models/user_model.dart';
import 'package:getx_dio_integration/screens/update_user_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetailScreen extends StatelessWidget {
  final int userId;
  final UserController userController = Get.find();

  UserDetailScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    // ini untuk mengecek apakah user ada di dalam `userController`
    final user = userController.users.firstWhereOrNull((u) => u.id == userId);

    return Scaffold(
      appBar: AppBar(title: const Text("User Detail")),
      body: user != null
          ? _buildUserDetail(user) // Jika user ditemukan, tampilkan detail
          : FutureBuilder<UserModel?>(
              future: userController.fetchUserDetail(userId), 
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data == null) {
                  return const Center(child: Text("User not found"));
                }
                return _buildUserDetail(snapshot.data!.data!);
              },
            ),
    );
  }

  Widget _buildUserDetail(Data user) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(user?.avatar ?? " "),
          ),
          const SizedBox(height: 16),
          Text("${user.firstName} ${user.lastName}",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(user.email, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Get.to(() => UpdateUserScreen(
                userId: user.id,
                currentName: user.firstName, 
                currentEmail: user.email, 
              ));
            },
            child: const Text("Update User"),
          ),
        ],
      ),
    );
  }
}
