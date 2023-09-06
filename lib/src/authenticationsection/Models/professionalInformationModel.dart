// To parse this JSON data, do
//
//     final professionalInformationModel = professionalInformationModelFromJson(jsonString);

import 'dart:convert';

ProfessionalInformationModel professionalInformationModelFromJson(String str) =>
    ProfessionalInformationModel.fromJson(json.decode(str));

String professionalInformationModelToJson(ProfessionalInformationModel data) =>
    json.encode(data.toJson(data.userId.toString()));

class ProfessionalInformationModel {
  ProfessionalInformationModel({
    this.userId,
    this.professionalIdNumber,
    this.qualfications,
    this.yearofExperience,
    this.areaOfFocus,
    this.professionalApproach,
    this.languageSpoken,
  });

  String? userId;
  String? professionalIdNumber;
  String? qualfications;
  String? yearofExperience;
  String? areaOfFocus;
  String? professionalApproach;
  String? languageSpoken;

  factory ProfessionalInformationModel.fromJson(Map<String, dynamic> json) =>
      ProfessionalInformationModel(
        userId: json["userID"],
        professionalIdNumber: json["professionalIDNumber"],
        qualfications: json["qualfications"],
        yearofExperience: json["yearofExperience"],
        areaOfFocus: json["areaOfFocus"],
        professionalApproach: json["professionalApproach"],
        languageSpoken: json["languageSpoken"],
      );

  Map<String, dynamic> toJson(String docID) => {
        "userID": docID,
        "professionalIDNumber": professionalIdNumber,
        "qualfications": qualfications,
        "yearofExperience": yearofExperience,
        "areaOfFocus": areaOfFocus,
        "professionalApproach": professionalApproach,
        "languageSpoken": languageSpoken,
      };
}
