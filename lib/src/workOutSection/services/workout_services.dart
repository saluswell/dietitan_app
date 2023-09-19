import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../common/utils/firebaseUtils.dart';
import '../models/workout_model.dart';

class WorkoutServices {
  ///Create workout
  Future createWorkout(WorkoutModel workoutModel) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection(FirebaseUtils.workouts).doc();
    return await docRef.set(workoutModel.toJson(docRef.id));
  }

  /// show list of pending and approved articles  from admin
  Stream<List<WorkoutModel>> streamWorkouts() {
    //  try {
    return FirebaseFirestore.instance
        .collection(FirebaseUtils.workouts)
        //  .where("userID", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        //.where("isApprovedByAdmin", isEqualTo: isApprove)
        .snapshots()
        .map((list) => list.docs
            .map((singleDoc) => WorkoutModel.fromJson(singleDoc.data()))
            .toList());
  }
}
