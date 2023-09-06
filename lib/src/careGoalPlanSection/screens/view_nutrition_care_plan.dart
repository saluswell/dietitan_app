import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/textfield_widget.dart';
import '../../apppointmentsSection/widgets/day_card_widget.dart';
import '../models/add_care_plan_model.dart';
import '../providers/nuttrition_Care_provider.dart';

class ViewNutritionCarePlan extends StatefulWidget {
  final AddCarePlanModel? addCarePlanModel;

  const ViewNutritionCarePlan({
    Key? key,
    this.addCarePlanModel,
  }) : super(key: key);

  @override
  State<ViewNutritionCarePlan> createState() => _ViewNutritionCarePlanState();
}

class _ViewNutritionCarePlanState extends State<ViewNutritionCarePlan> {
  TextEditingController relatedToController = TextEditingController();
  TextEditingController evidenceByController = TextEditingController();

  TextEditingController assesmentController = TextEditingController();
  TextEditingController interventionController = TextEditingController();
  TextEditingController monitoringController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    relatedToController =
        TextEditingController(text: widget.addCarePlanModel!.relatedTo);
    evidenceByController =
        TextEditingController(text: widget.addCarePlanModel!.evidenceBy);
    assesmentController =
        TextEditingController(text: widget.addCarePlanModel!.assessment);
    interventionController =
        TextEditingController(text: widget.addCarePlanModel!.intervention);
    monitoringController =
        TextEditingController(text: widget.addCarePlanModel!.monitoring);
  }

  @override
  Widget build(BuildContext context) {
    // final diagnosticProvider = Provider.of<DiagnosticProvider>(context);
    // final diagnosticStatements = diagnosticProvider.diagnosticStatements;
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
              children: [],
            ),
          ),
          appBar: AppBar(
            backgroundColor: AppColors.appcolor,
            title: Text(
              "View Care Plan Details",
              style: fontW5S12(context)!.copyWith(
                  fontSize: 14,
                  color: AppColors.whitecolor,
                  fontWeight: FontWeight.w600),
            ),
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
                        enabled: false,
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
                      height: 15,
                    ),
                    Text(
                      "Diagnosis",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 135,
                            child: GridView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: widget
                                  .addCarePlanModel!.diagnosisList!.length,
                              padding: EdgeInsets.only(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 2.5,
                              ),
                              itemBuilder: (context, index) {
                                // String day = timeSlotProvider.daysList1[index];
                                // bool isSelected =
                                //     timeSlotProvider.selectedDays.contains(day);

                                return GestureDetector(
                                  onTap: () {
                                    //  timeSlotProvider.toggleDay(day);
                                  },
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 5, bottom: 5),
                                      child: DayCardWidget(
                                          backGroundColor:
                                              AppColors.darkAppColor,
                                          text: widget.addCarePlanModel!
                                              .diagnosisList![index]
                                              .toString(),
                                          textColor: Colors.white)),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Related To",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFieldWidget(
                        showSuffixIcon: false,
                        controller: relatedToController,
                        textFieldHeight: 55,
                        maxlines: 1,
                        enabled: false,
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
                    Text(
                      "Evidenced By",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFieldWidget(
                        showSuffixIcon: false,
                        controller: evidenceByController,
                        textFieldHeight: 55,
                        maxlines: 1,
                        maxLengt: 30,
                        enabled: false,
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
                        enabled: false,
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
                        enabled: false,
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
