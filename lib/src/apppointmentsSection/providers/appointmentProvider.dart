import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../common/helperFunctions/getUserIDhelper.dart';
import '../../../common/helperFunctions/navigatorHelper.dart';
import '../../../common/helperFunctions/showsnackbar.dart';
import '../models/appointmetntNewModel.dart';
import '../models/timeSlotModel.dart';
import '../services/appointmentServices.dart';

class AppointmentProvider extends ChangeNotifier {
  Timer? countdownTimer;
  Duration? myDuration;
  int? daysvar;
  int? hoursvar;
  int? minutesvar;
  int? secondsvar;

  DateRangePickerController datePickerControllerfortimeslot =
      DateRangePickerController();
  AppointmentServices appointmentServices = AppointmentServices();
  List<dynamic> availableDays = [];
  List<dynamic> availableSlots = [];

  List<DateTime>? timslotList = [];

  List<dynamic> pendingAppointmentList = [];
  List<dynamic> progressAppointmentList = [];
  List<dynamic> completedAppointmentList = [];

  TimeOfDay? startingSelectedTime;
  TimeOfDay? endingSelectedTime;
  bool isLoading = false;

  DateTime? startingDateTime;
  DateTime? endingDateTime;

  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  void onSelectionChanged(
    DateRangePickerSelectionChangedArgs args,
  ) {
    datePickerControllerfortimeslot.selectedDate;
    notifyListeners();
    // mergeDateAndTime();

// TODO: implement your code here
  }

  /// get pending appointments lists
  getpendingAppointments() async {
    pendingAppointmentList =
        await appointmentServices.futurependingAppointments();
  }

  /// get pending appointments lists
  getprogressAppointments() async {
    progressAppointmentList =
        await appointmentServices.futureprogressAppointments();
  }

  /// get completed appointments lists
  getcompletedAppointments() async {
    completedAppointmentList =
        await appointmentServices.futurecompletedAppointments();
  }

  ///update appointmnet from progress to completed
  updateAppointmentFromProgressToCompleted(
      AppointmentModelNew appointmentModelNew, String appointmentID) {
    try {
      appointmentServices.UpdateAppointmentFromProgressToCompleted(
              appointmentModelNew, appointmentID)
          .then((value) {
        showSnackBarMessage(
            context: navstate.currentState!.context,
            content: "Appointment Completed Successfully");
        Navigator.maybePop(navstate.currentState!.context);
      });
    } catch (e) {
      showSnackBarMessage(
          context: navstate.currentState!.context, content: e.toString());
      // TODO
    }
  }

  updateDayHoursMinutes(DateTime combineDateTime) {
    daysvar = combineDateTime
        .subtract(Duration(
            days: DateTime.now().day,
            hours: DateTime.now().hour,
            minutes: DateTime.now().minute,
            seconds: DateTime.now().second,
            milliseconds: 0,
            microseconds: 0))
        .day;
    hoursvar = combineDateTime
        .subtract(Duration(
            days: DateTime.now().day,
            hours: DateTime.now().hour,
            minutes: DateTime.now().minute,
            seconds: DateTime.now().second,
            milliseconds: 0,
            microseconds: 0))
        .hour;
    minutesvar = combineDateTime
        .subtract(Duration(
            days: DateTime.now().day,
            hours: DateTime.now().hour,
            minutes: DateTime.now().minute,
            seconds: DateTime.now().second,
            milliseconds: 0,
            microseconds: 0))
        .minute;
    secondsvar = combineDateTime
        .subtract(Duration(
            days: DateTime.now().day,
            hours: DateTime.now().hour,
            minutes: DateTime.now().minute,
            seconds: DateTime.now().second,
            milliseconds: 0,
            microseconds: 0))
        .second;

    updateDuration();
    notifyListeners();
  }

  updateDuration() {
    myDuration = Duration(
        days: daysvar!,
        hours: hoursvar!,
        minutes: minutesvar!,
        seconds: secondsvar!,
        milliseconds: 0,
        microseconds: 0);
    notifyListeners();
    startTimer();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    print("stop timer called");
    countdownTimer!.cancel();

    daysvar = null;
    hoursvar = null;
    minutesvar = null;
    secondsvar = null;
    notifyListeners();
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    myDuration = Duration(days: 5);
    notifyListeners();
  }

  // Step 6
  void setCountDown() {
    final reduceSecondsBy = 1;

    final seconds = myDuration!.inSeconds - reduceSecondsBy;
    if (seconds < 0) {
      countdownTimer!.cancel();
    } else {
      myDuration = Duration(seconds: seconds);
    }
    notifyListeners();
  }

  addOrRemoveAvailableDays(context, String accessory) async {
    if (availableDays.contains(accessory)) {
      availableDays.remove(accessory);
      notifyListeners();
    } else {
      availableDays.add(accessory);
      notifyListeners();
    }
  }

  addOrRemoveAvailableTimeSlots(context, String accessory) async {
    if (availableSlots.contains(accessory)) {
      availableSlots.remove(accessory);
      notifyListeners();
    } else {
      availableSlots.add(accessory);
      notifyListeners();
    }
  }

  getAllTimeSlots(String date) {
    appointmentServices.futureDates();
  }

  updateStartingTime(val) {
    // dp(msg: "Start time", arg: val.toString());
    startingSelectedTime = val;
    var startTime = DateTime(2022, 1, 1, startingSelectedTime!.hour,
        startingSelectedTime!.minute, 0, 0, 0);

    startingDateTime = startTime;
    notifyListeners();
  }

  updateEndingTime(val) {
    //dp(msg: "End time", arg: val.toString());
    endingSelectedTime = val;

    var endTime = DateTime(2022, 1, 1, endingSelectedTime!.hour,
        endingSelectedTime!.minute, 0, 0, 0);

    endingDateTime = endTime;
    notifyListeners();
  }

  getCalendarDates() async {
    //  timslotList =
    var list = await appointmentServices.futureDates();
    list.forEach((element) {
      timslotList!.add(element.dateOfSlotInTimeStamp!.toDate());
    });
    notifyListeners();
  }

  createSlot() {
    try {
      makeLoadingTrue();
      appointmentServices
          .createTimeSlot(
              TimeSlotModel(
                  startTime: Timestamp.fromDate(startingDateTime!),
                  endTime: Timestamp.fromDate(endingDateTime!),
                  dateofslot:
                      datePickerControllerfortimeslot.selectedDate.toString(),
                  dateOfSlotInTimeStamp: Timestamp.fromDate(
                      datePickerControllerfortimeslot.selectedDate!)

                  // dateofslot: Timestamp.fromDate(
                  //     datePickerControllerfortimeslot.selectedDate!)

                  ),
              getUserID(),
              datePickerControllerfortimeslot.selectedDate.toString())
          .then((value) {
        makeLoadingFalse();
        Navigator.maybePop(navstate.currentState!.context);
        startingSelectedTime = null;
        endingSelectedTime = null;
        showSnackBarMessage(
            context: navstate.currentState!.context,
            content: "Time Slot Added SuccessFully to this Date ");
      });
    } catch (e) {
      showSnackBarMessage(
          context: navstate.currentState!.context, content: e.toString());
    }
  }

  ///delete slot
  deleteSlot(String userID, String date, String docID) {
    appointmentServices.deleteSlot(
        navstate.currentState!.context, userID, date, docID);
  }

  /// update timeSlot

  updateSlot(DateTime startTime, DateTime endTime, String date, String docID) {
    try {
      makeLoadingTrue();
      appointmentServices
          .updateTimeSlot(
              TimeSlotModel(
                startTime: startingDateTime == null
                    ? Timestamp.fromDate(startTime)
                    : Timestamp.fromDate(startingDateTime!),
                endTime: endingDateTime == null
                    ? Timestamp.fromDate(endTime)
                    : Timestamp.fromDate(endingDateTime!),
              ),
              getUserID(),
              date,
              docID)
          .then((value) {
        makeLoadingFalse();
        Navigator.maybePop(navstate.currentState!.context);
        startingSelectedTime = null;
        endingSelectedTime = null;
        showSnackBarMessage(
            context: navstate.currentState!.context,
            content: "Slot Updated Successfully");
      });
    } catch (e) {
      makeLoadingFalse();
      showSnackBarMessage(
          context: navstate.currentState!.context, content: e.toString());
    }
  }
}
