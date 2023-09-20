// To parse this JSON data, do
//
//     final articleModel = articleModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

MealPlanModel articleModelFromJson(String str) =>
    MealPlanModel.fromJson(json.decode(str));

String articleModelToJson(MealPlanModel data) =>
    json.encode(data.toJson(data.mealPlanId.toString()));

class MealPlanModel {
  MealPlanModel(
      {this.userId,
      this.mealPlanId,
      this.mealPlanTitle,
      this.breakfastMeals,
      this.lunchMeals,
      this.dinnerMeals,
      this.isApprovedByAdmin,
      this.dateCreated,
      this.mealPlanDay});

  String? userId;
  String? mealPlanId;
  String? mealPlanTitle;
  List<String>? breakfastMeals;
  List<String>? lunchMeals;
  List<String>? dinnerMeals;

  bool? isApprovedByAdmin;
  Timestamp? dateCreated;
  String? mealPlanDay;

  factory MealPlanModel.fromJson(Map<String, dynamic> json) => MealPlanModel(
      userId: json["userID"],
      mealPlanId: json["mealPlanId"],
      mealPlanTitle: json["mealPlanTitle"],
      breakfastMeals: json["breakfastMeals"] == null
          ? []
          : List<String>.from(json["breakfastMeals"]),
      lunchMeals: json["lunchMeals"] == null
          ? []
          : List<String>.from(json["lunchMeals"]),
      dinnerMeals: json["dinnerMeals"] == null
          ? []
          : List<String>.from(json["dinnerMeals"]),
      isApprovedByAdmin: json["isApprovedByAdmin"],
      mealPlanDay: json["mealPlanDay"]);

  Map<String, dynamic> toJson(String docID) => {
        "userID": userId,
        "mealPlanId": docID,
        "mealPlanTitle": mealPlanTitle,
        "breakfastMeals": breakfastMeals,
        "lunchMeals": lunchMeals,
        "dinnerMeals": dinnerMeals,
        "isApprovedByAdmin": isApprovedByAdmin,
        "dateCreated": dateCreated,
        "mealPlanDay": mealPlanDay
      };
}
