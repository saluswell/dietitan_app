import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';

import '../../../common/utils/firebaseUtils.dart';
import '../../authenticationsection/Models/userModel.dart';




class ExpertServices {
  ///Get Specific User Details
  Stream<UserModel> getUserDetails(String docID) {
    return FirebaseFirestore.instance
        .collection(FirebaseUtils.users)
        .doc(docID)
        .snapshots()
        .map((event) =>
        UserModel.fromJson(event.data() as Map<String, dynamic>));
  }

  // ///Create User
  // Future createUser(BuildContext context,
  //     {required UserModelDietitian model, required String uid}) async {
  //   DocumentReference docRef =
  //       FirebaseFirestore.instance.collection('userCollection').doc(uid);
  //   return await docRef.set(model.toJson(uid));
  // }
  //
  // ///Edit Profile
  // Future<void> editProfile(UserModelDietitian model) async {
  //   return await FirebaseFirestore.instance
  //       .collection('userCollection')
  //       .doc(model.docId)
  //       .update({
  //     'name': model.fullName.toString(),
  //     'profileImage': model.userImage.toString()
  //   });
  // }
}
