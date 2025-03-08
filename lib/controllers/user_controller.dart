import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:getx_dio_integration/models/user_model.dart';

class UserController extends GetxController {
  var users = <Data>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      var response = await Dio().get('https://reqres.in/api/users');
      if (response.statusCode == 200) {
        var userList = (response.data['data'] as List)
            .map((user) => Data.fromJson(user))
            .toList();
        users.assignAll(userList);
      }
    } catch (e) {
      print("Error fetching users: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<UserModel?> fetchUserDetail(int userId) async {
    try {
      var response = await Dio().get('https://reqres.in/api/users/$userId');
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error fetching user detail: $e");
    }
    return null;
  }
}
