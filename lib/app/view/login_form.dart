import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_flutter_website/app/controller/login_controller.dart';
import 'package:simple_flutter_website/app/view/home_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _chkBox = false;
  // final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<LoginController>(
              init: Get.put(LoginController()),
              builder: (controller) {
                return TextField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  controller: controller.emailController,
                  autocorrect: false,
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
                      Icons.person_2_outlined,
                      color: Colors.white,
                    ),
                    hintText: "Email",
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
          GetBuilder<LoginController>(
            init: Get.put<LoginController>(LoginController()),
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
                      Get.find<LoginController>().toggleObscureText();
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
          Row(
            children: [
              SizedBox(
                height: 60,
                width: 230,
                child: Center(
                  child: CheckboxListTile(
                    contentPadding: const EdgeInsets.all(0),
                    shape: const StadiumBorder(side: BorderSide.none),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text(
                      'Remember me',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    activeColor: Theme.of(context).primaryColor,
                    checkColor: Colors.white,
                    value: _chkBox,
                    onChanged: (val) {
                      if (val != null) {
                        setState(() {
                          _chkBox = val;
                        });
                      }
                    },
                  ),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
              ),
            ],
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
                // Get.offAll(() => const HomePage());
                Get.put(LoginController()).loginUsingEmailAndPassword();
              },
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
