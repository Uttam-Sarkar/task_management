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
  // Stream<UserModel?> getCurrentUserDataStream();
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
      final user = await currentUser.first; // initial user
      if (user == null) return null;

      final doc = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();

      if (!doc.exists) return null;
      // return UserModel.fromJson(doc.data()!);
      return UserModel.fromJson(doc.data()!)
          .copyWith(email: user.email);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

// @override
  // Future<UserModel?> getCurrentUserData() async {
  //   try {
  //     var userData = null;
  //     User? userInfo = await currentUser.first;
  //     // final initialUser = await currentUser.first;
  //     print("Initial user: $userInfo");
  //
  //     currentUser.listen((user) async {
  //       userInfo = user;
  //       if (user == null) {
  //         print("No user logged in");
  //       } else {
  //         userData = await FirebaseFirestore.instance
  //             .collection("users")
  //             .doc(user.uid)
  //             .get();
  //         final data = userData.data() as Map<String, dynamic>;
  //       }
  //     });
  //     print("fetch userdata ${userData.toString()}");
  //     if (userInfo == null) {
  //       print("1.2 Data is Null");
  //       return null;
  //     }
  //     return UserModel.fromJson(userData).copyWith(email: userInfo!.email);
  //   } catch (e) {
  //     throw ServerException(e.toString());
  //   }
  // }

  // Stream<UserModel?> getCurrentUserDataStream() {
  //   return currentUser.asyncExpand((user) {
  //     if (user == null) {
  //       return Stream.value(null);
  //     }
  //     return FirebaseFirestore.instance
  //         .collection("users")
  //         .doc(user.uid)
  //         .snapshots()
  //         .map((doc) {
  //       if (!doc.exists) return null;
  //       return UserModel.fromJson(doc.data()!)
  //           .copyWith(email: user.email);
  //     });
  //   });
  // }

}
