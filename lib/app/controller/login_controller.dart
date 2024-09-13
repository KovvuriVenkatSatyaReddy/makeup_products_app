import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_flutter_website/app/view/home_page.dart';

class LoginController extends GetxController {
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var obscureText = true;

  void toggleObscureText() {
    obscureText = !obscureText;
    update();
  }

  Future<void> loginUsingEmailAndPassword() async {
    String email = emailController.text;
    String password = passwordController.text;
    if (!validateEmail(email)) {
      print("Enter valid email!!");
    }
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      FocusManager.instance.primaryFocus?.unfocus();
      Get.offAll(() => const HomePage());
    } catch (e) {
      print(e.toString());
    }
  }

  bool validateEmail(String email) {
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(email);
  }
}
