import 'package:flutter/material.dart';

import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/cacheNetworkImageWidget.dart';
import '../models/recipes_model.dart';

class RecipeDetailScreen extends StatelessWidget {
  final RecipesModel recipesModel;

  const RecipeDetailScreen({Key? key, required this.recipesModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Recipe Details",
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CacheNetworkImageWidget(
              imgUrl: recipesModel.recipeImage.toString(),
              width: MediaQuery.of(context).size.width,
              radius: 7,
              height: 160,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                recipesModel.recipeTitle.toString(),
                style: fontW5S12(context)!.copyWith(
                    fontSize: 20,
                    color: AppColors.blackcolor,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "INGREDIENTS",
                    style: fontW5S12(context)!.copyWith(
                        fontSize: 14,
                        color: AppColors.darkAppColor,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
                itemCount: recipesModel.ingredients!.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 10, left: 20, right: 8),
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      children: [
                        Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(33),
                              color: AppColors.appcolor),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          recipesModel.ingredients![index].toString(),
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 12,
                              color: AppColors.darkAppColor,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  );
                })),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "NUTRITION",
                    style: fontW5S12(context)!.copyWith(
                        fontSize: 14,
                        color: AppColors.darkAppColor,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Calories :",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 14,
                            color: AppColors.blackcolor.withOpacity(0.5),
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        recipesModel.calories.toString() + "kcal",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 14,
                            color: AppColors.darkAppColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Carbohydrates :",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 14,
                            color: AppColors.blackcolor.withOpacity(0.5),
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        recipesModel.carbohydrates.toString() + "g",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 14,
                            color: AppColors.darkAppColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Protein :",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 14,
                            color: AppColors.blackcolor.withOpacity(0.5),
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        recipesModel.protein.toString() + "g",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 14,
                            color: AppColors.darkAppColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Fiber :",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 14,
                            color: AppColors.blackcolor.withOpacity(0.5),
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        recipesModel.fiber.toString() + "g",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 14,
                            color: AppColors.darkAppColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Sodium :",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 14,
                            color: AppColors.blackcolor.withOpacity(0.5),
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        recipesModel.sodium.toString() + "g",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 14,
                            color: AppColors.darkAppColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Sugar :",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 14,
                            color: AppColors.blackcolor.withOpacity(0.5),
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        recipesModel.sugar.toString() + "g",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 14,
                            color: AppColors.darkAppColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Meals",
                    style: fontW5S12(context)!.copyWith(
                        fontSize: 14,
                        color: AppColors.darkAppColor,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
                itemCount: recipesModel.meals!.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 10, left: 20, right: 8),
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      children: [
                        Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(33),
                              color: AppColors.appcolor),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          recipesModel.meals![index].toString(),
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 12,
                              color: AppColors.darkAppColor,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  );
                })),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Allergens",
                    style: fontW5S12(context)!.copyWith(
                        fontSize: 14,
                        color: AppColors.darkAppColor,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
                itemCount: recipesModel.allergens!.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 10, left: 20, right: 8),
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      children: [
                        Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(33),
                              color: AppColors.appcolor),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          recipesModel.allergens![index].toString(),
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 12,
                              color: AppColors.darkAppColor,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  );
                })),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Diet Type",
                    style: fontW5S12(context)!.copyWith(
                        fontSize: 14,
                        color: AppColors.darkAppColor,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ListView.builder(
                itemCount: recipesModel.dietTypes!.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 10, left: 20, right: 8),
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      children: [
                        Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(33),
                              color: AppColors.appcolor),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          recipesModel.dietTypes![index].toString(),
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 12,
                              color: AppColors.darkAppColor,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  );
                })),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 12),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       Text(
            //         recipesModel.dietTypes.toString(),
            //         style: fontW5S12(context)!.copyWith(
            //             fontSize: 12,
            //             color: AppColors.blackcolor,
            //             fontWeight: FontWeight.w500),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Directions",
                    style: fontW5S12(context)!.copyWith(
                        fontSize: 14,
                        color: AppColors.darkAppColor,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: recipesModel.directions.toString(),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 12,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w500),
                    )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Breakdown of Essential Ingredients",
                    style: fontW5S12(context)!.copyWith(
                        fontSize: 14,
                        color: AppColors.darkAppColor,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: recipesModel.breakdownOfEssentialIngredients
                          .toString(),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 12,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w500),
                    )),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
