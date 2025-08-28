import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/src/core/shared/loading/loading.dart';
import 'package:task_management/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:task_management/src/features/auth/presentation/view/signup_screen.dart';
import '../../../../core/enum/snackbar_type/snackbar_type.dart';
import '../../../../core/shared/fields/text/text_input_field_widen.dart';
import '../../../../core/shared/snackbar/k_snackbar.dart';
import '../../../../core/utils/theme/theme.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if(state is AuthLoading){
                  CircularProgressIndicator();
                }
                else if (state is AuthFailure) {
                  showCustomSnackBar(
                    context,
                    snackBarType: SnackBarType.error,
                    message: state.message,
                  );
                } else if (state is AuthSuccess) {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (_) => Dashboard()),
                  // );
                  showCustomSnackBar(
                    context,
                    snackBarType: SnackBarType.success,
                    message: "login successful",
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Loading();
                }
                return SizedBox(

                  height: MediaQuery.of(context).size.height * .8, // full screen height

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

                      // ? CircularProgressIndicator():
                      ElevatedButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(
                            AuthLogin(
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
                          "Log In",
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
                          Text("Don't have an account? "),
                          TextButton(
                            onPressed: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => SignUpScreen()),
                            ),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(color: kSecondaryColor),
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 30),
                      ElevatedButton.icon(
                        onPressed: () {},
                        // icon: const Icon(Icons.go),
                        label: const Text("Log in with Google"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kDeepGreen,
                          foregroundColor: white,
                        ),
                      ),
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
