// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/controllers/db_controller.dart';
import 'app/services/db_service.dart';
import 'app/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(DBService());         // Inject service
  Get.put(DBController());      // Inject controller
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Concept Learning App',
      home: HomeView(),
    );
  }
}
