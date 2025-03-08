import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:getx_dio_integration/controllers/user_controller.dart';
import 'package:getx_dio_integration/models/user_model.dart';

class UpdateController extends GetxController {
  var isLoading = false.obs;

  Future<void> updateUser(int id, String name, String email, String job) async {
    try {
      isLoading(true);
      var response = await Dio().put(
        'https://reqres.in/api/users/$id',
        data: {
          "name": name,
          "email": email,
          "job": job,
        },
      );

      if (response.statusCode == 200) {
        var updatedUser = Data(
          id: id,
          email: email,
          firstName: name,
          lastName: "",
          avatar: "https://via.placeholder.com/150",
        );

        // Update user di UserController
        final userController = Get.find<UserController>();
        int index = userController.users.indexWhere((user) => user.id == id);
        if (index != -1) {
          userController.users[index] = updatedUser;
          userController.users.refresh();
        }

        Get.back(); // Kembali ke layar sebelumnya
        Get.snackbar("Success", "User updated successfully");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to update user");
    } finally {
      isLoading(false);
    }
  }
}
