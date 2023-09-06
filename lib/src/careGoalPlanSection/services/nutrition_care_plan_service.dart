import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saluswell_dietitan_app_updated/src/careGoalPlanSection/models/add_care_plan_model.dart';

import '../../../common/utils/firebaseUtils.dart';

class NutritionCarePlanService {
  ///Create plan
  Future createCarePlan(AddCarePlanModel addCarePlanModel) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection(FirebaseUtils.carePlans).doc();
    return await docRef.set(addCarePlanModel.toJson(docRef.id));
  }

  /// stream plans
  Stream<List<AddCarePlanModel>> streamCarePlans() {
    return FirebaseFirestore.instance
        .collection(FirebaseUtils.carePlans)
        //.doc()
        //.where("recieverID", isEqualTo: getUserID())

        // .where("appointmentStatus", isEqualTo: appointmentStatus)
        .snapshots()
        .map((list) => list.docs
            .map((singleDoc) => AddCarePlanModel.fromJson(singleDoc.data()))
            .toList());
  }

  ///delete care plan
  Future deleteCarePlan(String planID) async {
    return await FirebaseFirestore.instance
        .collection(FirebaseUtils.carePlans)
        .doc(planID)
        .delete();
  }
}
