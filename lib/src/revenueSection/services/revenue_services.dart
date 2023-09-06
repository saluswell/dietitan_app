import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_format/date_time_format.dart';

import '../../../common/helperFunctions/getUserIDhelper.dart';
import '../../../common/utils/firebaseUtils.dart';
import '../models/revenue_data.dart';

class RevenueServices {
  // Stream<List<RevenueData>> streamsPaymentsChartData() {
  //   return FirebaseFirestore.instance
  //       .collection(FirebaseUtils.paymenthistory)
  //       .where("recieverID", isEqualTo: getUserID())
  //       //.where("isApprovedByAdmin", isEqualTo: isApprove)
  //       .snapshots()
  //       .map((querySnapshot) {
  //     List<RevenueData> revenueDataList = [];
  //     Map<String, double> monthlyRevenueMap = {};
  //
  //     for (var doc in querySnapshot.docs) {
  //       String revenue =
  //           doc['totalAmount']; // Adjust this based on your data structure
  //       Timestamp monthYear =
  //           doc['paymentDateTime']; // Adjust this based on your data structure
  //
  //       dp(msg: "total Amount", arg: revenue.toString());
  //       dp(msg: "paymentDateTime", arg: monthYear.toString());
  //
  //       String month = monthYear.split('-')[1];
  //       double currentMonthRevenue = monthlyRevenueMap[month] ?? 0;
  //       monthlyRevenueMap[month] = currentMonthRevenue + double.parse(revenue);
  //
  //       revenueDataList.add(RevenueData(monthYear, revenue));
  //     }
  //
  //     return revenueDataList;
  //   });
  // }

  Stream<List<RevenueData>> streamsPaymentsChartData() {
    return FirebaseFirestore.instance
        .collection(FirebaseUtils.paymenthistory)
        .where("recieverID", isEqualTo: getUserID())
        //.where("isApprovedByAdmin", isEqualTo: isApprove)
        .snapshots()
        .map((querySnapshot) {
      Map<String, double> monthlyRevenueMap = {};

      for (var doc in querySnapshot.docs) {
        String revenue =
            doc['totalAmount']; // Adjust this based on your data structure
        Timestamp timestamp =
            doc['paymentDateTime']; // Adjust this based on your data structure

        DateTime dateTime = timestamp.toDate();
        String monthYear = dateTime.format("M");
        //'${dateTime.year}-${dateTime.month}';

        double currentMonthRevenue = monthlyRevenueMap[monthYear] ?? 0;
        monthlyRevenueMap[monthYear] =
            currentMonthRevenue + double.parse(revenue);
      }

      List<RevenueData> revenueDataList = monthlyRevenueMap.entries
          .map((entry) => RevenueData(entry.key, entry.value.toString()))
          .toList();

      return revenueDataList;
    });
  }
}
