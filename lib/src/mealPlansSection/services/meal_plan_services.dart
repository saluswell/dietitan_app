import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saluswell_dietitan_app_updated/src/mealPlansSection/models/meal_plan_model.dart';

import '../../../common/helperFunctions/hive_local_storage.dart';
import '../../../common/utils/firebaseUtils.dart';
import '../../../common/utils/textutils.dart';

class MealPlanServices {
  ///Create meal plan
  Future<String> createMealPlan(MealPlanModel mealPlanModel, String day) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection(FirebaseUtils.mealPlans).doc();

// Get the ID of the newly created document
    final String documentId = docRef.id;
    await docRef.set(mealPlanModel.toJson(docRef.id));

    DocumentReference docRef2 = FirebaseFirestore.instance
        .collection(FirebaseUtils.mealPlans)
        .doc(documentId)
        .collection("days")
        .doc(day);
    await docRef2.set(mealPlanModel.toJson(day));

    return documentId;
  }

  ///Create meal plan
  Future updateMealPlan(MealPlanModel mealPlanModel, String day) async {
    String documentID = await HiveLocalStorage.readHiveValue<String>(
          boxName: TextUtils.documentIDBox,
          key: TextUtils.documentIDKey,
        ) ??
        '';
    DocumentReference docRef2 = FirebaseFirestore.instance
        .collection(FirebaseUtils.mealPlans)
        .doc(documentID)
        .collection("days")
        .doc(day);
    return await docRef2.set(mealPlanModel.toJson(day));

    // DocumentReference docRef2 = FirebaseFirestore.instance
    //     .collection(FirebaseUtils.mealPlans)
    //     .doc(documentId)
    //     .collection("days")
    //     .doc(day);
    // await docRef2.set(mealPlanModel.toJson(day));
    //
    // return documentId;
  }

  /// show list of pending and approved articles  from admin
  Stream<List<MealPlanModel>> streamMealPlans() {
    //  try {
    return FirebaseFirestore.instance
        .collection(FirebaseUtils.mealPlans)
        //  .where("userID", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        //.where("isApprovedByAdmin", isEqualTo: isApprove)
        .snapshots()
        .map((list) => list.docs
            .map((singleDoc) => MealPlanModel.fromJson(singleDoc.data()))
            .toList());
  }
}
