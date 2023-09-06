import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../common/utils/firebaseUtils.dart';
import '../models/articleModel.dart';

class ArticleServices {
  ///Create Page
  Future createArticle(ArticleModel articleModel) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection(FirebaseUtils.healthtips).doc();
    return await docRef.set(articleModel.toJson(docRef.id));
  }

  /// show list of pending and approved articles  from admin
  Stream<List<ArticleModel>> streamArticles(bool isApprove) {
    //  try {
    return FirebaseFirestore.instance
        .collection(FirebaseUtils.healthtips)
        .where("userID", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("isApprovedByAdmin", isEqualTo: isApprove)
        .snapshots()
        .map((list) => list.docs
            .map((singleDoc) => ArticleModel.fromJson(singleDoc.data()))
            .toList());
  }

  ///delete article
  Future deleteArticle(String articleID) async {
    return await FirebaseFirestore.instance
        .collection(FirebaseUtils.healthtips)
        .doc(articleID)
        .delete();
  }

  /// update article data without image
  Future updateArticleDetailswithoutImage(
      ArticleModel articleModel, articleID) async {
    return await FirebaseFirestore.instance
        .collection(FirebaseUtils.healthtips)

        //  .where("UserId",isEqualTo: userid)
        .doc(articleID)
        .update({
      'articleTitle': articleModel.articleTitle,
      "articleDescription": articleModel.articleDescription,
    });
  }

  /// update article data with Image
  Future updateArticleDetailswithImage(
      ArticleModel articleModel, articleID) async {
    return await FirebaseFirestore.instance
        .collection(FirebaseUtils.healthtips)

        //   .where("UserId",isEqualTo: userid)
        .doc(articleID)
        .update({
      'articleTitle': articleModel.articleTitle,
      "articleDescription": articleModel.articleDescription,
      "articleImage": articleModel.articleImage,
    });
  }
}
