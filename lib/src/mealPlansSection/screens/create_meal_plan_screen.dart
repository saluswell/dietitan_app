import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:im_stepper/stepper.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:saluswell_dietitan_app_updated/common/helperFunctions/showsnackbar.dart';
import 'package:saluswell_dietitan_app_updated/common/widgets/button_widget.dart';
import 'package:saluswell_dietitan_app_updated/src/mealPlansSection/providers/meal_plan_provider.dart';
import 'package:saluswell_dietitan_app_updated/src/mealPlansSection/widgets/add_meal_dialog.dart';
import 'package:saluswell_dietitan_app_updated/src/mealPlansSection/widgets/meal_item_card_widget.dart';

import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/textfield_widget.dart';

class CreateMealPlanScreen extends StatefulWidget {
  const CreateMealPlanScreen({Key? key}) : super(key: key);

  @override
  State<CreateMealPlanScreen> createState() => _CreateMealPlanScreenState();
}

class _CreateMealPlanScreenState extends State<CreateMealPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MealPlanProvider>(builder: (context, mealPlanProvider, __) {
      return LoadingOverlay(
        progressIndicator: SpinKitSpinningLines(
          color: AppColors.appcolor,
          size: 30,
        ),
        isLoading: mealPlanProvider.isLoading,
        child: Scaffold(
          bottomSheet: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    // Expanded(
                    //   child: CommonButtonWidget(
                    //       text: "Back",
                    //       buttonHeight: 45,
                    //       textfont: 12,
                    //       backgroundcolor: AppColors.darkAppColor,
                    //       bordercolor: AppColors.darkAppColor,
                    //       horizontalPadding: 0,
                    //       onTap: () {
                    //         mealPlanProvider.decreaseActiveStep();
                    //       }),
                    // ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    if (mealPlanProvider.activeStep == 6 ||
                        mealPlanProvider.activeStep == 13) ...[
                      Expanded(
                        child: CommonButtonWidget(
                            buttonHeight: 45,
                            horizontalPadding: 0,
                            textfont: 12,
                            backgroundcolor: AppColors.darkAppColor,
                            bordercolor: AppColors.darkAppColor,
                            text: "Complete & Finish",
                            onTap: () {
                              if (mealPlanProvider
                                  .breakFastMealsItems.isEmpty) {
                                showSnackBarMessage(
                                    context: context,
                                    backgroundcolor: AppColors.redcolor,
                                    content:
                                        "Please add least 1 meal in breakfast to go next day");
                              } else if (mealPlanProvider
                                  .lunchMealsItems.isEmpty) {
                                showSnackBarMessage(
                                    context: context,
                                    backgroundcolor: AppColors.redcolor,
                                    content:
                                        "Please add least 1 meal in lunch to go next day");
                              } else if (mealPlanProvider
                                  .lunchMealsItems.isEmpty) {
                                showSnackBarMessage(
                                    context: context,
                                    content:
                                        "Please add least 1 meal in dinner to go next day",
                                    backgroundcolor: AppColors.redcolor);
                              } else {
                                if (mealPlanProvider.activeStep == 0) {
                                  mealPlanProvider.createMealPlanProvider();
                                } else {
                                  mealPlanProvider
                                      .updateAndCompleteMealPlanProvider();
                                }
                              }
                            }),
                      ),
                    ] else ...[
                      Expanded(
                        child: CommonButtonWidget(
                            buttonHeight: 45,
                            horizontalPadding: 0,
                            textfont: 12,
                            backgroundcolor: AppColors.darkAppColor,
                            bordercolor: AppColors.darkAppColor,
                            text: "Save & Next",
                            onTap: () {
                              if (mealPlanProvider
                                  .breakFastMealsItems.isEmpty) {
                                showSnackBarMessage(
                                    context: context,
                                    backgroundcolor: AppColors.redcolor,
                                    content:
                                        "Please add least 1 meal in breakfast to go next day");
                              } else if (mealPlanProvider
                                  .lunchMealsItems.isEmpty) {
                                showSnackBarMessage(
                                    context: context,
                                    backgroundcolor: AppColors.redcolor,
                                    content:
                                        "Please add least 1 meal in lunch to go next day");
                              } else if (mealPlanProvider
                                  .lunchMealsItems.isEmpty) {
                                showSnackBarMessage(
                                    context: context,
                                    content:
                                        "Please add least 1 meal in dinner to go next day",
                                    backgroundcolor: AppColors.redcolor);
                              } else {
                                if (mealPlanProvider.activeStep == 0) {
                                  mealPlanProvider.createMealPlanProvider();
                                } else {
                                  mealPlanProvider.updateMealPlanProvider();
                                }
                              }
                            }),
                      ),
                    ]
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.maybePop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.appcolor,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Create Meal Plan",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 23,
                            color: AppColors.blackcolor,
                            fontWeight: FontWeight.w700),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.maybePop(context);
                        },
                        child: Container(
                          height: 40,
                          width: 95,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: AppColors.redcolor.withOpacity(0.1)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.close,
                                  size: 20,
                                  color: AppColors.redcolor,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Cancel",
                                  style: fontW5S12(context)!.copyWith(
                                      fontSize: 14,
                                      color: AppColors.redcolor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    children: [
                      Text(
                        "Meal Plan Title ",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 15,
                            color: AppColors.blackcolor,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        " (Max Chars: 50)",
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
                      controller: mealPlanProvider.mealPlanTitleController,
                      textFieldHeight: 55,
                      maxlines: 1,
                      maxLengt: 50,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter meal plan title";
                        }
                        return null;
                      },
                      toppadding: 18,
                      hintText: "Enter Title",
                      textInputType: TextInputType.emailAddress),
                ),

                SizedBox(
                  height: 2,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    children: [
                      Text(
                        "How many days?",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 14,
                            color: AppColors.blackcolor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 4,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: CommonButtonWidget(
                            text: "7 Days",
                            buttonHeight: 45,
                            textfont: 12,
                            backgroundcolor:
                                mealPlanProvider.selectedDaysType == 7
                                    ? AppColors.darkAppColor
                                    : AppColors.appLightColor,
                            bordercolor: mealPlanProvider.selectedDaysType == 7
                                ? AppColors.darkAppColor
                                : AppColors.appLightColor,
                            horizontalPadding: 0,
                            textcolor: mealPlanProvider.selectedDaysType == 7
                                ? AppColors.whitecolor
                                : AppColors.blackcolor,
                            onTap: () {
                              setState(() {
                                mealPlanProvider.selectedDaysType = 7;
                              });
                            }),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CommonButtonWidget(
                            buttonHeight: 45,
                            horizontalPadding: 0,
                            textfont: 12,
                            backgroundcolor:
                                mealPlanProvider.selectedDaysType == 14
                                    ? AppColors.darkAppColor
                                    : AppColors.appLightColor,
                            bordercolor: mealPlanProvider.selectedDaysType == 14
                                ? AppColors.darkAppColor
                                : AppColors.appLightColor,
                            text: "14 Days",
                            textcolor: mealPlanProvider.selectedDaysType == 14
                                ? AppColors.whitecolor
                                : AppColors.blackcolor,
                            onTap: () {
                              setState(() {
                                mealPlanProvider.selectedDaysType = 14;
                              });
                            }),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    children: [
                      Text(
                        "Days",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 17,
                            color: AppColors.blackcolor,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),

                NumberStepper(
                    enableNextPreviousButtons: false,
                    direction: Axis.horizontal,
                    activeStepColor: AppColors.darkAppColor,
                    stepColor: AppColors.appLightColor,
                    numberStyle: TextStyle(color: AppColors.whitecolor),
                    activeStep: mealPlanProvider.activeStep,
                    lineDotRadius: 0.9,
                    stepRadius: 19,
                    lineLength: 30,
                    lineColor: AppColors.appcolor,
                    enableStepTapping: false,
                    numbers: mealPlanProvider.selectedDaysType == 7
                        ? mealPlanProvider.sevenDays
                        : mealPlanProvider.fourteenDays),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Breakfast",
                            style: fontW5S12(context)!.copyWith(
                                fontSize: 16,
                                color: AppColors.blackcolor,
                                fontWeight: FontWeight.w600),
                          ),
                          InkWell(
                            onTap: () {
                              showGeneralDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  barrierLabel:
                                      MaterialLocalizations.of(context)
                                          .modalBarrierDismissLabel,
                                  barrierColor: Colors.black45,
                                  transitionDuration:
                                      const Duration(milliseconds: 200),
                                  pageBuilder: (BuildContext buildContext,
                                      Animation animation,
                                      Animation secondaryAnimation) {
                                    return AddMealDialog(
                                      mealTime: 'Breakfast',
                                    );
                                  });
                            },
                            child: Container(
                              height: 25,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: AppColors.darkAppColor),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  size: 17,
                                  color: AppColors.whitecolor,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                mealPlanProvider.breakFastMealsItems.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            "Add Breakfast Meals",
                            style: fontW5S12(context)!.copyWith(
                                fontSize: 12,
                                color: AppColors.blackcolor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    : Container(
                        height:
                            mealPlanProvider.breakFastMealsItems.length * 68,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.only(),
                            itemCount:
                                mealPlanProvider.breakFastMealsItems.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  MealItemCardWidget(
                                    item: mealPlanProvider
                                        .breakFastMealsItems[index],
                                  ),
                                  Positioned(
                                      right: 10,
                                      top: -2,
                                      //   left: -5,
                                      child: InkWell(
                                        onTap: () {
                                          mealPlanProvider
                                              .removeMealItemFromBreakFast(
                                                  index);
                                        },
                                        child: Container(
                                          height: 22,
                                          width: 22,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(54),
                                              color: AppColors.redcolor),
                                          child: Center(
                                            child: Icon(
                                              Icons.close,
                                              size: 15,
                                              color: AppColors.whitecolor,
                                            ),
                                          ),
                                        ),
                                      ))
                                ],
                              );
                            }),
                      ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Lunch",
                            style: fontW5S12(context)!.copyWith(
                                fontSize: 16,
                                color: AppColors.blackcolor,
                                fontWeight: FontWeight.w600),
                          ),
                          InkWell(
                            onTap: () {
                              showGeneralDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  barrierLabel:
                                      MaterialLocalizations.of(context)
                                          .modalBarrierDismissLabel,
                                  barrierColor: Colors.black45,
                                  transitionDuration:
                                      const Duration(milliseconds: 200),
                                  pageBuilder: (BuildContext buildContext,
                                      Animation animation,
                                      Animation secondaryAnimation) {
                                    return AddMealDialog(
                                      mealTime: 'Lunch',
                                    );
                                  });
                            },
                            child: Container(
                              height: 25,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: AppColors.darkAppColor),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  size: 17,
                                  color: AppColors.whitecolor,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                mealPlanProvider.lunchMealsItems.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            "Add Lunch Meals",
                            style: fontW5S12(context)!.copyWith(
                                fontSize: 12,
                                color: AppColors.blackcolor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    : Container(
                        height: mealPlanProvider.lunchMealsItems.length * 68,
                        child: ListView.builder(
                            padding: EdgeInsets.only(),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: mealPlanProvider.lunchMealsItems.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  MealItemCardWidget(
                                    item:
                                        mealPlanProvider.lunchMealsItems[index],
                                  ),
                                  Positioned(
                                      right: 10,
                                      top: -2,
                                      //   left: -5,
                                      child: InkWell(
                                        onTap: () {
                                          mealPlanProvider
                                              .removeMealItemFromLunch(index);
                                        },
                                        child: Container(
                                          height: 22,
                                          width: 22,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(54),
                                              color: AppColors.redcolor),
                                          child: Center(
                                            child: Icon(
                                              Icons.close,
                                              size: 15,
                                              color: AppColors.whitecolor,
                                            ),
                                          ),
                                        ),
                                      ))
                                ],
                              );
                            }),
                      ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Dinner",
                            style: fontW5S12(context)!.copyWith(
                                fontSize: 16,
                                color: AppColors.blackcolor,
                                fontWeight: FontWeight.w600),
                          ),
                          InkWell(
                            onTap: () {
                              showGeneralDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  barrierLabel:
                                      MaterialLocalizations.of(context)
                                          .modalBarrierDismissLabel,
                                  barrierColor: Colors.black45,
                                  transitionDuration:
                                      const Duration(milliseconds: 200),
                                  pageBuilder: (BuildContext buildContext,
                                      Animation animation,
                                      Animation secondaryAnimation) {
                                    return AddMealDialog(
                                      mealTime: 'Dinner',
                                    );
                                  });
                            },
                            child: Container(
                              height: 25,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: AppColors.darkAppColor),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  size: 17,
                                  color: AppColors.whitecolor,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                mealPlanProvider.dinnerMealsItems.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            "Add Dinner Meals",
                            style: fontW5S12(context)!.copyWith(
                                fontSize: 12,
                                color: AppColors.blackcolor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    : Container(
                        height: mealPlanProvider.dinnerMealsItems.length * 68,
                        child: ListView.builder(
                            padding: EdgeInsets.only(),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: mealPlanProvider.dinnerMealsItems.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  MealItemCardWidget(
                                    item: mealPlanProvider
                                        .dinnerMealsItems[index],
                                  ),
                                  Positioned(
                                      right: 10,
                                      top: -2,
                                      //   left: -5,
                                      child: InkWell(
                                        onTap: () {
                                          mealPlanProvider
                                              .removeMealItemFromDinner(index);
                                        },
                                        child: Container(
                                          height: 22,
                                          width: 22,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(54),
                                              color: AppColors.redcolor),
                                          child: Center(
                                            child: Icon(
                                              Icons.close,
                                              size: 15,
                                              color: AppColors.whitecolor,
                                            ),
                                          ),
                                        ),
                                      ))
                                ],
                              );
                            }),
                      ),
                SizedBox(
                  height: 90,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
