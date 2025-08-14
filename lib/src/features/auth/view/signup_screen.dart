import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/shared/fields/text/text_input_field_widen.dart';
import '../../../core/utils/theme/theme.dart';
import '../view_model/auth_view_model.dart';

class SignUpScreen extends StatelessWidget {
  final AuthViewModel controller = Get.put(AuthViewModel());

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignUpScreen({super.key});

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
                "Sign Up",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              KTextInputFieldWiden(
                title: "Name",
                required: true,
                controller: nameController,
              ),

              // SizedBox(height: 10),

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
                        onPressed: () => controller.signUp(
                          context,
                          nameController.text,
                          emailController.text,
                          passwordController.text,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kOrange,
                          fixedSize: Size(300, 50),
                        ),

                        child: Text("Sign Up",style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 5,
                          fontWeight: FontWeight.bold,
                            color: white
                        ),),
                      ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                    onPressed: () => Get.toNamed('/login_screen'),
                    child: Text(
                      "Login",
                      style: TextStyle(color: kSecondaryColor),
                    ),
                  ),
                ],
              ),
              const Divider(height: 30),
              ElevatedButton.icon(
                onPressed: controller.signUpWithGoogle,
                // icon: const Icon(Icons.go),
                label: const Text("Sign Up with Google"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kDeepGreen,
                  foregroundColor: white,
                ),
              ),

              // TextButton(
              //   onPressed: () => Get.back(),
              //   child: Text("Already have an account? Sign In"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
