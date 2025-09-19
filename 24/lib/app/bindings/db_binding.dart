import 'package:get/get.dart';
import '../../utils/import_export.dart';
import '../controllers/statistics_controller.dart';

class DBBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DBController>(() => DBController());
    Get.lazyPut<StatisticsController>(() => StatisticsController());
  }
}
