// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:task_management/src/core/enum/snackbar_type/snackbar_type.dart';
//
// import '../../../core/shared/snackbar/k_snackbar.dart';
//
// class AuthViewModel extends GetxController {
//   // static AuthViewModel instance = Get.find();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   var isLoading = false.obs;
//
//
//
//   Future<void> signIn(context, String email, String password) async {
//     if (email.isEmpty || password.isEmpty) {
//       showCustomSnackBar(
//         context,
//         snackBarType: SnackBarType.error,
//         message: "Please enter email and password",
//       );
//       return;
//     }
//
//     try {
//       isLoading.value = true;
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//       await _saveLoginStatus(true);
//
//
//       showCustomSnackBar(
//         context,
//         snackBarType: SnackBarType.success,
//         message: "Login Successful",
//       );
//       Get.offAllNamed('/home_page');
//     } on FirebaseAuthException catch (e) {
//       showCustomSnackBar(
//         context,
//         snackBarType: SnackBarType.error,
//         message: e.message ?? "Login failed",
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   Future<void> signUp(context, String name, String email, String password) async {
//     if (name.isEmpty || email.isEmpty || password.isEmpty) {
//       showCustomSnackBar(
//         context,
//         snackBarType: SnackBarType.error,
//         message: "All fields are required",
//       );
//       return;
//     }
//
//     try {
//       isLoading.value = true;
//       await _auth.createUserWithEmailAndPassword(email: email, password: password);
//       await _saveLoginStatus(true);
//
//       showCustomSnackBar(
//         context,
//         snackBarType: SnackBarType.success,
//         message: "Account Created",
//       );
//       Get.offAllNamed('/home_page');
//     } on FirebaseAuthException catch (e) {
//       showCustomSnackBar(
//         context,
//         snackBarType: SnackBarType.error,
//         message: e.message ?? "Sign-up failed",
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//
//   void signUpWithGoogle(){
//
//   }
//   void logInWithGoogle(){
//
//   }
//
//   // Future<void> logInWithGoogle() async {
//   //   try {
//   //     isLoading.value = true;
//   //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//   //     if (googleUser == null) return;
//   //
//   //     final GoogleSignInAuthentication googleAuth =
//   //     await googleUser.authentication;
//   //
//   //     final credential = GoogleAuthProvider.credential(
//   //       accessToken: googleAuth.accessToken,
//   //       idToken: googleAuth.idToken,
//   //     );
//   //
//   //     await _auth.signInWithCredential(credential);
//   //     await _saveLoginStatus(true);
//   //     Get.offAllNamed('/home');
//   //   } catch (e) {
//   //     Get.snackbar("Error", e.toString());
//   //   } finally {
//   //     isLoading.value = false;
//   //   }
//   // }
//   Future<void> _saveLoginStatus(bool isLoggedIn) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setBool("isLogin", isLoggedIn);
//   }
//
//   Future<void> logout() async {
//     await _auth.signOut();
//     await _saveLoginStatus(false);
//     Get.offAllNamed('/login_screen');
//   }
// }
