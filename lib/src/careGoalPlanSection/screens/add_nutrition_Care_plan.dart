import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/textfield_widget.dart';
import '../providers/nuttrition_Care_provider.dart';

class AddNutritionCarePlan extends StatefulWidget {
  final String patientID;
  final String dietitianID;
  final String appointmentID;

  const AddNutritionCarePlan(
      {Key? key,
      required this.patientID,
      required this.dietitianID,
      required this.appointmentID})
      : super(key: key);

  @override
  State<AddNutritionCarePlan> createState() => _AddNutritionCarePlanState();
}

class _AddNutritionCarePlanState extends State<AddNutritionCarePlan> {
  TextEditingController relatedToController = TextEditingController();
  TextEditingController evidenceByController = TextEditingController();

  TextEditingController assesmentController = TextEditingController();
  TextEditingController interventionController = TextEditingController();
  TextEditingController monitoringController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final diagnosticProvider = Provider.of<DiagnosticProvider>(context);
    final diagnosticStatements = diagnosticProvider.diagnosticStatements;
    return Consumer<DiagnosticProvider>(
        builder: (context, nutritionCareProvider, __) {
      return LoadingOverlay(
        isLoading: nutritionCareProvider.isLoading,
        progressIndicator: const SpinKitPouringHourGlass(
          size: 30,
          color: AppColors.appcolor,
        ),
        child: Scaffold(
          floatingActionButton: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        nutritionCareProvider.createCarePlanProvider(
                            widget.patientID,
                            widget.appointmentID,
                            widget.dietitianID,
                            assesmentController.text,
                            evidenceByController.text,
                            relatedToController.text,
                            interventionController.text,
                            monitoringController.text);
                      }

                      //    toNext(context: context, widget: HomeSignalling());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.appcolor,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      height: 60,
                      child: Center(
                        child: Text(
                          "Add Care Plan",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 16,
                              color: AppColors.whitecolor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: AppColors.appcolor,
            title: Text(
              " Add Nutrition Care Plan",
              style: fontW5S12(context)!.copyWith(
                  fontSize: 14,
                  color: AppColors.whitecolor,
                  fontWeight: FontWeight.w600),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    // toNext(
                    //     context: context,
                    //     widget: AddSoapNote(
                    //       patientID: widget.patientID,
                    //       dietitianID: widget.dietitianID,
                    //       appointmentID: widget.appointmentID,
                    //     ));
                  },
                  icon: Icon(Icons.add)),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "ASSESSMENT AND REASSESSMENT",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                        showSuffixIcon: false,
                        controller: assesmentController,
                        textFieldHeight: 55,
                        maxlines: 5,
                        maxLengt: 30,
                        toppadding: 18,
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return "Assessment is required";
                          }
                          return null;
                        },
                        hintText: "Write Assessment and Reassessment",
                        textInputType: TextInputType.emailAddress),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Diagnosis",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(33),
                                    topLeft: Radius.circular(33))),
                            builder: (BuildContext context) {
                              return Consumer<DiagnosticProvider>(
                                  builder: (context, diagnosticProvider, __) {
                                return Container(
                                  height: 600,
                                  // Adjust the height as needed
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Center(
                                        child: Text(
                                          "Diagnosis",
                                          style: fontW5S12(context)!.copyWith(
                                              fontSize: 14,
                                              color: AppColors.blackcolor,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount:
                                              diagnosticStatements.length,
                                          itemBuilder: (context, index) {
                                            final statement =
                                                diagnosticStatements[index];
                                            return ExpansionTile(
                                              title: Text(
                                                statement.title,
                                                style: fontW5S12(context)!
                                                    .copyWith(
                                                        fontSize: 13,
                                                        color: AppColors
                                                            .blackcolor,
                                                        fontWeight:
                                                            FontWeight.w600),
                                              ),
                                              children: statement.subStatements
                                                  .map((subStatement) =>
                                                      SizedBox(
                                                        height: 40,
                                                        child: CheckboxListTile(
                                                          title: Text(
                                                            subStatement,
                                                            style: fontW5S12(
                                                                    context)!
                                                                .copyWith(
                                                                    fontSize:
                                                                        11,
                                                                    color: AppColors
                                                                        .blackcolor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                          ),
                                                          value: diagnosticProvider
                                                              .isSelected(
                                                                  subStatement),
                                                          onChanged: (value) {
                                                            diagnosticProvider
                                                                .toggleSelection(
                                                                    subStatement);
                                                          },
                                                        ),
                                                      ))
                                                  .toList(),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                            });
                      },
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11)),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Select",
                                  style: fontW5S12(context)!.copyWith(
                                      fontSize: 14,
                                      color: AppColors.blackcolor,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFieldWidget(
                        showSuffixIcon: false,
                        controller: relatedToController,
                        textFieldHeight: 55,
                        maxlines: 1,
                        maxLengt: 30,
                        toppadding: 18,
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return "Related To  is required";
                          }
                          return null;
                        },
                        hintText: "Related To",
                        textInputType: TextInputType.emailAddress),
                    SizedBox(
                      height: 15,
                    ),
                    TextFieldWidget(
                        showSuffixIcon: false,
                        controller: evidenceByController,
                        textFieldHeight: 55,
                        maxlines: 1,
                        maxLengt: 30,
                        toppadding: 18,
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return "Evidenced by is required";
                          }
                          return null;
                        },
                        hintText: "As Evidenced By",
                        textInputType: TextInputType.emailAddress),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "INTERVENTION",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                        showSuffixIcon: false,
                        controller: interventionController,
                        textFieldHeight: 55,
                        maxlines: 5,
                        maxLengt: 30,
                        toppadding: 18,
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return "Intervention is required";
                          }
                          return null;
                        },
                        hintText: "Write Intervention",
                        textInputType: TextInputType.emailAddress),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "MONITORING AND EVALUATION",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                        showSuffixIcon: false,
                        controller: monitoringController,
                        textFieldHeight: 55,
                        maxlines: 5,
                        maxLengt: 30,
                        toppadding: 18,
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return "Monitoring and Evaluation is required";
                          }
                          return null;
                        },
                        hintText: "Write Monitoring and Evaluation",
                        textInputType: TextInputType.emailAddress),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
