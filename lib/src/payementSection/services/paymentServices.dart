import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../common/helperFunctions/getUserIDhelper.dart';
import '../../../common/utils/firebaseUtils.dart';
import '../models/paymentModel.dart';

class PaymentServices {
  ///Create payment
  Future createPayment(PaymentModel paymentModel) async {
    DocumentReference docRef = FirebaseFirestore.instance
        .collection(FirebaseUtils.paymenthistory)
        .doc(paymentModel.paymentId);
    return await docRef.set(paymentModel.toJson(docRef.id));
  }

  /// Stream payments of dietitian or revenue
  Stream<List<PaymentModel>> streamsPaymentsList() {
    //  try {
    return FirebaseFirestore.instance
        .collection(FirebaseUtils.paymenthistory)
        .where("recieverID", isEqualTo: getUserID())
        //.where("isApprovedByAdmin", isEqualTo: isApprove)
        .snapshots()
        .map((list) => list.docs
            .map((singleDoc) => PaymentModel.fromJson(singleDoc.data()))
            .toList());
  }

  calculateTotalRevenue(List<PaymentModel> revenueList) {
    double totalAmount = revenueList.fold(
        0.0,
        (previousValue, payment) =>
            previousValue + double.parse(payment.totalAmount.toString()));

    return totalAmount;
  }
}
