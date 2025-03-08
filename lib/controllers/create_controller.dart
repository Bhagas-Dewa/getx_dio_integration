import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:getx_dio_integration/controllers/user_controller.dart';
import 'package:getx_dio_integration/models/user_model.dart';

class CreateController extends GetxController {
  var isLoading = false.obs;
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://reqres.in/api"));

  Future<void> createUser(String name, String job, String email) async {
    try {
      isLoading(true);

      var response = await _dio.post(
        '/users',
        data: {"name": name, "job": job, "email": email},
      );

      if (response.statusCode == 201) {
        int newId = DateTime.now().millisecondsSinceEpoch;
        Get.snackbar("Success", "User created successfully");

        if (Get.isRegistered<UserController>()) {
          final userController = Get.find<UserController>();

          var newUser = Data(
            id: newId,
            email: email,
            firstName: name,
            lastName: "",
            avatar: "https://via.placeholder.com/150",
          );

          userController.users.add(newUser); // Tambah user baru ke list
          // userController.fetchUsers();
        }

        Get.back();
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to create user: $e");
    } finally {
      isLoading(false);
    }
  }
}
