// To parse this JSON data, do
//
//     final paymentModel = paymentModelFromJson(jsonString);

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

PaymentModel paymentModelFromJson(String str) =>
    PaymentModel.fromJson(json.decode(str));

String paymentModelToJson(PaymentModel data) =>
    json.encode(data.toJson(data.paymentId.toString()));

class PaymentModel {
  PaymentModel({
    this.paymentId,
    this.paymentDateTime,
    this.totalAmount,
    this.senderId,
    this.senderName,
    this.senderpic,
    this.recieverId,
    this.reciverName,
    this.recieverPic,
    this.fees,
  });

  String? paymentId;
  Timestamp? paymentDateTime;
  String? totalAmount;
  String? senderId;
  String? senderName;
  String? senderpic;
  String? recieverId;
  String? reciverName;
  String? recieverPic;
  String? fees;

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        paymentId: json["paymentID"],
        paymentDateTime: json["paymentDateTime"],
        totalAmount: json["totalAmount"],
        senderId: json["senderID"],
        senderName: json["senderName"],
        senderpic: json["senderpic"],
        recieverId: json["recieverID"],
        reciverName: json["reciverName"],
        recieverPic: json["recieverPic"],
        fees: json["fees"],
      );

  Map<String, dynamic> toJson(String id) => {
        "paymentID": id,
        "paymentDateTime": paymentDateTime,
        "totalAmount": totalAmount,
        "senderID": senderId,
        "senderName": senderName,
        "senderpic": senderpic,
        "recieverID": recieverId,
        "reciverName": reciverName,
        "recieverPic": recieverPic,
        "fees": fees,
      };
}
