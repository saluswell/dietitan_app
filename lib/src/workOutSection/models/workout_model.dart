// To parse this JSON data, do
//
//     final articleModel = articleModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

WorkoutModel articleModelFromJson(String str) =>
    WorkoutModel.fromJson(json.decode(str));

String articleModelToJson(WorkoutModel data) =>
    json.encode(data.toJson(data.workoutId.toString()));

class WorkoutModel {
  WorkoutModel({
    this.userId,
    this.workoutId,
    this.workoutTitle,
    this.workoutDuration,
    this.workoutVideo,
    this.isApprovedByAdmin,
    this.dateCreated,
  });

  String? userId;
  String? workoutId;
  String? workoutTitle;
  String? workoutDuration;
  String? workoutVideo;
  bool? isApprovedByAdmin;
  Timestamp? dateCreated;

  factory WorkoutModel.fromJson(Map<String, dynamic> json) => WorkoutModel(
        userId: json["userID"],
        workoutId: json["workoutId"],
        workoutTitle: json["workoutTitle"],
        workoutDuration: json["workoutDuration"],
        workoutVideo: json["workoutVideo"],
        isApprovedByAdmin: json["isApprovedByAdmin"],
        dateCreated: json["dateCreated"],
      );

  Map<String, dynamic> toJson(String docID) => {
        "userID": userId,
        "workoutId": docID,
        "workoutTitle": workoutTitle,
        "workoutDuration": workoutDuration,
        "workoutVideo": workoutVideo,
        "isApprovedByAdmin": isApprovedByAdmin,
        "dateCreated": dateCreated,
      };
}
