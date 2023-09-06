import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

AddCarePlanModel noteModelFromJson(String str) =>
    AddCarePlanModel.fromJson(json.decode(str));

String noteModelToJson(AddCarePlanModel data) =>
    json.encode(data.toJson(data.planId.toString()));

class AddCarePlanModel {
  AddCarePlanModel({
    this.planId,
    this.patientId,
    this.appointmentId,
    this.dietitanId,
    this.assessment,
    this.conductedOn,
    this.relatedTo,
    this.evidenceBy,
    this.intervention,
    this.monitoring,
    this.diagnosisList,
  });

  String? planId;
  String? patientId;
  String? appointmentId;
  String? dietitanId;
  String? assessment;
  Timestamp? conductedOn;
  String? relatedTo;
  String? evidenceBy;
  String? intervention;
  String? monitoring;
  List<String>? diagnosisList; // Updated to retrieve from Firestore

  factory AddCarePlanModel.fromJson(Map<String, dynamic> json) =>
      AddCarePlanModel(
        planId: json["planId"],
        patientId: json["patientId"],
        appointmentId: json["appointmentId"],
        dietitanId: json["dietitanId"],
        assessment: json["assessment"],
        conductedOn: json["conductedOn"],
        relatedTo: json["relatedTo"],
        evidenceBy: json["evidenceBy"],
        intervention: json["intervention"],
        monitoring: json["monitoring"],
        diagnosisList: List<String>.from(
            json["diagnosisList"] ?? []), // Retrieve from Firestore
      );

  Map<String, dynamic> toJson(String docID) => {
        "planId": docID,
        "patientId": patientId,
        "appointmentId": appointmentId,
        "dietitanId": dietitanId,
        "assessment": assessment,
        "conductedOn": conductedOn,
        "relatedTo": relatedTo,
        "evidenceBy": evidenceBy,
        "intervention": intervention,
        "monitoring": monitoring,
        "diagnosisList": diagnosisList,
      };
}
