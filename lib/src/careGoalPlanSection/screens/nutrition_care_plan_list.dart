import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:saluswell_dietitan_app_updated/src/careGoalPlanSection/models/add_care_plan_model.dart';
import 'package:saluswell_dietitan_app_updated/src/careGoalPlanSection/services/nutrition_care_plan_service.dart';

import '../../../common/helperFunctions/navigatorHelper.dart';
import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../widgets/care_plan_list_widget.dart';
import 'add_nutrition_Care_plan.dart';

class NutritionCarePlan extends StatefulWidget {
  final String patientID;
  final String dietitianID;
  final String appointmentID;

  const NutritionCarePlan(
      {Key? key,
      required this.patientID,
      required this.dietitianID,
      required this.appointmentID})
      : super(key: key);

  @override
  State<NutritionCarePlan> createState() => _NutritionCarePlanState();
}

class _NutritionCarePlanState extends State<NutritionCarePlan> {
  NutritionCarePlanService nutritionCarePlanService =
      NutritionCarePlanService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appcolor,
        title: Text(
          "Nutrition Care Plans",
          style: fontW5S12(context)!.copyWith(
              fontSize: 14,
              color: AppColors.whitecolor,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
              onPressed: () {
                toNext(
                    context: context,
                    widget: AddNutritionCarePlan(
                      patientID: widget.patientID,
                      dietitianID: widget.dietitianID,
                      appointmentID: widget.appointmentID,
                    ));
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          StreamProvider.value(
              value: nutritionCarePlanService.streamCarePlans(),
              initialData: [AddCarePlanModel()],
              builder: (context, child) {
                List<AddCarePlanModel> carePlansList =
                    context.watch<List<AddCarePlanModel>>();
                return carePlansList.isEmpty
                    ? const Center(
                        child: Padding(
                        padding: EdgeInsets.only(top: 220),
                        child: Text("No Care Plans Found!Add Care Plans +",
                            style: TextStyle(
                                // fontFamily: 'Gilroy',
                                color: AppColors.blackcolor,
                                // decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Axiforma',
                                fontSize: 13)),
                      ))
                    : carePlansList[0].dietitanId == null
                        ? const SpinKitPouringHourGlass(
                            size: 30,
                            color: AppColors.appcolor,
                          )
                        : Expanded(
                            child: ListView.builder(
                                itemCount: carePlansList.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.only(top: 15),
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child:
                                        //Text("Sohaib")

                                        CarePlanWidget(
                                      addCarePlanModel: carePlansList[index],
                                    ),
                                  );
                                })),
                          );
              }),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
