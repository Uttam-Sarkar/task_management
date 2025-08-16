import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_management/src/core/shared/text/exceptions.dart';
import 'package:task_management/src/features/auth2/data/models/user_model.dart';
import '../../models/login_model.dart';
import '../../models/signup_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signupWithEmailPassword({required SignUpModel signupModel});

  Future<UserModel> loginWithEmailPassword({required LoginModel loginModel});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _auth;

  AuthRemoteDataSourceImpl(this._auth);

  @override
  Future<UserModel> loginWithEmailPassword({
    required LoginModel loginModel,
  }) async {
    try {
      final UserCredential response = await _auth.signInWithEmailAndPassword(
        email: loginModel.email,
        password: loginModel.password,
      );
      final user = response.user;
      if (response.user == null) {
        throw ServerException("User is Null");
      }
      //fetch data
      final doc = await FirebaseFirestore.instance
          .collection("users")
          .doc(user?.uid)
          .get();
      if (!doc.exists) {
        throw ServerException("User Data not found");
      }
      return UserModel.fromJson(doc.data()!);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signupWithEmailPassword({
    required SignUpModel signupModel,
  }) async {
    try {
      final UserCredential response = await _auth
          .createUserWithEmailAndPassword(
            email: signupModel.email,
            password: signupModel.password,
          );
      final user = response.user;
      if (user == null) {
        throw ServerException("User is Null");
      }

      // extra info
      final userModel = UserModel(
        id: user.uid,
        name: signupModel.name,
        email: signupModel.email,
        // createdAt: DateTime.now(),
      );
      //store data
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .set(userModel.toJson());
      return userModel;
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message ?? "Signup Error");
    }
  }
}
