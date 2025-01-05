import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes_dana_ppb/firebase_options.dart';
import 'package:tubes_dana_ppb/routes/route_names.dart';
import 'routes/app_routes.dart';
import 'themes/color_themes.dart'; // Import ColorThemes

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Tugas Besar - Redesign DANA',
      initialRoute: RouteNames.splash,
      getPages: AppRoutes.routes,
      theme: ThemeData(
        colorScheme:
            ColorThemes.colorScheme, // Gunakan colorScheme dari ColorThemes
        useMaterial3: true,
      ),
    );
  }
}
