// To parse this JSON data, do
//
//     final bankingInformationModel = bankingInformationModelFromJson(jsonString);

import 'dart:convert';

BankingInformationModel bankingInformationModelFromJson(String str) =>
    BankingInformationModel.fromJson(json.decode(str));

String bankingInformationModelToJson(BankingInformationModel data) =>
    json.encode(data.toJson(data.userId.toString()));

class BankingInformationModel {
  BankingInformationModel({
    this.userId,
    this.bankBrachName,
    this.accountType,
    this.accountNumber,
    this.transitNumber,
    this.financialInstitutionNumber,
  });

  String? userId;
  String? bankBrachName;
  String? accountType;
  String? accountNumber;
  String? transitNumber;
  String? financialInstitutionNumber;

  factory BankingInformationModel.fromJson(Map<String, dynamic> json) =>
      BankingInformationModel(
        userId: json["userID"],
        bankBrachName: json["bankBrachName"],
        accountType: json["accountType"],
        accountNumber: json["accountNumber"],
        transitNumber: json["transitNumber"],
        financialInstitutionNumber: json["financialInstitutionNumber"],
      );

  Map<String, dynamic> toJson(String docID) => {
        "userID": docID,
        "bankBrachName": bankBrachName,
        "accountType": accountType,
        "accountNumber": accountNumber,
        "transitNumber": transitNumber,
        "financialInstitutionNumber": financialInstitutionNumber,
      };
}
