import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dio_integration/controllers/update_controller.dart';

class UpdateUserScreen extends StatelessWidget {
  final int userId;
  final String currentName;
  final String currentEmail;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final UpdateController updateController = Get.put(UpdateController());

  UpdateUserScreen({
    super.key,
    required this.userId,
    required this.currentName,
    required this.currentEmail,
  }) {
    nameController.text = currentName;
    emailController.text = currentEmail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update User")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: jobController,
              decoration: const InputDecoration(labelText: "Job"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                updateController.updateUser(
                  userId,
                  nameController.text,
                  emailController.text,
                  jobController.text,
                );
              },
              child: const Text("Update User"),
            ),
          ],
        ),
      ),
    );
  }
}
