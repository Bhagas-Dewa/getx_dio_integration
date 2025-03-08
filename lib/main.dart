import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dio_integration/screens/user_data_screen.dart';
import 'package:getx_dio_integration/screens/user_detail_screen.dart';
import 'controllers/user_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserListScreen(),
    );
  }
}

