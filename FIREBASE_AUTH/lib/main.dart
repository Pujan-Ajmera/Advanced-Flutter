import 'package:app2/auth/auth.dart';
import 'package:app2/auth/login_or_register.dart';
import 'package:app2/firebase_options.dart';
import 'package:app2/pages/login_page.dart';
import 'package:app2/pages/register_page.dart';
import 'package:app2/theme/dark_mode.dart';
import 'package:app2/theme/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
