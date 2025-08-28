import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/src/features/auth/presentation/view/login_screen.dart';

import '../../../../core/enum/snackbar_type/snackbar_type.dart';
import '../../../../core/shared/fields/text/text_input_field_widen.dart';
import '../../../../core/shared/snackbar/k_snackbar.dart';
import '../../../../core/utils/theme/theme.dart';
import '../bloc/auth_bloc.dart';

class SignUpScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthLoading) {
                  CircularProgressIndicator();
                } else if (state is AuthFailure) {
                  showCustomSnackBar(
                    context,
                    snackBarType: SnackBarType.error,
                    message: state.message,
                  );
                } else if (state is AuthSuccess) {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (_) => LoginScreen()),
                  // );
                  showCustomSnackBar(
                    context,
                    snackBarType: SnackBarType.success,
                    message: "signup successful",
                  );
                }
              },
              builder: (context, state) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * .8, // full screen height
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

                      // ? CircularProgressIndicator():
                      ElevatedButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(
                            AuthSignUp(
                              name: nameController.text.trim(),
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kOrange,
                          fixedSize: Size(300, 50),
                        ),

                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 5,
                            fontWeight: FontWeight.bold,
                            color: white,
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?"),
                          TextButton(
                            onPressed: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => LoginScreen()),
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(color: kSecondaryColor),
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 30),
                      ElevatedButton.icon(
                        onPressed: () {},
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
