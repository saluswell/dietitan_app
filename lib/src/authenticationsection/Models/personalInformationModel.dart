// To parse this JSON data, do
//
//     final personalInformationModel = personalInformationModelFromJson(jsonString);

import 'dart:convert';

PersonalInformationModel personalInformationModelFromJson(String str) =>
    PersonalInformationModel.fromJson(json.decode(str));

String personalInformationModelToJson(PersonalInformationModel data) =>
    json.encode(data.toJson(data.userId.toString()));

class PersonalInformationModel {
  PersonalInformationModel({
    this.userId,
    this.title,
    this.firstName,
    this.lastName,
    this.mobileNumber,
    this.businessContact,
    this.adress,
    this.city,
    this.postalCode,
    this.province,
    this.country,
  });

  String? userId;
  String? title;
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? businessContact;
  String? adress;
  String? city;
  String? postalCode;
  String? province;
  String? country;

  factory PersonalInformationModel.fromJson(Map<String, dynamic> json) =>
      PersonalInformationModel(
        userId: json["userID"],
        title: json["title"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        mobileNumber: json["mobileNumber"],
        businessContact: json["businessContact"],
        adress: json["adress"],
        city: json["city"],
        postalCode: json["postalCode"],
        province: json["province"],
        country: json["country"],
      );

  Map<String, dynamic> toJson(String docID) => {
        "userID": docID,
        "title": title,
        "firstName": firstName,
        "lastName": lastName,
        "mobileNumber": mobileNumber,
        "businessContact": businessContact,
        "adress": adress,
        "city": city,
        "postalCode": postalCode,
        "province": province,
        "country": country,
      };
}
