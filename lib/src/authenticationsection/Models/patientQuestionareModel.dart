// To parse this JSON data, do
//
//     final professionalInformationModel = professionalInformationModelFromJson(jsonString);

import 'dart:convert';

PatientQuestionareModel professionalInformationModelFromJson(String str) =>
    PatientQuestionareModel.fromJson(json.decode(str));

String professionalInformationModelToJson(PatientQuestionareModel data) =>
    json.encode(data.toJson(data.userId.toString()));

class PatientQuestionareModel{
  PatientQuestionareModel({
    this.userId,
    this.wantToAchieveList,
    this.activityLevelList,
    this.height,
    this.weight,
    this.waistCircumferrence,
    this.hipCicumferrence,
  });

  String? userId;
  List<dynamic>? wantToAchieveList;
  List<dynamic>? activityLevelList;
  String? height;
  String? weight;
  String? waistCircumferrence;
  String? hipCicumferrence;

  factory PatientQuestionareModel.fromJson(Map<String, dynamic> json) =>
      PatientQuestionareModel(
        userId: json["userID"],
        wantToAchieveList: json["wantToAchieveList"],
        activityLevelList: json["activityLevelList"],
        height: json["height"],
        weight: json["weight"],
        waistCircumferrence: json["waistCircumferrence"],
        hipCicumferrence: json["hipCicumferrence"],
      );

  Map<String, dynamic> toJson(String docID) => {
        "userID": docID,
        "wantToAchieveList": wantToAchieveList,
        "activityLevelList": activityLevelList,
        "height": height,
        "weight": weight,
        "waistCircumferrence": waistCircumferrence,
        "hipCicumferrence": hipCicumferrence,
      };
}
