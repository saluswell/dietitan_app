import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/helperFunctions/navigatorHelper.dart';
import '../../../../common/utils/appcolors.dart';
import '../../../../common/utils/themes.dart';
import '../../../../common/widgets/textfield_widget.dart';
import '../../models/noteModel.dart';
import '../../providers/soap_note_provider.dart';

class EditViewSoapNote extends StatefulWidget {
  final NoteModel? noteModel;

  const EditViewSoapNote({
    Key? key,
    this.noteModel,
  }) : super(key: key);

  @override
  State<EditViewSoapNote> createState() => _EditViewSoapNoteState();
}

class _EditViewSoapNoteState extends State<EditViewSoapNote> {
  final _formKey = GlobalKey<FormState>();
  var noteProvider =
      Provider.of<SoapNoteProvider>(navstate.currentState!.context);

  @override
  void initState() {
    // TODO: implement initState
    noteProvider.patientNameControlleredit =
        TextEditingController(text: widget.noteModel!.patientName);
    noteProvider.assignedHealthcarePractitionerwedit =
        TextEditingController(text: widget.noteModel!.healthcarepractitioner);
    noteProvider.subectiveControlleredit =
        TextEditingController(text: widget.noteModel!.subjective);
    noteProvider.objectiveControlleredit =
        TextEditingController(text: widget.noteModel!.objective);
    noteProvider.assesmentControlleredit =
        TextEditingController(text: widget.noteModel!.assesment);
    noteProvider.planControlleredit =
        TextEditingController(text: widget.noteModel!.plan);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SoapNoteProvider>(builder: (context, soapNoteProvider, __) {
      return Scaffold(
        // floatingActionButton: SingleChildScrollView(
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.only(left: 30),
        //         child: InkWell(
        //           onTap: () async {
        //             // if (_formKey.currentState!.validate()) {
        //             //   soapNoteProvider.createNote(widget.patientID,
        //             //       widget.appointmentID, widget.dietitianID);
        //             // }
        //
        //             //    toNext(context: context, widget: HomeSignalling());
        //           },
        //           child: Container(
        //             decoration: BoxDecoration(
        //               color: AppColors.appcolor,
        //               borderRadius: BorderRadius.circular(13),
        //             ),
        //             height: 60,
        //             child: Center(
        //               child: Text(
        //                 "Add Note",
        //                 style: fontW5S12(context)!.copyWith(
        //                     fontSize: 16,
        //                     color: AppColors.whitecolor,
        //                     fontWeight: FontWeight.w500),
        //               ),
        //             ),
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        // resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: AppColors.appcolor,
          title: Text(
            "Details of SOAP Note",
            style: fontW5S12(context)!.copyWith(
                fontSize: 14,
                color: AppColors.whitecolor,
                fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Patient Name",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFieldWidget(
                      showSuffixIcon: false,
                      enabled: false,
                      controller: soapNoteProvider.patientNameControlleredit,
                      textFieldHeight: 55,
                      maxlines: 1,
                      maxLengt: 30,
                      toppadding: 18,
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return "Patient Name is required";
                        }
                        return null;
                      },
                      hintText: "Enter Patient Name",
                      textInputType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Assigned Healthcare Practitioner",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFieldWidget(
                      showSuffixIcon: false,
                      enabled: false,
                      controller:
                          soapNoteProvider.assignedHealthcarePractitionerwedit,
                      textFieldHeight: 55,
                      maxlines: 1,
                      maxLengt: 30,
                      toppadding: 18,
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return "Assigned Healthcare Practitioner is required";
                        }
                        return null;
                      },
                      hintText: "Assigned Healthcare Practitioner",
                      textInputType: TextInputType.emailAddress),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Conducted on",
                            style: fontW5S12(context)!.copyWith(
                                fontSize: 14,
                                color: AppColors.blackcolor,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              soapNoteProvider.conductedOn == null
                                  ? Text(
                                      widget.noteModel!.conductedOn!
                                          .toDate()
                                          .format(DateTimeFormats.american)
                                          .replaceAll("12:00 am", ""),
                                      style: fontW5S12(context)!.copyWith(
                                          fontSize: 12,
                                          color: AppColors.blackcolor
                                              .withOpacity(0.4),
                                          fontWeight: FontWeight.w600),
                                    )
                                  : Text(
                                      soapNoteProvider.conductedOn!
                                          .format(DateTimeFormats.american)
                                          .replaceAll("12:00 am", ""),
                                      style: fontW5S12(context)!.copyWith(
                                          fontSize: 12,
                                          color: AppColors.blackcolor
                                              .withOpacity(0.4),
                                          fontWeight: FontWeight.w600),
                                    ),
                              IconButton(
                                onPressed: () async {
                                  // DateTime? pickedDate = await showDatePicker(
                                  //     context: context,
                                  //     initialDate: DateTime.now(),
                                  //
                                  //     //get today's date
                                  //     firstDate: DateTime(2000),
                                  //
                                  //     //DateTime.now() - not to allow to choose before today.
                                  //     lastDate: DateTime(2101));
                                  // setState(() {
                                  //   soapNoteProvider.conductedOn = pickedDate;
                                  // });
                                },
                                icon: const Icon(
                                  Icons.calendar_month,
                                  color: AppColors.appcolor,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Subjective",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFieldWidget(
                      showSuffixIcon: false,
                      controller: soapNoteProvider.subectiveControlleredit,
                      textFieldHeight: 50,
                      maxlines: 10,
                      enabled: false,
                      maxLengt: 200,
                      toppadding: 18,
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return "Subjective is required";
                        }
                        return null;
                      },
                      hintText: "What the patient tells you",
                      textInputType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Objective",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFieldWidget(
                      showSuffixIcon: false,
                      controller: soapNoteProvider.objectiveControlleredit,
                      textFieldHeight: 50,
                      maxlines: 10,
                      enabled: false,
                      maxLengt: 200,
                      toppadding: 18,
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return "Objective is required";
                        }
                        return null;
                      },
                      hintText: "What you see",
                      textInputType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Assessment",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFieldWidget(
                      showSuffixIcon: false,
                      controller: soapNoteProvider.assesmentControlleredit,
                      textFieldHeight: 50,
                      maxlines: 10,
                      maxLengt: 200,
                      enabled: false,
                      toppadding: 18,
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return "Assessment is required";
                        }
                        return null;
                      },
                      hintText: "What you think is going on",
                      textInputType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Plan",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFieldWidget(
                      showSuffixIcon: false,
                      controller: soapNoteProvider.planControlleredit,
                      textFieldHeight: 50,
                      maxlines: 10,
                      enabled: false,
                      maxLengt: 200,
                      toppadding: 18,
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return "Plan is required";
                        }
                        return null;
                      },
                      hintText: "What you will do about it",
                      textInputType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
