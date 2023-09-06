import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saluswell_dietitan_app_updated/src/recipesSection/models/recipes_model.dart';

import '../../../common/utils/firebaseUtils.dart';

class RecipesServices {
  ///Create Page
  Future createRecipe(RecipesModel recipesModel) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection(FirebaseUtils.recipes).doc();
    return await docRef.set(recipesModel.toJson(docRef.id));
  }

  /// show list of pending and approved articles  from admin
  Stream<List<RecipesModel>> streamRecipes() {
    //  try {
    return FirebaseFirestore.instance
        .collection(FirebaseUtils.recipes)
        //  .where("userID", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        //.where("isApprovedByAdmin", isEqualTo: isApprove)
        .snapshots()
        .map((list) => list.docs
            .map((singleDoc) => RecipesModel.fromJson(singleDoc.data()))
            .toList());
  }
}
