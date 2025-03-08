import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dio_integration/screens/user_detail_screen.dart';
import 'package:getx_dio_integration/controllers/user_controller.dart';
import 'package:getx_dio_integration/screens/create_user_screen.dart';
import 'package:getx_dio_integration/controllers/delete_controller.dart';


class UserListScreen extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  final DeleteController deleteController = Get.put(DeleteController());

  UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User List')),
      body: Obx(() {
        if (userController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (userController.users.isEmpty) {
          return const Center(child: Text("No users found"));
        }
        return ListView.builder(
          itemCount: userController.users.length,
          itemBuilder: (context, index) {
            final user = userController.users[index]; 

            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user?.avatar ?? " "), 
              ),
              title: Text("${user.firstName} ${user.lastName}"), 
              subtitle: Text(user.email), 
              onTap: () {
                Get.to(() => UserDetailScreen(userId: user.id));
              },
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                   deleteController.deleteUser(user.id);
                },
              ),

            );
          },
        );
      }), 
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Get.to(() => CreateUserScreen());
          userController.users.refresh(); 
        },
        child: const Icon(Icons.add),
      ),

      
    );
  }
}
