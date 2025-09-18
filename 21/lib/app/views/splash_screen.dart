// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'home_view.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Navigate to HomeView after 5 seconds
//     Timer(const Duration(seconds: 5), () {
//       Get.off(() => HomeView());
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Colors.white,
//               Colors.grey[50]!,
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: Stack(
//             children: [
//               // Main content centered
//               Center(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     // Next.js logo
//                     Container(
//                       width: 160,
//                       height: 160,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(24),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.3),
//                             blurRadius: 12,
//                             spreadRadius: 3,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Image.asset(
//                         'assets/next_js_2.png',
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                     const SizedBox(height: 48),
//                     // App title with gradient and shadow
//                     ShaderMask(
//                       shaderCallback: (bounds) => LinearGradient(
//                         colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                       ).createShader(bounds),
//                       child: Text(
//                         'Next.js Learning',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 36,
//                           fontWeight: FontWeight.w900,
//                           letterSpacing: 1.6,
//                           shadows: [
//                             Shadow(
//                               color: Colors.grey.withOpacity(0.3),
//                               blurRadius: 8,
//                               offset: const Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 40),
//                     // Loading indicator with modern styling
//                     Container(
//                       padding: const EdgeInsets.all(14),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.25),
//                             blurRadius: 10,
//                             spreadRadius: 3,
//                           ),
//                         ],
//                       ),
//                       child: CircularProgressIndicator(
//                         color: theme.colorScheme.primary,
//                         strokeWidth: 4,
//                         backgroundColor: Colors.grey[200],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Logos at the bottom
//               Positioned(
//                 bottom: 24,
//                 left: 0,
//                 right: 0,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // DU logo
//                     Container(
//                       width: 120,
//                       height: 120,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.2),
//                             blurRadius: 8,
//                             spreadRadius: 2,
//                           ),
//                         ],
//                       ),
//                       child: Image.asset(
//                         'assets/du_logo.png',
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                     const SizedBox(width: 48),
//                     // ASWDC logo
//                     Container(
//                       width: 120,
//                       height: 120,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.2),
//                             blurRadius: 8,
//                             spreadRadius: 2,
//                           ),
//                         ],
//                       ),
//                       child: Image.asset(
//                         'assets/logo_aswdc.png',
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to HomeView after 5 seconds
    Timer(const Duration(seconds: 5), () {
      Get.off(() => HomeView());
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.grey[50]!,
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Main content centered
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Next.js logo
                    Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 12,
                            spreadRadius: 3,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/next_js_2.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 48),
                    // App title with gradient and shadow
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: Text(
                        'Next.js Learning',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.6,
                          shadows: [
                            Shadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Loading indicator with modern styling
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.25),
                            blurRadius: 10,
                            spreadRadius: 3,
                          ),
                        ],
                      ),
                      child: CircularProgressIndicator(
                        color: theme.colorScheme.primary,
                        strokeWidth: 4,
                        backgroundColor: Colors.grey[200],
                      ),
                    ),
                  ],
                ),
              ),
              // Logos at the bottom
              Positioned(
                bottom: 24,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // DU logo
                    SizedBox(
                      width: 80, // 2 parts of 1:2 ratio
                      height: 80,
                      child: Image.asset(
                        'assets/logo_aswdc.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 48),
                    SizedBox(
                      width: 160, // 1 part of 1:2 ratio
                      height: 80,
                      child: Image.asset(
                        'assets/du_logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}