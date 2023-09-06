import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saluswell_dietitan_app_updated/common/helperFunctions/storage_services.dart';
import 'package:saluswell_dietitan_app_updated/src/recipesSection/models/recipes_model.dart';
import 'package:saluswell_dietitan_app_updated/src/recipesSection/services/recipes_services.dart';

import '../../../common/helperFunctions/commonMethods.dart';
import '../../../common/helperFunctions/getUserIDhelper.dart';
import '../../../common/helperFunctions/navigatorHelper.dart';
import '../../../common/helperFunctions/showsnackbar.dart';
import '../../../common/utils/appcolors.dart';

class RecipesProvider extends ChangeNotifier {
  File? recipeImage;

  TextEditingController recipeTitleController = TextEditingController();
  TextEditingController recipeIngredientsController = TextEditingController();
  TextEditingController recipeStepsController = TextEditingController();
  TextEditingController dietTypeController = TextEditingController();
  TextEditingController breakDownOfEssentialsController =
      TextEditingController();
  TextEditingController conditionsController = TextEditingController();

  TextEditingController caloriesController = TextEditingController();
  TextEditingController carbohydratesController = TextEditingController();
  TextEditingController proteinController = TextEditingController();
  TextEditingController fiberController = TextEditingController();
  TextEditingController sodiumController = TextEditingController();
  TextEditingController sugarController = TextEditingController();

  ///ingredients Section

  List<String>? ingredients = [];

  addIngredientsToList(String val) {
    ingredients!.add(val);
    recipeIngredientsController.clear();
    notifyListeners();
  }

  removeIngredientsFromList(int index) {
    ingredients!.removeAt(index);
    notifyListeners();
  }

  /// meal type section

  List<String> _mealType = [
    'Breakfast',
    'Lunch',
    'Dinner',
  ];

  List<String> _selectedMealType = [];

  List<String> get mealType => _mealType;

  List<String> get selectedMealType => _selectedMealType;

  void toggleMealTypeSelection(int index) {
    final item = _mealType[index];
    if (_selectedMealType.contains(item)) {
      _selectedMealType.remove(item);
    } else {
      _selectedMealType.add(item);
      dp(msg: "mealType items", arg: selectedFoodItems);
    }
    notifyListeners();
  }

  ///Allergen Section

  List<String> _foodItems = [
    'No Allergy',
    'Milk',
    'Eggs',
    'Fish (e.g., bass, flounder, cod)',
    'Crustacean shellfish (e.g., crab, lobster, shrimp)',
    'Tree nuts (e.g., almonds, walnuts, pecans)',
    'Peanuts',
    'Wheat',
    'Soybeans',
    'Sesame',
  ];

  List<String> _selectedFoodItems = [];

  List<String> get foodItems => _foodItems;

  List<String> get selectedFoodItems => _selectedFoodItems;

  void toggleAllergenSelection(int index) {
    final item = _foodItems[index];
    if (_selectedFoodItems.contains(item)) {
      _selectedFoodItems.remove(item);
    } else {
      _selectedFoodItems.add(item);
      dp(msg: "Allergen items", arg: selectedFoodItems);
    }
    notifyListeners();
  }

  ///Diet Type Section
  List<String> _dietTypes = [
    'Ketogenic Diet',
    'Mediterranean Diet',
    'Paleo Diet',
    'Vegan Diet',
    'Meat and Vegetable Diet',
    'Vegetarian Diet',
    'Low-Carb Diet',
    'Low-Fat Diet',
    'Gluten-Free Diet',
    'DASH Diet',
    'Whole30 Diet',
    'Atkins Diet',
    'Zone Diet',
    'Intermittent Fasting',
    'Carnivore Diet',
    'Flexitarian Diet',
    'Pescatarian Diet',
    'Raw Food Diet',
    'Fruitarian Diet',
    'South Beach Diet',
    'Weight Watchers',
    'High-Protein Diet',
    'Plant-Based Diet',
    'Whole Foods',
  ];

  List<String> _selectedDietTypes = [];

  List<String> get dietTypes => _dietTypes;

  List<String> get selectedDietTypes => _selectedDietTypes;

  void toggleDietTypeSelection(int index) {
    final item = _dietTypes[index];
    if (_selectedDietTypes.contains(item)) {
      _selectedDietTypes.remove(item);
    } else {
      _selectedDietTypes.add(item);
      dp(msg: "Selected Diet Types items", arg: selectedDietTypes);
    }
    notifyListeners();
  }

  ///recipe condition section
  List<String> _recipeConditions = [
    'Cardiovascular disease',
    'Anti-inflammatory',
    'Gluten-Free',
    'Gluten-Free',
    'Gluten-Free',
    'Gluten-Free',
    'Dairy-Free',
    'Low-Carb',
    'Vegetarian',
    'Vegan',
    'High-Protein',
    'Low-Fat',
    'Keto',
    'Paleo',
    'Pescatarian',
    'Whole30',
    'Nut-Free',
    'Soy-Free',
    'Sugar-Free',
    'Organic',
    'Raw',
    'Mediterranean',
    'Heart-Healthy',
    'Quick & Easy',
    'Budget-Friendly',
    'Kid-Friendly',
    // Add more conditions as needed
  ];

  List<String> _selectedRecipeConditions = [];

  List<String> get recipeConditions => _recipeConditions;

  List<String> get selectedRecipeConditions => _selectedRecipeConditions;

  void toggleRecipeConditionsSelection(int index) {
    final item = _recipeConditions[index];
    if (_selectedRecipeConditions.contains(item)) {
      _selectedRecipeConditions.remove(item);
    } else {
      _selectedRecipeConditions.add(item);
      dp(
          msg: "Selected recipe conditions items",
          arg: _selectedRecipeConditions);
    }
    notifyListeners();
  }

  /// pick article image

  pickRecipeImage(context, ImageSource imageSource) async {
    var xFile = await CommonMethods.getImage(imageSource);
    if (xFile != null) {
      recipeImage = File(xFile.path);
      notifyListeners();
    } else {
      showSnackBarMessage(
          context: navstate.currentState!.context,
          content: "Picture not picked");
    }
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

  StorageServices storageServices = StorageServices();
  RecipesServices recipesServices = RecipesServices();

  /// --------------------------- create recipe in database---------------------------------
  var recipeImageUrlVar;

  createRecipe() async {
    if (recipeImage == null) {
      showSnackBarMessage(
          backgroundcolor: AppColors.redcolor,
          contentColor: AppColors.whitecolor,
          context: navstate.currentState!.context,
          content: "Please upload recipe image ");
      return;
    } else if (selectedMealType.isEmpty) {
      showSnackBarMessage(
          backgroundcolor: AppColors.redcolor,
          contentColor: AppColors.whitecolor,
          context: navstate.currentState!.context,
          content: "Select Meal Type");
      return;
    } else if (selectedFoodItems.isEmpty) {
      showSnackBarMessage(
          backgroundcolor: AppColors.redcolor,
          contentColor: AppColors.whitecolor,
          context: navstate.currentState!.context,
          content: "Select Allergens");
      return;
    } else if (ingredients!.isEmpty) {
      showSnackBarMessage(
          backgroundcolor: AppColors.redcolor,
          contentColor: AppColors.whitecolor,
          context: navstate.currentState!.context,
          content: "Select Ingredients");
      return;
    }
    try {
      if (recipeImage != null) {
        makeLoadingTrue();
        var profileimageurl = await storageServices.uploadFile(recipeImage!);
        recipeImageUrlVar = profileimageurl;
        notifyListeners();
        recipesServices.createRecipe(RecipesModel(
            userId: getUserID(),
            recipeTitle: recipeTitleController.text,
            meals: selectedMealType,
            dietTypes: dietTypeController.text,
            allergens: _selectedFoodItems,
            conditions: conditionsController.text,
            ingredients: ingredients,
            directions: recipeStepsController.text,
            breakdownOfEssentialIngredients:
                breakDownOfEssentialsController.text,
            isApprovedByAdmin: false,
            //categoryType: recordType,
            dateCreated: Timestamp.fromDate(DateTime.now()),
            recipeImage: recipeImageUrlVar,
            calories: caloriesController.text,
            carbohydrates: carbohydratesController.text,
            protein: proteinController.text,
            fiber: fiberController.text,
            sodium: sodiumController.text,
            sugar: sugarController.text));
        makeLoadingFalse();
        clearArticleData() {
          // articletitleController.clear();
          // articledescController.clear();
          recipeImage = null;
        }

        showSnackBarMessage(
            backgroundcolor: AppColors.blackcolor,
            contentColor: AppColors.whitecolor,
            context: navstate.currentState!.context,
            content:
                "Recipe Uploaded Successfully wait for approval from admin");
        Navigator.maybePop(navstate.currentState!.context);
      }
    } on FirebaseException catch (e) {
      makeLoadingFalse();
      showSnackBarMessage(
          backgroundcolor: AppColors.redcolor,
          contentColor: AppColors.whitecolor,
          context: navstate.currentState!.context,
          content: e.toString());
    }
  }
}
