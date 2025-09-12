import 'package:get/get.dart';
import 'package:next_app/utils/import_export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Get.off(() => HomeView());
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Next.js logo from assets
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
              ),
              child: Image.asset(
                'assets/next_js_2.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Next.js Learning',
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'by Pujan Ajmera',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
                letterSpacing: 1.1,
              ),
            ),
            const SizedBox(height: 24),
            CircularProgressIndicator(
              color: theme.colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}