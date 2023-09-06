import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/helperFunctions/navigatorHelper.dart';
import '../../../common/helperFunctions/showsnackbar.dart';
import '../../apppointmentsSection/models/appointmetntNewModel.dart';
import '../../dashboardsection/screens/bottomNavScreen.dart';
import '../models/review_model.dart';
import '../services/review_services.dart';

class ReviewProvider extends ChangeNotifier {
  double? averageRating;
  double? itemCountVar;

  bool isLoading = false;

  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  ReviewServices reviewServices = ReviewServices();

  // updateAveragearting(List<ReviewModel> reviewslist) {
  //   var averageratingresult =
  //       reviewslist.map((m) => m.stars).reduce((a, b) => a + b) /
  //           reviewslist.length;
  //   // showSnackBarMessage(context: context, content: averageratingresult.toString());
  //
  //   averageRating = averageratingresult;
  //   notifyListeners();
  // }

  createReview(String dietianID, String patientID, String reviewDesc,
      String appointmentID, AppointmentModelNew appointmentModelNew) {
    if (itemCountVar == null) {
      showSnackBarMessage(
          context: navstate.currentState!.context,
          content: "kindly give rating");
      return;
    } else if (reviewDesc.isEmpty) {
      showSnackBarMessage(
          context: navstate.currentState!.context,
          content:
              "kindly write least 4 to 5 words about your experience with patient ");
      return;
    }

    try {
      makeLoadingTrue();
      reviewServices
          .createReview(ReviewModel(
              dietitianId: dietianID,
              patientId: patientID,
              reviewDescription: reviewDesc,
              reviewDate: Timestamp.now(),
              appointmentId: appointmentID,
              reviewStars: itemCountVar,
              patientName: appointmentModelNew.patientName,
              patientProfilePic: appointmentModelNew.patientProfilePic,
              dietitianName: appointmentModelNew.dietitianName,
              reviewRecieverID: patientID,
              dietitianProfilePic: appointmentModelNew.dietitianProfilePic))
          .then((value) {
        reviewServices.UpdateReviewStatusOfDietitan(
            appointmentModelNew, appointmentID);
        makeLoadingFalse();
        toNext(
            context: navstate.currentState!.context,
            widget: const BottomNavScreen(
                //  index: 1,
                ));
        var bottomnavProvider =
            Provider.of(navstate.currentState!.context, listen: false);
        bottomnavProvider.updateCurrentScreen(1);
        // Navigator.maybePop(navstate.currentState!.context);
        showSnackBarMessage(
            context: navstate.currentState!.context,
            content: "Review Given Successfully");
        itemCountVar == null;
        notifyListeners();
      });
    } catch (e) {
      makeLoadingFalse();
      showSnackBarMessage(
          context: navstate.currentState!.context, content: e.toString());
    }
  }
}
