import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_flutter_website/app/view/authentication_page.dart';
import 'package:simple_flutter_website/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF6D4C41),
        primaryColorLight: const Color(0xFF9A7B6F),
        primaryColorDark: const Color(0xFF4C3931),
        fontFamily: 'poppins',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(
              0xFF212121,
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF6D4C41),
          foregroundColor: Color(0xFFF2F2F2),
        ),
      ),
      home: const AuthenticationPage(),
    ),
  );
}
