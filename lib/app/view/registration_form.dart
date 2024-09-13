import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_flutter_website/app/controller/register_controller.dart';
import 'package:simple_flutter_website/app/view/home_page.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<RegisterController>(
              init: Get.put(
                RegisterController(),
              ),
              builder: (controller) {
                return TextField(
                  controller: controller.userIdController,
                  autocorrect: false,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColorDark,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.person_2_outlined,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    hintText: "User ID",
                    fillColor: Colors.white,
                    iconColor: Colors.white,
                    hintStyle: const TextStyle(color: Colors.white),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                  ),
                );
              }),
          const SizedBox(
            height: 20,
          ),
          GetBuilder<RegisterController>(
              init: Get.put(RegisterController()),
              builder: (controller) {
                return TextField(
                  controller: controller.emailController,
                  autocorrect: false,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColorDark,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    fillColor: Colors.white,
                    iconColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: "Email ID",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                  ),
                );
              }),
          const SizedBox(
            height: 20,
          ),
          GetBuilder<RegisterController>(
            init: Get.put<RegisterController>(RegisterController()),
            builder: (controller) {
              return TextField(
                controller: controller.passwordController,
                autocorrect: false,
                enableSuggestions: false,
                obscureText: controller.obscureText,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColorDark,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  suffixIcon: IconButton(
                    icon: controller.obscureText
                        ? const Icon(Icons.visibility)
                        : const Icon(
                            Icons.visibility_off,
                          ),
                    onPressed: () {
                      Get.find<RegisterController>().toggleObscureText();
                    },
                    color: Colors.white,
                  ),
                  hintText: "Password",
                  fillColor: Colors.white,
                  iconColor: Colors.white,
                  hintStyle: const TextStyle(color: Colors.white),
                  border: const OutlineInputBorder(
                    gapPadding: 2.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 40,
            width: double.infinity,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  Theme.of(context).primaryColor,
                ),
              ),
              onPressed: () {
                Get.put<RegisterController>(RegisterController())
                    .registerUsingEmailAndPassword();
              },
              child: const Text(
                'Register',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
