import 'package:get/get.dart';
import 'package:next_app/app/views/splash_screen.dart';
import './utils/import_export.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(DBService());         // Inject service
  Get.put(DBController()); // Inject controller
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NextJs App',
      // home: HomeView(),
      home : SplashScreen(),
    );
  }
}
