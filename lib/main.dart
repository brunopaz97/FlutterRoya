import 'package:flutter/material.dart';
import 'package:analisis_roya/config/router/app_router.dart';
import 'package:analisis_roya/config/theme/app_theme.dart';

void main() /*async*/ {
  /*await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 6).getTheme(),
    );
  }
}

// Create a app theme
