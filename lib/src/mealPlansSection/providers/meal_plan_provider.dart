import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:saluswell_dietitan_app_updated/common/helperFunctions/getUserIDhelper.dart';
import 'package:saluswell_dietitan_app_updated/common/helperFunctions/navigatorHelper.dart';
import 'package:saluswell_dietitan_app_updated/src/mealPlansSection/models/meal_plan_model.dart';
import 'package:saluswell_dietitan_app_updated/src/mealPlansSection/services/meal_plan_services.dart';

import '../../../common/helperFunctions/hive_local_storage.dart';
import '../../../common/helperFunctions/showsnackbar.dart';
import '../../../common/utils/appcolors.dart';
import '../../../common/utils/textutils.dart';

class MealPlanProvider extends ChangeNotifier {
  bool isLoading = false;

  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  TextEditingController mealPlanTitleController = TextEditingController();
  List<int> sevenDays = [1, 2, 3, 4, 5, 6, 7];
  List<int> fourteenDays = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];

  int activeStep = 0;

  int selectedDaysType = 7;

  increaseActiveStep() {
    int days = selectedDaysType == 7 ? 7 : 14;
    if (activeStep < days) {
      activeStep++;
    }
    notifyListeners();
  }

  decreaseActiveStep() {
    if (activeStep > 0) {
      activeStep--;
    }
    notifyListeners();
  }

  ///------------------------Add BreakFastMeal ---------------------------------

  List<String> breakFastMealsItems = [];

  addMealItemToBreakFast(String value) {
    breakFastMealsItems.add(value);
    Navigator.maybePop(navstate.currentState!.context);
    notifyListeners();
  }

  removeMealItemFromBreakFast(int index) {
    breakFastMealsItems.removeAt(index);
    notifyListeners();
  }

  ///------------------------Add lunch ---------------------------------

  List<String> lunchMealsItems = [];

  addMealItemToLunch(String value) {
    lunchMealsItems.add(value);
    Navigator.maybePop(navstate.currentState!.context);
    notifyListeners();
  }

  removeMealItemFromLunch(int index) {
    lunchMealsItems.removeAt(index);
    notifyListeners();
  }

  ///------------------------Add Dinner ---------------------------------

  List<String> dinnerMealsItems = [];

  addMealItemToDinner(String value) {
    dinnerMealsItems.add(value);
    Navigator.maybePop(navstate.currentState!.context);
    notifyListeners();
  }

  removeMealItemFromDinner(int index) {
    dinnerMealsItems.removeAt(index);
    notifyListeners();
  }

  ///-------------------- Create Meal Plan ----------------------------

  MealPlanServices mealPlanServices = MealPlanServices();

  createMealPlanProvider() async {
    try {
      makeLoadingTrue();
      await mealPlanServices
          .createMealPlan(
              MealPlanModel(
                userId: getUserID(),
                mealPlanTitle: mealPlanTitleController.text,
                breakfastMeals: breakFastMealsItems,
                lunchMeals: lunchMealsItems,
                dinnerMeals: dinnerMealsItems,
                isApprovedByAdmin: false,
                mealPlanDay: activeStep.toString(),
                dateCreated: Timestamp.fromDate(DateTime.now()),
              ),
              activeStep.toString())
          .then((value) async {
        dp(msg: "create meal plan response", arg: value.toString());
        await HiveLocalStorage.write(
            boxName: TextUtils.documentIDBox,
            key: TextUtils.documentIDKey,
            value: value.toString());
        breakFastMealsItems.clear();
        lunchMealsItems.clear();
        dinnerMealsItems.clear();

        makeLoadingFalse();
        Provider.of<MealPlanProvider>(navstate.currentState!.context,
                listen: false)
            .increaseActiveStep();

        showSnackBarMessage(
            backgroundcolor: AppColors.appcolor,
            contentColor: AppColors.whitecolor,
            context: navstate.currentState!.context,
            content: "Meal Plan Saved Successfully");
      });
    } catch (e) {
      makeLoadingFalse();
      showSnackBarMessage(
          context: navstate.currentState!.context, content: e.toString());
      // TODO
    }
  }

  updateMealPlanProvider() async {
    try {
      makeLoadingTrue();
      await mealPlanServices
          .updateMealPlan(
              MealPlanModel(
                userId: getUserID(),
                mealPlanTitle: mealPlanTitleController.text,
                breakfastMeals: breakFastMealsItems,
                lunchMeals: lunchMealsItems,
                dinnerMeals: dinnerMealsItems,
                isApprovedByAdmin: false,
                mealPlanDay: activeStep.toString(),
                dateCreated: Timestamp.fromDate(DateTime.now()),
              ),
              activeStep.toString())
          .then((value) async {
        dp(msg: "create meal plan response", arg: value.toString());
        breakFastMealsItems.clear();
        lunchMealsItems.clear();
        dinnerMealsItems.clear();

        makeLoadingFalse();
        Provider.of<MealPlanProvider>(navstate.currentState!.context,
                listen: false)
            .increaseActiveStep();

        showSnackBarMessage(
            backgroundcolor: AppColors.appcolor,
            contentColor: AppColors.whitecolor,
            context: navstate.currentState!.context,
            content: "Meal Plan Updated Successfully");
      });
    } catch (e) {
      makeLoadingFalse();
      showSnackBarMessage(
          context: navstate.currentState!.context, content: e.toString());
      // TODO
    }
  }

  updateAndCompleteMealPlanProvider() async {
    try {
      makeLoadingTrue();
      await mealPlanServices
          .updateMealPlan(
              MealPlanModel(
                userId: getUserID(),
                mealPlanTitle: mealPlanTitleController.text,
                breakfastMeals: breakFastMealsItems,
                lunchMeals: lunchMealsItems,
                dinnerMeals: dinnerMealsItems,
                isApprovedByAdmin: false,
                mealPlanDay: activeStep.toString(),
                dateCreated: Timestamp.fromDate(DateTime.now()),
              ),
              activeStep.toString())
          .then((value) async {
        dp(msg: "create meal plan response", arg: value.toString());
        breakFastMealsItems.clear();
        lunchMealsItems.clear();
        dinnerMealsItems.clear();
        mealPlanTitleController.clear();

        makeLoadingFalse();
        Provider.of<MealPlanProvider>(navstate.currentState!.context,
                    listen: false)
                .activeStep ==
            0;
        Navigator.maybePop(navstate.currentState!.context);

        showSnackBarMessage(
            backgroundcolor: AppColors.appcolor,
            contentColor: AppColors.whitecolor,
            context: navstate.currentState!.context,
            content: "Meal Plan Updated & Completed Successfully");
      });
    } catch (e) {
      makeLoadingFalse();
      showSnackBarMessage(
          context: navstate.currentState!.context, content: e.toString());
      // TODO
    }
  }
}
