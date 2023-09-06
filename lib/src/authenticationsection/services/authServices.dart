import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:saluswell_dietitan_app_updated/src/authenticationsection/services/userServices.dart';

import '../../../common/helperFunctions/showsnackbar.dart';
import '../../../common/utils/firebaseUtils.dart';
import '../Models/userModel.dart';

class AuthServices {
  ///Register User
  Future registerUser({required String email, required String password}) async {
    return await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  ///Login User
  Future<User> loginUser(
      {required String email, required String password}) async {
    UserCredential _userCred = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return _userCred.user!;
  }

  ///Reset Password
  Future resetPassword({required String email}) async {
    return await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  /// check if user is approved or not from admin
  Stream<UserModel> checkIfUserAllowed(String docID) {
    return FirebaseFirestore.instance
        .collection(FirebaseUtils.users)
        .doc(docID)
        .snapshots()
        .map((event) {
      return UserModel.fromJson(event.data()!);
    });
  }

  //
  ///fetch current user
  Future<UserModel?> fetchCurrentUser({userId}) async {
    try {
      var userData = await FirebaseFirestore.instance
          .collection(FirebaseUtils.users)
          .doc(userId ?? UserServices.userId)
          .get();

      if (userData.exists) {
        return UserModel.fromJson(userData.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } on FirebaseException catch (e) {
      dp(msg: "Error in get user", arg: e);
      rethrow;
    }
  }

  ///Fetch User Record
  Stream<UserModel> fetchUserRecord(String userID) {
    return FirebaseFirestore.instance
        .collection(FirebaseUtils.users)
        .doc(userID)
        .snapshots()
        .map((userData) => UserModel.fromJson(userData.data()!));
  }

  /// logout user
  logoutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      dp(msg: "Error in sign out", arg: e.toString());
      rethrow;
    }
  }

  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }
}
