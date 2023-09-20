import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saluswell_dietitan_app_updated/common/widgets/button_widget.dart';
import 'package:saluswell_dietitan_app_updated/src/mealPlansSection/providers/meal_plan_provider.dart';

import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/textfield_widget.dart';

class AddMealDialog extends StatefulWidget {
  final String mealTime;

  const AddMealDialog({Key? key, required this.mealTime}) : super(key: key);

  @override
  State<AddMealDialog> createState() => _AddMealDialogState();
}

class _AddMealDialogState extends State<AddMealDialog> {
  TextEditingController mealController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Consumer<MealPlanProvider>(
            builder: (context, mealplanprovider, __) {
          return Container(
            width: MediaQuery.of(context).size.width - 30,
            height: MediaQuery.of(context).size.height - 470,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Add Meal In ${widget.mealTime}",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 16,
                            color: AppColors.blackcolor,
                            fontWeight: FontWeight.w600),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.maybePop(context);
                        },
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(54),
                              color: AppColors.redcolor),
                          child: Center(
                            child: Icon(
                              Icons.close,
                              size: 15,
                              color: AppColors.whitecolor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Row(
                      children: [
                        Text(
                          "Add Meal",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 15,
                              color: AppColors.blackcolor,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          " (Max Chars: 150)",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 15,
                              color: AppColors.lightdarktextcolor,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),

                  // Container(
                  //     height: 200,
                  //     width: 200,
                  //     child: VideoPlayer(workoutProvider.videoController)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFieldWidget(
                        showSuffixIcon: false,
                        controller: mealController,
                        textFieldHeight: 55,
                        maxlines: 3,
                        maxLengt: 150,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter meal";
                          }
                          return null;
                        },
                        toppadding: 12,
                        hintText: "Enter Meal",
                        textInputType: TextInputType.emailAddress),
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  CommonButtonWidget(
                      text: "Add Meal",
                      backgroundcolor: AppColors.darkAppColor,
                      bordercolor: AppColors.darkAppColor,
                      buttonHeight: 45,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          if (widget.mealTime == "Breakfast") {
                            mealplanprovider
                                .addMealItemToBreakFast(mealController.text);
                            mealController.clear();
                          } else if (widget.mealTime == "Lunch") {
                            mealplanprovider
                                .addMealItemToLunch(mealController.text);
                            mealController.clear();
                          } else if (widget.mealTime == "Dinner") {
                            mealplanprovider
                                .addMealItemToDinner(mealController.text);
                            mealController.clear();
                          }
                        }
                      })
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
