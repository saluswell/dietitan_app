// To parse this JSON data, do
//
//     final reviewModel = reviewModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

ReviewModel reviewModelFromJson(String str) =>
    ReviewModel.fromJson(json.decode(str));

String reviewModelToJson(ReviewModel data) =>
    json.encode(data.toJson(data.reviewId.toString()));

class ReviewModel {
  ReviewModel({
    this.reviewId,
    this.reviewDate,
    this.appointmentId,
    this.dietitianId,
    this.dietitianName,
    this.dietitianProfilePic,
    this.patientId,
    this.patientName,
    this.patientProfilePic,
    this.reviewStars,
    this.reviewDescription,
    this.reviewRecieverID
  });

  String? reviewId;
  Timestamp? reviewDate;
  String? appointmentId;
  String? dietitianId;
  String? dietitianName;
  String? dietitianProfilePic;
  String? patientId;
  String? patientName;
  String? patientProfilePic;
  double? reviewStars;
  String? reviewDescription;
  String? reviewRecieverID;

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        reviewId: json["reviewID"],
        reviewDate: json["reviewDate"],
        appointmentId: json["appointmentID"],
        dietitianId: json["dietitianID"],
        dietitianName: json["DietitianName"],
        dietitianProfilePic: json["DietitianProfilePic"],
        patientId: json["patientID"],
        patientName: json["patientName"],
        patientProfilePic: json["patientProfilePic"],
        reviewStars: json["reviewStars"],
        reviewDescription: json["reviewDescription"],
      );

  Map<String, dynamic> toJson(String id) => {
        "reviewID": id,
        "reviewDate": reviewDate,
        "appointmentID": appointmentId,
        "dietitianID": dietitianId,
        "DietitianName": dietitianName,
        "DietitianProfilePic": dietitianProfilePic,
        "patientID": patientId,
        "patientName": patientName,
        "patientProfilePic": patientProfilePic,
        "reviewStars": reviewStars,
        "reviewDescription": reviewDescription,
       "reviewRecieverID": reviewRecieverID,
      };
}
