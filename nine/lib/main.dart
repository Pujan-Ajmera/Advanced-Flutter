import 'package:get/get.dart';
import './utils/import_export.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'NextJs App',
      // home: HomeView(),
      home : HomeView(),
    );
  }
}
