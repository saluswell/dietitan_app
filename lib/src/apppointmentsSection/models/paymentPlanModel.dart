// To parse this JSON data, do
//
//     final payementPlansModel = payementPlansModelFromJson(jsonString);

import 'dart:convert';

PayementPlansModel payementPlansModelFromJson(String str) =>
    PayementPlansModel.fromJson(json.decode(str));

String payementPlansModelToJson(PayementPlansModel data) =>
    json.encode(data.toJson());

class PayementPlansModel {
  PayementPlansModel({this.visitPrice, this.timeDuration, this.visitType});

  String? visitPrice;
  String? timeDuration;
  String? visitType;

  factory PayementPlansModel.fromJson(Map<String, dynamic> json) =>
      PayementPlansModel(
        visitPrice: json["visitPrice"],
        timeDuration: json["TimeDuration"],
        visitType: json["visitType"],
      );

  Map<String, dynamic> toJson() => {
        "visitPrice": visitPrice,
        "TimeDuration ": timeDuration,
        "visitType": visitType,
      };
}
