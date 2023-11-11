import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_rent_admin/core/values/app_colors.dart';
import 'package:flutter_smart_rent_admin/firebase_options.dart';
import 'package:flutter_smart_rent_admin/modules/home/views/home_screen.dart';
import 'package:flutter_smart_rent_admin/modules/root/views/root_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Smart Rent House',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primary98,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
