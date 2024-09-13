import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:simple_flutter_website/app/view/login_form.dart';
import 'package:simple_flutter_website/app/view/registration_form.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  var selectedPage = 'Login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomSlidingSegmentedControl<String>(
                fixedWidth: 180,
                initialValue: 'Login',
                children: const {
                  'Login': Text(
                    'Login',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  'Register': Text(
                    'Register',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                },
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                thumbDecoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(40),
                ),
                onValueChanged: (val) {
                  setState(
                    () {
                      selectedPage = val;
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              selectedPage == 'Login'
                  ? const LoginForm()
                  : const RegistrationForm(),
            ],
          ),
        ),
      ),
    );
  }
}
