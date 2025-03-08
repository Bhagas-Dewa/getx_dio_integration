import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dio_integration/controllers/create_controller.dart';

class CreateUserScreen extends StatelessWidget {
  final CreateController createController = Get.put(CreateController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  CreateUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create User")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: jobController,
              decoration: const InputDecoration(labelText: "Job"),
            ),
            TextField(
              controller: emailController, 
              decoration: const InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,

            ),
            
            const SizedBox(height: 20),
            Obx(() => ElevatedButton(
                  onPressed: createController.isLoading.value
                      ? null
                      : () {
                          createController.createUser(
                            nameController.text,
                            jobController.text,
                            emailController.text,
                          );
                        },
                  child: createController.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text("Create"),
                )),
          ],
        ),
      ),
    );
  }
}
