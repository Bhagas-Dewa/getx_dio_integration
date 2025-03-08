import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:getx_dio_integration/controllers/user_controller.dart';

class DeleteController extends GetxController {
  var isLoading = false.obs;

  Future<void> deleteUser(int id) async {
    try {
      isLoading(true);
      var response = await Dio().delete('https://reqres.in/api/users/$id');

      if (response.statusCode == 204) { // 204: No Content (berarti sukses dihapus)
        final userController = Get.find<UserController>();
        userController.users.removeWhere((user) => user.id == id);
        userController.users.refresh();

        Get.snackbar("Success", "User deleted successfully");
      } else {
        Get.snackbar("Error", "Failed to delete user");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to delete user");
    } finally {
      isLoading(false);
    }
  }
}
