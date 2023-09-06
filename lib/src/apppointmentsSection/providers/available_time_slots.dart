import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saluswell_dietitan_app_updated/common/helperFunctions/showsnackbar.dart';
import 'package:saluswell_dietitan_app_updated/common/utils/appcolors.dart';
import 'package:saluswell_dietitan_app_updated/src/apppointmentsSection/services/appointmentServices.dart';

import '../../../common/helperFunctions/navigatorHelper.dart';
import '../../authenticationsection/Models/userModel.dart';

class TimeSlotProvider with ChangeNotifier {
  AppointmentServices appointmentServices = AppointmentServices();
  bool isLoading = false;

  makeLoadingTrue() {
    Future.delayed(Duration(milliseconds: 1)).whenComplete(() {
      isLoading = true;
      notifyListeners();
    });
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  UserModel? userModel;

  Future<void> fetchDietitianAvailability(String userId) async {
    try {
      makeLoadingTrue();
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (documentSnapshot.exists) {
        makeLoadingFalse();
        userModel =
            UserModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
        dp(msg: "dietitian data", arg: userModel!.userName.toString());
        if (userModel!.availableDays != null &&
            userModel!.availabletimeSlots != null) {
          dp(
              msg: "available days",
              arg: userModel!.availableDays!.toList().toString());

          addSelectedDaysFromSeverToLocalList();

          dp(
              msg: "available time slots",
              arg: userModel!.availabletimeSlots!.toList().toString());

          addSelectedDTimeSlotsFromSeverToLocalList();
        }
      } else {
        makeLoadingFalse();
        // userModel=null;
      }

      notifyListeners();
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  ///---------------Updated Available Days  functionality -----------------------

  addSelectedDaysFromSeverToLocalList() {
    userModel!.availableDays!.forEach((element) {
      selectedDaysVar.add(element);
    });
    dp(
        msg: "local list of selected days var",
        arg: selectedDaysVar.toList().toString());
  }

  final List<String> daysList1 = [
    'MON',
    'TUE',
    'WED',
    'THR',
    'FRI',
    'SAT',
    'SUN',
  ];

  List<String> selectedDaysVar = []; // To store the selected days

  List<String> get selectedDays => selectedDaysVar;

  void toggleDay(String day) {
    if (selectedDaysVar.contains(day)) {
      selectedDaysVar.remove(day);
    } else {
      selectedDaysVar.add(day);
    }
    notifyListeners();
  }

  updateTimeSlot() {
    if (selectedDaysVar.isEmpty) {
      showSnackBarMessage(
          context: navstate.currentState!.context,
          backgroundcolor: AppColors.redcolor,
          content: "Please Select Days");
    } else if (selectedTimes.isEmpty) {
      showSnackBarMessage(
          context: navstate.currentState!.context,
          backgroundcolor: AppColors.redcolor,
          content: "Please Select Available TimeSlots");
    } else {
      try {
        makeLoadingTrue();
        appointmentServices.updateDietitianAvailiablity(UserModel(
            availableDays: selectedDaysVar, availabletimeSlots: selectedTimes));
      } catch (e) {
        showSnackBarMessage(
            context: navstate.currentState!.context, content: e.toString());
        // TODO
      }
    }
  }

  ///---------------------time slots functionality ----------------------

  addSelectedDTimeSlotsFromSeverToLocalList() {
    userModel!.availabletimeSlots!.forEach((element) {
      Timestamp firestoreTimestamp = element;
      DateTime dateTime = firestoreTimestamp.toDate();
      dp(msg: "date time while converting", arg: dateTime.toString());

      selectedTimes.add(dateTime);
    });
    dp(
        msg: "local list of selected time slots var",
        arg: selectedTimes.toList().toString());
  }

  List<DateTime> selectedTimes = [];

  void toggleTimeSelection(DateTime time) {
    if (selectedTimes.contains(time)) {
      selectedTimes.remove(time);
    } else {
      selectedTimes.add(time);
    }
    notifyListeners();
  }
}
