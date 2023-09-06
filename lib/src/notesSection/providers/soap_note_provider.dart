import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../common/helperFunctions/navigatorHelper.dart';
import '../../../common/helperFunctions/showsnackbar.dart';
import '../../../common/utils/appcolors.dart';
import '../models/noteModel.dart';
import '../services/note_services.dart';

class SoapNoteProvider extends ChangeNotifier {
  NoteServices noteServices = NoteServices();
  DateTime? conductedOn;
  TextEditingController patientNameController = TextEditingController();
  TextEditingController assignedHealthcarePractitioner =
      TextEditingController();
  TextEditingController subectiveController = TextEditingController();
  TextEditingController objectiveController = TextEditingController();
  TextEditingController assesmentController = TextEditingController();
  TextEditingController planController = TextEditingController();

  TextEditingController patientNameControlleredit = TextEditingController();
  TextEditingController assignedHealthcarePractitionerwedit =
      TextEditingController();
  TextEditingController subectiveControlleredit = TextEditingController();
  TextEditingController objectiveControlleredit = TextEditingController();
  TextEditingController assesmentControlleredit = TextEditingController();
  TextEditingController planControlleredit = TextEditingController();
  DateTime? startingDateTime;
  DateTime? endingDateTime;

  bool isLoading = false;

  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  createNote(
    String patientID,
    String appointmentID,
    String dietitianID,
  ) {
    // if(patientNameController.text.isEmpty)
    //   {
    //     showSnackBarMessage(context: navstate.currentState!.context, content: content);
    //   }
    try {
      makeLoadingTrue();

      noteServices
          .createSOAPNote(NoteModel(
              patientName: patientNameController.text,
              objective: objectiveController.text,
              subjective: subectiveController.text,
              plan: planController.text,
              assesment: assesmentController.text,
              patientId: patientID,
              appointmentId: appointmentID,
              conductedOn: Timestamp.fromDate(conductedOn!),
              dietitanId: dietitianID,
              healthcarepractitioner: assignedHealthcarePractitioner.text))
          .then((value) {
        makeLoadingFalse();
        patientNameController.clear();
        assignedHealthcarePractitioner.clear();
        conductedOn = null;
        subectiveController.clear();
        objectiveController.clear();
        assesmentController.clear();
        planController.clear();
        Navigator.maybePop(navstate.currentState!.context);

        showSnackBarMessage(
            backgroundcolor: AppColors.appcolor,
            contentColor: AppColors.whitecolor,
            context: navstate.currentState!.context,
            content: "SOAP Note Added Successfully");
      });
    } catch (e) {
      makeLoadingFalse();
      showSnackBarMessage(
          context: navstate.currentState!.context, content: e.toString());
      // TODO
    }
  }
}
