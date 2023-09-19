// To parse this JSON data, do
//
//     final articleModel = articleModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

RecipesModel articleModelFromJson(String str) =>
    RecipesModel.fromJson(json.decode(str));

String articleModelToJson(RecipesModel data) =>
    json.encode(data.toJson(data.recipeId.toString()));

class RecipesModel {
  RecipesModel(
      {this.userId,
      this.recipeId,
      this.recipeTitle,
      this.conditions,
      this.meals,
      this.dietTypes,
      this.ingredients,
      this.allergens,
      this.directions,
      this.breakdownOfEssentialIngredients,
      this.recipeDescription,
      this.recipeImage,
      this.isApprovedByAdmin,
      this.dateCreated,
      this.categoryType,
      this.calories,
      this.carbohydrates,
      this.protein,
      this.fiber,
      this.sodium,
      this.sugar,
      this.isApproved});

  String? userId;
  String? recipeId;
  String? recipeTitle;
  List<String>? conditions;
  List<String>? meals;
  List<String>? dietTypes;
  List<String>? ingredients;
  List<String>? allergens;
  String? directions;
  String? breakdownOfEssentialIngredients;
  String? recipeDescription;
  String? recipeImage;
  bool? isApprovedByAdmin;
  Timestamp? dateCreated;
  String? categoryType;

  String? calories;
  String? carbohydrates;
  String? protein;
  String? fiber;
  String? sodium;
  String? sugar;
  bool? isApproved;

  factory RecipesModel.fromJson(Map<String, dynamic> json) => RecipesModel(
      userId: json["userID"],
      recipeId: json["recipeId"],
      recipeTitle: json["recipeTitle"],
      conditions: json["conditions"] == null
          ? []
          : List<String>.from(json["conditions"]),
      recipeDescription: json["recipeDescription"],
      recipeImage: json["recipeImage"],
      isApprovedByAdmin: json["isApprovedByAdmin"],
      dateCreated: json["dateCreated"],
      categoryType: json["categoryType"],
      meals: json["meals"] == null ? [] : List<String>.from(json["meals"]),
      ingredients: json["ingredients"] == null
          ? []
          : List<String>.from(json["ingredients"]),
      allergens:
          json["allergens"] == null ? [] : List<String>.from(json["allergens"]),
      calories: json["calories"],
      carbohydrates: json["carbohydrates"],
      protein: json["protein"],
      fiber: json["fiber"],
      sodium: json["sodium"],
      sugar: json["sugar"],
      directions: json["directions"],
      dietTypes:
          json["dietTypes"] == null ? [] : List<String>.from(json["dietTypes"]),
      breakdownOfEssentialIngredients: json["breakdownOfEssentialIngredients"],
      isApproved: json["isApproved"]);

  Map<String, dynamic> toJson(String docID) => {
        "userID": userId,
        "recipeId": docID,
        "recipeTitle": recipeTitle,
        "conditions": conditions,
        "recipeDescription": recipeDescription,
        "meals": meals,
        "dietTypes": dietTypes,
        "ingredients": ingredients,
        "allergens": allergens,
        "directions": directions,
        "breakdownOfEssentialIngredients": breakdownOfEssentialIngredients,
        "recipeImage": recipeImage,
        "isApprovedByAdmin": isApprovedByAdmin,
        "dateCreated": dateCreated,
        "categoryType": categoryType,
        "calories": calories,
        "carbohydrates": carbohydrates,
        "protein": protein,
        "fiber": fiber,
        "sodium": sodium,
        "sugar": sugar,
        "isApproved": isApproved
      };
}
