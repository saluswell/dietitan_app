import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:saluswell_dietitan_app_updated/src/careGoalPlanSection/services/nutrition_care_plan_service.dart';

import '../../../../common/utils/appcolors.dart';
import '../../../../common/utils/themes.dart';
import '../../../common/helperFunctions/navigatorHelper.dart';
import '../models/add_care_plan_model.dart';
import '../screens/view_nutrition_care_plan.dart';

class CarePlanWidget extends StatefulWidget {
  final AddCarePlanModel? addCarePlanModel;

  const CarePlanWidget({Key? key, this.addCarePlanModel}) : super(key: key);

  @override
  State<CarePlanWidget> createState() => _CarePlanWidgetState();
}

class _CarePlanWidgetState extends State<CarePlanWidget> {
  NutritionCarePlanService nutritionCarePlanService =
      NutritionCarePlanService();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: () {
          toNext(
              context: context,
              widget: ViewNutritionCarePlan(
                addCarePlanModel: widget.addCarePlanModel,
              ));
        },
        child: SizedBox(
          height: 80,
          width: 300,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Related To",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 12,
                              color: AppColors.blackcolor,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.addCarePlanModel!.relatedTo.toString(),
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 12,
                              color: AppColors.blackcolor.withOpacity(0.5),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Conducted On",
                            style: fontW5S12(context)!.copyWith(
                                fontSize: 12,
                                color: AppColors.blackcolor,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            // "",
                            widget.addCarePlanModel!.conductedOn!
                                .toDate()
                                .format("d-M-Y"),
                            style: fontW5S12(context)!.copyWith(
                                fontSize: 12,
                                color: AppColors.blackcolor.withOpacity(0.4),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      // IconButton(
                      //     onPressed: () {
                      //       nutritionCarePlanService.deleteCarePlan(
                      //           widget.addCarePlanModel!.planId.toString());
                      //     },
                      //     icon: Icon(
                      //       Icons.delete,
                      //       color: AppColors.redcolor,
                      //     ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
