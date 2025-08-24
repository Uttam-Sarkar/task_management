import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_management/src/core/shared/text/exceptions.dart';
import 'package:task_management/src/features/auth/data/models/user_model.dart';
import '../../models/login_model.dart';
import '../../models/signup_model.dart';

abstract interface class AuthRemoteDataSource {
  Stream<User?> get currentUser;

  Future<UserModel> signupWithEmailPassword({required SignUpModel signupModel});

  Future<UserModel> loginWithEmailPassword({required LoginModel loginModel});

  Future<UserModel?> getCurrentUserData();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _auth;

  AuthRemoteDataSourceImpl(this._auth);

  @override
  Stream<User?> get currentUser => FirebaseAuth.instance.authStateChanges();

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

  @override
  Future<UserModel?> getCurrentUserData() async {
    try {
      var data;
      print("1 fetch userdata $data");

      currentUser.listen((User? user) async {
        Future.delayed(Duration(seconds: 3));
        if (user == null) {
          data = null;
        } else {
          data = await FirebaseFirestore.instance
              .collection("users")
              .doc(user.uid)
              .get();
          // for(int i=0; i<data):
          print("2 fetch userdata start");
          print("2 fetch userdata ${data.id}");
          print("2 fetch userdata ${UserModel.fromJson(data).name.toString()}");
          print("2 fetch userdata ${data.email}");

        }
      });
      print("fetch userdata ${data.toString()}");
      return UserModel.fromJson(data);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
