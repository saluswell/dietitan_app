import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saluswell_dietitan_app_updated/src/careGoalPlanSection/models/add_care_plan_model.dart';

import '../../../common/helperFunctions/navigatorHelper.dart';
import '../../../common/helperFunctions/showsnackbar.dart';
import '../../../common/utils/appcolors.dart';
import '../models/diagnotsic_model.dart';
import '../services/nutrition_care_plan_service.dart';

class DiagnosticProvider extends ChangeNotifier {
  List<DiagnosticStatement> diagnosticStatements = [
    // DiagnosticStatement(
    //   title: "INTAKE NI",
    //   subStatements: [
    //     "Defined as “actual problems related to intake of energy, nutrients, fluids, bioactive substances through oral diet or nutrition support”",
    //   ],
    // ),
    DiagnosticStatement(
      title: "Energy Balance (1)",
      subStatements: [
        // "Defined as “actual or estimated changes in energy (kcal) balance”",
        "Unused NI-1.1",
        "Increased energy expenditure NI-1.2",
        "Unused NI-1.3",
        "Inadequate energy intake NI-1.4",
        "Excessive energy intake NI-1.5",
        "Predicted suboptimal energy intake NI-1.6",
        "Predicted excessive energy intake NI-1.7",
      ],
    ),
    DiagnosticStatement(
      title: "Oral or Nutrition Support Intake (2)",
      subStatements: [
        // "Defined as “actual or estimated food and beverage intake from oral diet or nutrition support compared with patient goal”",
        "Inadequate oral intake NI-2.1",
        "Excessive oral intake NI-2.2",
        "Inadequate enteral nutrition infusion NI-2.3",
        "Excessive enteral nutrition infusion NI-2.4",
        "Less than optimal enteral nutrition NI-2.5",
        "Inadequate parenteral nutrition infusion NI-2.6",
        "Excessive parenteral nutrition infusion NI-2.7",
        "Less than optimal parenteral nutrition NI-2.8",
        "Limited food acceptance NI-2.9",
      ],
    ),

    DiagnosticStatement(
      title: "Fluid Intake (3)",
      subStatements: [
        // "Defined as “actual or estimated fluid intake compared with patient goal”",
        "Inadequate fluid intake NI-3.1",
        "Excessive fluid intake NI-3.2",
      ],
    ),
    DiagnosticStatement(
      title: "Bioactive Substances (4)",
      subStatements: [
        //   "Defined as “actual or observed intake of bioactive substances, including single or multiple functional food components, ingredients, dietary supplements, alcohol”",
        "Inadequate bioactive substance intake NI-4.1",
        "Excessive bioactive substance intake NI-4.2",
        "Excessive alcohol intake NI-4.3",
      ],
    ),
    DiagnosticStatement(
      title: "Nutrient (5)",
      subStatements: [
        // "Defined as “actual or estimated intake of specific nutrient groups or single nutrients as compared with desired levels”",
        "Increased nutrient needs NI-5.1 (specify)",
        "Malnutrition NI-5.2",
        "Inadequate protein-energy intake NI-5.3",
        "Decreased nutrient needs NI-5.4 (specify)",
        "Imbalance of nutrients NI-5.5",
      ],
    ),
    DiagnosticStatement(
      title: "Fat and Cholesterol (5.6)",
      subStatements: [
        "Inadequate fat intake NI-5.6.1",
        "Excessive fat intake NI-5.6.2",
        "Inappropriate intake of fats NI-5.6.3 (specify)",
      ],
    ),
    DiagnosticStatement(
      title: "Protein (5.7)",
      subStatements: [
        "Inadequate protein intake NI-5.7.1",
        "Excessive protein intake NI-5.7.2",
        "Inappropriate intake of protein NI-5.7.3 or amino acids (specify)",
      ],
    ),
    DiagnosticStatement(
      title: "Carbohydrate and Fiber (5.8)",
      subStatements: [
        "Inadequate carbohydrate intake NI-5.8.1",
        "Excessive carbohydrate intake NI-5.8.2",
        "Inappropriate intake of NI-5.8.3 types of carbohydrate (specify)",
        "Inconsistent carbohydrate intake NI-5.8.4",
        "Inadequate fiber intake NI-5.8.5",
        "Excessive fiber intake NI-5.8.6",
      ],
    ),

    DiagnosticStatement(
      title: "Vitamin (5.9)",
      subStatements: [
        "Inadequate vitamin intake NI-5.9.1 (specify)",
        "A (1) o Riboflavin (7)",
        "C (2) o Niacin (8)",
        "D (3) o Folate (9)",
        "E (4) o B6 (10)",
        "K (5) o B12 (11)",
        "Thiamin (6)",
        "Other (specify) (12)",
        "Excessive vitamin intake NI-5.9.2 (specify)",
        "A (1) o Riboflavin (7)",
        "C (2) o Niacin (8)",
        "D (3) o Folate (9)",
        "E (4) o B6 (10)",
        "K (5) o B12 (11)",
        "Thiamin (6)",
        "Other (specify) (12)",
      ],
    ),
    DiagnosticStatement(
      title: "Mineral (5.10)",
      subStatements: [
        "Inadequate mineral intake NI-5.10.1 (specify)",
        "Calcium (1) ",
        "Potassium (5)",
        "Chloride (2)",
        "Phosphorus (6)",
        "Iron (3)",
        "Sodium (7)",
        "Magnesium (4)",
        "Zinc (8)",
        "Other (specify) (9)",
        "Excessive mineral intake NI-5.10.2 (specify)",
        "Calcium (1) o Potassium (5)",
        "Chloride (2) o Phosphorus (6)",
        "Iron (3) o Sodium (7)",
        "Magnesium (4) o Zinc (8)",
        "Other (specify) (9)",
      ],
    ),
    DiagnosticStatement(
      title: "Multi-nutrient (5.11)",
      subStatements: [
        "Predicted suboptimal nutrient intake NI-5.11.1",
        "Predicted excessive nutrient intake NI-5.11.2",
      ],
    ),
    DiagnosticStatement(
      title: "CLINICAL NC",
      subStatements: [
        "Defined as “nutritional findings/problems identified that relate to medical or physical conditions”",
      ],
    ),
    DiagnosticStatement(
      title: "CLINICAL NC",
      subStatements: [
        "Defined as “nutritional findings/problems identified that relate to medical or physical conditions”",
      ],
    ),
    DiagnosticStatement(
      title: "Functional (1)",
      subStatements: [
        //   "Defined as “change in physical or mechanical functioning that interferes with or prevents desired nutritional consequences”",
        "Swallowing difficulty NC-1.1",
        "Biting/Chewing NC-1.2 (masticatory) difficulty",
        "Breastfeeding difficulty NC-1.3",
        "Altered GI function NC-1.4",
      ],
    ),
    DiagnosticStatement(
      title: "Biochemical (2)",
      subStatements: [
        // "Defined as “change in capacity to metabolize nutrients as a result of medications, surgery, or as indicated by altered lab values”",
        "Impaired nutrient utilization NC-2.1",
        "Altered nutrition-related laboratory values NC-2.2 (specify)",
        "Food–medication interaction NC-2.3",
        "Predicted food–medication interaction NC-2.4",
      ],
    ),
    DiagnosticStatement(
      title: "Weight (3)",
      subStatements: [
        //  "Defined as “chronic weight or changed weight status when compared with usual or desired body weight”",
        "Underweight NC-3.1",
        "Unintend weight loss NC-3.2",
        "Overweight/obesity NC-3.3",
        "Unintend weight gain NC-3.4",
      ],
    ),
    DiagnosticStatement(
      title: "BEHAVIORAL-ENVIRONMENTAL NB",
      subStatements: [
        "Defined as “nutritional findings/problems identified that relate to knowledge, attitudes/beliefs, physical environment, access to food, or food safety”",
      ],
    ),
    DiagnosticStatement(
      title: "Knowledge and Beliefs (1)",
      subStatements: [
        //   "Defined as “actual knowledge and beliefs as related, observed, or documented”",
        "Food- and nutrition-related knowledge deficit NB-1.1",
        "Harmful beliefs/attitudes about food- NB-1.2 or nutrition-related topics (use with caution)",
        "Not ready for diet/lifestyle change NB-1.3",
        "Self-monitoring deficit NB-1.4",
        "Disordered eating pattern NB-1.5",
        "Limited adherence to nutrition- NB-1.6 related recommendations",
        "Undesirable food choices NB-1.7",
      ],
    ),
    DiagnosticStatement(
      title: "Physical Activity and Function (2)",
      subStatements: [
        //   "Defined as “actual physical activity, self-care, and quality-of-life problems as reported, observed, or documented”",
        "Physical inactivity NB-2.1",
        "Excessive physical activity NB-2.2",
        "Inability or lack of desire NB-2.3 to manage self-care",
        "Impaired ability to NB-2.4 prepare foods/meals",
        "Poor nutrition quality of life NB-2.5",
        "Self-feeding difficulty NB-2.6",
      ],
    ),
    DiagnosticStatement(
      title: "Food Safety and Access (3)",
      subStatements: [
        // "Defined as “actual problems with food safety or access to food, water, or nutrition-related supplies”",
        "Intake of unsafe food NB-3.1",
        "Limited access to food or water NB-3.2",
        "Limited access to nutrition-related NB-3.3 supplies",
      ],
    ),

    // Add more diagnostic statements with substatements here
  ];

  List<String> selectedOptions = [];

  bool isSelected(String option) {
    return selectedOptions.contains(option);
    notifyListeners();
  }

  void toggleSelection(String option) {
    if (selectedOptions.contains(option)) {
      selectedOptions.remove(option);
    } else {
      selectedOptions.add(option);
    }
    notifyListeners();
  }

  bool isLoading = false;

  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  NutritionCarePlanService nutritionCarePlanService =
      NutritionCarePlanService();

  createCarePlanProvider(
    String patientID,
    String appointmentID,
    String dietitianID,
    String assesment,
    String evedenceBy,
    String relatedTo,
    String intervention,
    String monotoring,
  ) {
    if (selectedOptions.isEmpty) {
      showSnackBarMessage(
          context: navstate.currentState!.context,
          backgroundcolor: AppColors.redcolor,
          contentColor: AppColors.whitecolor,
          content: "Please Select least one Diagnosis");
    } else {
      try {
        makeLoadingTrue();

        nutritionCarePlanService
            .createCarePlan(AddCarePlanModel(
                patientId: patientID,
                appointmentId: appointmentID,
                conductedOn: Timestamp.fromDate(DateTime.now()),
                relatedTo: relatedTo,
                evidenceBy: evedenceBy,
                dietitanId: dietitianID,
                assessment: assesment,
                intervention: intervention,
                monitoring: monotoring,
                diagnosisList: selectedOptions))
            .then((value) {
          makeLoadingFalse();

          Navigator.maybePop(navstate.currentState!.context);

          showSnackBarMessage(
              backgroundcolor: AppColors.appcolor,
              contentColor: AppColors.whitecolor,
              context: navstate.currentState!.context,
              content: "Care Plan Added Successfully");
        });
      } catch (e) {
        makeLoadingFalse();
        showSnackBarMessage(
            context: navstate.currentState!.context, content: e.toString());
        // TODO
      }
    }
  }
}
