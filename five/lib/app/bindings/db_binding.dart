import 'package:get/get.dart';
import '../../utils/import_export.dart';
class DBBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DBController>(() => DBController());
  }
}
