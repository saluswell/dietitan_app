// To parse this JSON data, do
//
//     final noteModel = noteModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

NoteModel noteModelFromJson(String str) => NoteModel.fromJson(json.decode(str));

String noteModelToJson(NoteModel data) => json.encode(data.toJson());

class NoteModel {
  NoteModel(
      {this.noteId,
      this.patientId,
      this.appointmentId,
      this.dietitanId,
      this.patientName,
      this.conductedOn,
      this.subjective,
      this.objective,
      this.assesment,
      this.plan,
      this.healthcarepractitioner});

  String? noteId;
  String? patientId;
  String? appointmentId;
  String? dietitanId;
  String? patientName;
  Timestamp? conductedOn;
  String? subjective;
  String? objective;
  String? assesment;
  String? plan;
  String? healthcarepractitioner;

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        noteId: json["noteID"],
        patientId: json["patientID"],
        appointmentId: json["appointmentID"],
        dietitanId: json["dietitanID"],
        patientName: json["patientName "],
        conductedOn: json["conductedOn "],
        subjective: json["subjective "],
        objective: json["objective "],
        assesment: json["assesment "],
        plan: json["plan "],
        healthcarepractitioner: json["healthcarepractitioner "],
      );

  Map<String, dynamic> toJson() => {
        "noteID": noteId,
        "patientID": patientId,
        "appointmentID": appointmentId,
        "dietitanID": dietitanId,
        "patientName ": patientName,
        "conductedOn ": conductedOn,
        "subjective ": subjective,
        "objective ": objective,
        "assesment ": assesment,
        "plan ": plan,
        "healthcarepractitioner ": healthcarepractitioner,
      };
}
