// To parse this JSON data, do
//
//     final timeSlotModel = timeSlotModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//
// TimeSlotModel timeSlotModelFromJson(String str) =>
//     TimeSlotModel.fromJson(json.decode(str));

String timeSlotModelToJson(TimeSlotModel data) => json.encode(data.toJson());

class TimeSlotModel {
  TimeSlotModel(
      {this.timeslotId,
      this.startTime,
      this.endTime,
      this.dateofslot,
      this.dateOfSlotInTimeStamp});

  String? timeslotId;
  Timestamp? startTime;
  Timestamp? endTime;
  String? dateofslot;
  Timestamp? dateOfSlotInTimeStamp;

  factory TimeSlotModel.fromJson(Map<String, dynamic> json, String id) =>
      TimeSlotModel(
        timeslotId: id,
        startTime: json["startTime"],
        endTime: json["endTime"],
        dateofslot: json["dateofslot"],
        dateOfSlotInTimeStamp: json["dateOfSlotInTimeStamp"],
      );

  Map<String, dynamic> toJson() => {
        "timeslotID": timeslotId,
        "startTime": startTime,
        "endTime": endTime,
        "dateofslot": dateofslot,
        "dateOfSlotInTimeStamp": dateOfSlotInTimeStamp,
      };
}
