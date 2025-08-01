import 'package:get/get.dart';
import '../controllers/db_controller.dart';

class DBBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DBController>(() => DBController());
  }
}
