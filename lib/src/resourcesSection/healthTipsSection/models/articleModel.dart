// To parse this JSON data, do
//
//     final articleModel = articleModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

ArticleModel articleModelFromJson(String str) =>
    ArticleModel.fromJson(json.decode(str));

String articleModelToJson(ArticleModel data) =>
    json.encode(data.toJson(data.articleId.toString()));

class ArticleModel {
  ArticleModel(
      {this.userId,
      this.articleId,
      this.articleTitle,
      this.articleDescription,
      this.articleImage,
      this.isApprovedByAdmin,
      this.dateCreated,
      this.categoryType});

  String? userId;
  String? articleId;
  String? articleTitle;
  String? articleDescription;
  String? articleImage;
  bool? isApprovedByAdmin;
  Timestamp? dateCreated;
  String? categoryType;

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        userId: json["userID"],
        articleId: json["articleID"],
        articleTitle: json["articleTitle"],
        articleDescription: json["articleDescription"],
        articleImage: json["articleImage"],
        isApprovedByAdmin: json["isApprovedByAdmin"],
        dateCreated: json["dateCreated"],
        categoryType: json["categoryType"],
      );

  Map<String, dynamic> toJson(String docID) => {
        "userID": userId,
        "articleID": docID,
        "articleTitle": articleTitle,
        "articleDescription": articleDescription,
        "articleImage": articleImage,
        "isApprovedByAdmin": isApprovedByAdmin,
        "dateCreated": dateCreated,
        "categoryType": categoryType,
      };
}
