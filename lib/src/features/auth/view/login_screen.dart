import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/shared/fields/text/text_input_field_widen.dart';
import '../../../core/utils/theme/theme.dart';
import '../view_model/auth_view_model.dart';

class LoginScreen extends StatelessWidget {
  final AuthViewModel controller = Get.put(AuthViewModel());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12,
            children: [
              Text(
                "Log In",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              KTextInputFieldWiden(
                title: "Email",
                required: true,
                controller: emailController,
              ),

              // SizedBox(height: 10),
              KTextInputFieldWiden(
                title: "Password",
                required: true,
                controller: passwordController,
              ),
              SizedBox(height: 10),

              Obx(
                () => controller.isLoading.value
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () => controller.signIn(
                          context,
                          emailController.text,
                          passwordController.text,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kOrange,
                          fixedSize: Size(300, 50),
                        ),
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 5,
                            fontWeight: FontWeight.bold,
                            color: white,
                          ),
                        ),
                      ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  TextButton(
                    onPressed: () => Get.toNamed('/signup_screen'),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: kSecondaryColor),
                    ),
                  ),
                ],
              ),
              const Divider(height: 30),
              ElevatedButton.icon(
                onPressed: controller.logInWithGoogle,
                // icon: const Icon(Icons.go),
                label: const Text("Log in with Google"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kDeepGreen,
                  foregroundColor: white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
