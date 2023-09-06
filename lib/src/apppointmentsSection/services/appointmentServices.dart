import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saluswell_dietitan_app_updated/src/apppointmentsSection/providers/available_time_slots.dart';

import '../../../common/helperFunctions/getUserIDhelper.dart';
import '../../../common/helperFunctions/navigatorHelper.dart';
import '../../../common/helperFunctions/showsnackbar.dart';
import '../../../common/utils/appcolors.dart';
import '../../../common/utils/firebaseUtils.dart';
import '../../authenticationsection/Models/userModel.dart';
import '../models/appointmetntNewModel.dart';
import '../models/timeSlotModel.dart';

class AppointmentServices {
  ///Create Appointment
  Future createAppointment(AppointmentModelNew appointmentModel) async {
    DocumentReference docRef = FirebaseFirestore.instance
        .collection(FirebaseUtils.appointments)
        .doc(appointmentModel.appointmentId);
    return await docRef.set(appointmentModel.toJson(docRef.id));
  }

  /// stream appointments
  Stream<List<AppointmentModelNew>> streamAllAppointments(
      String appointmentStatus) {
    return FirebaseFirestore.instance
        .collection(FirebaseUtils.appointments)
        .where("appointmentStatus", isEqualTo: appointmentStatus)
        .where("DietitianID", isEqualTo: getUserID())
        .snapshots()
        .map((list) => list.docs
            .map((singleDoc) => AppointmentModelNew.fromJson(singleDoc.data()))
            .toList());
  }

  /// future pending appointments
  Future<List<AppointmentModelNew>> futurependingAppointments() async {
    //  print(myID);
    List<AppointmentModelNew> dataList = [];
    var snapData = await FirebaseFirestore.instance
        .collection(FirebaseUtils.appointments)
        .where('appointmentStatus', isEqualTo: "pending")
        .get();

    for (var singleDoc in snapData.docs) {
      dataList.add(AppointmentModelNew.fromJson(singleDoc.data()));
    }

    return dataList;
  }

  /// future progress appointments
  Future<List<AppointmentModelNew>> futureprogressAppointments() async {
    //  print(myID);
    List<AppointmentModelNew> dataList = [];
    var snapData = await FirebaseFirestore.instance
        .collection(FirebaseUtils.appointments)
        .where('appointmentStatus', isEqualTo: "progress")
        // .where('driverId', isEqualTo: UserService.userId)
        .get();

    for (var singleDoc in snapData.docs) {
      dataList.add(AppointmentModelNew.fromJson(singleDoc.data()));
    }

    return dataList;
  }

  /// future completed appointments
  Future<List<AppointmentModelNew>> futurecompletedAppointments() async {
    //  print(myID);
    List<AppointmentModelNew> dataList = [];
    var snapData = await FirebaseFirestore.instance
        .collection(FirebaseUtils.appointments)
        .where('appointmentStatus', isEqualTo: "completed")
        // .where('driverId', isEqualTo: UserService.userId)
        .get();

    for (var singleDoc in snapData.docs) {
      dataList.add(AppointmentModelNew.fromJson(singleDoc.data()));
    }

    return dataList;
  }

  /// update timeslots updated
  Future updateDietitianAvailiablity(UserModel userModel) async {
    return await FirebaseFirestore.instance
        .collection(FirebaseUtils.users)
        .doc(FirebaseAuth.instance.currentUser!.uid)

        //.where("userID", isEqualTo: date)
        .update({
      "availableDays": userModel.availableDays,
      "availabletimeSlots": userModel.availabletimeSlots,
    }).whenComplete(() {
      var provider = Provider.of<TimeSlotProvider>(
          navstate.currentState!.context,
          listen: false);
      provider.selectedDaysVar.clear();
      provider.selectedTimes.clear();
      provider.fetchDietitianAvailability(userModel.userId.toString());

      showSnackBarMessage(
          context: navstate.currentState!.context,
          content: "Availability Updated Successfully");
      Navigator.maybePop(navstate.currentState!.context);
    });
  }

  /// update timeslots updated
  Future UpdateAppointmentFromProgressToCompleted(
      AppointmentModelNew appointmentModelNew, String appointmentID) async {
    return await FirebaseFirestore.instance
        .collection(FirebaseUtils.appointments)
        .doc(appointmentID)

        //.where("userID", isEqualTo: date)
        .update({
      "appointmentStatus": FirebaseUtils.completed,
    });
  }

  /// create Time Slot
  Future createTimeSlot(
      TimeSlotModel timeSlotModel, String userID, String timestamp) async {
    // FirebaseFirestore.instance.collection("hello").doc().collection("12");
    DocumentReference docRef = FirebaseFirestore.instance
        .collection(FirebaseUtils.timeSlots)
        .doc(userID)
        .collection("dates")
        .doc(timestamp)
        .collection("timeslotdetails")
        .doc();
    return await docRef.set(timeSlotModel.toJson());
  }

  /// update timeslots
  Future updateTimeSlot(TimeSlotModel timeSlotModel, String userID, String date,
      String docID) async {
    return await FirebaseFirestore.instance
        .collection(FirebaseUtils.timeSlots)
        .doc(userID)
        .collection(FirebaseUtils.dates)
        .doc(date)
        .collection("timeslotdetails")
        .doc(docID)
        // .where("dateofslot", isEqualTo: date)
        .update({
      "startTime": timeSlotModel.startTime,
      "endTime": timeSlotModel.endTime,
    });
  }

  /// stream timeslots
  Stream<List<TimeSlotModel>> streamTimeSlots(String userID, String date) {
    return FirebaseFirestore.instance
        .collection(FirebaseUtils.timeSlots)
        .doc(userID)
        .collection(FirebaseUtils.dates)
        .doc(date)
        .collection("timeslotdetails")
        .where("dateofslot", isEqualTo: date)
        .snapshots()
        .map((list) => list.docs
            .map((singleDoc) =>
                TimeSlotModel.fromJson(singleDoc.data(), singleDoc.id))
            .toList());
  }

  ///Stream dates
  Future<List<TimeSlotModel>> futureDates() async {
    //  print(myID);
    List<TimeSlotModel> dataList = [];
    var snapData = await FirebaseFirestore.instance
        .collection(FirebaseUtils.timeSlots)
        .doc(getUserID())
        .collection(FirebaseUtils.dates)
        // .doc(date)
        // .collection("timeslotdetails")
        // .where("dateofslot", isEqualTo: date)
        .get();
    //  .snapshots();
    // .where('driverId', isEqualTo: UserService.userId)
    // .get();

    for (var singleDoc in snapData.docs) {
      dataList.add(TimeSlotModel.fromJson(singleDoc.data(), singleDoc.id));
    }

    return dataList;
  }

  ///Delete Slo
  Future deleteSlot(
      BuildContext context, String userID, String date, String docID) async {
    try {
      return await FirebaseFirestore.instance
          .collection(FirebaseUtils.timeSlots)
          .doc(userID)
          .collection(FirebaseUtils.dates)
          .doc(date)
          .collection("timeslotdetails")
          .doc(docID)
          .delete()
          .then((value) {
        showSnackBarMessage(
            backgroundcolor: AppColors.redcolor,
            contentColor: AppColors.whitecolor,
            context: context,
            content: "Slot Deleted Successfully");
        //  Navigator.maybePop(context);
      }).catchError((e) {
        showSnackBarMessage(context: context, content: e);
      });
    } on FirebaseFirestore catch (e) {
      showSnackBarMessage(context: context, content: e.toString());
    }
  }
}
