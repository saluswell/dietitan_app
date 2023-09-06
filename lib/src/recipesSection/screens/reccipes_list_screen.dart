import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:saluswell_dietitan_app_updated/common/widgets/cacheNetworkImageWidget.dart';
import 'package:saluswell_dietitan_app_updated/src/recipesSection/models/recipes_model.dart';
import 'package:saluswell_dietitan_app_updated/src/recipesSection/screens/add_new_recipe_screen.dart';
import 'package:saluswell_dietitan_app_updated/src/recipesSection/screens/recipe_details.dart';
import 'package:saluswell_dietitan_app_updated/src/recipesSection/services/recipes_services.dart';

import '../../../common/helperFunctions/navigatorHelper.dart';
import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';

class RecipesListScreen extends StatefulWidget {
  const RecipesListScreen({Key? key}) : super(key: key);

  @override
  State<RecipesListScreen> createState() => _RecipesListScreenState();
}

class _RecipesListScreenState extends State<RecipesListScreen> {
  RecipesServices recipesServices = RecipesServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.maybePop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.appcolor,
                )),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recipes",
                    style: fontW5S12(context)!.copyWith(
                        fontSize: 23,
                        color: AppColors.blackcolor,
                        fontWeight: FontWeight.w700),
                  ),
                  InkWell(
                    onTap: () {
                      toNext(context: context, widget: AddNewRecipeScreen());
                    },
                    child: Container(
                      height: 40,
                      width: 110,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: AppColors.lightwhitecolor),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              size: 20,
                              color: AppColors.appcolor,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Add New",
                              style: fontW5S12(context)!.copyWith(
                                  fontSize: 14,
                                  color: AppColors.appcolor,
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
          ),
          SizedBox(
            height: 10,
          ),
          StreamProvider.value(
              value: recipesServices.streamRecipes(),
              initialData: [RecipesModel()],
              builder: (context, child) {
                List<RecipesModel> recipesList =
                    context.watch<List<RecipesModel>>();
                return recipesList.isEmpty
                    ? const Center(
                        child: Padding(
                        padding: EdgeInsets.only(top: 220),
                        child: Text("No Recipes Found!",
                            style: TextStyle(
                                // fontFamily: 'Gilroy',
                                color: AppColors.blackcolor,
                                // decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Axiforma',
                                fontSize: 13)),
                      ))
                    : recipesList[0].recipeId == null
                        ? const SpinKitPouringHourGlass(
                            size: 30,
                            color: AppColors.appcolor,
                          )
                        : Expanded(
                            flex: 4,
                            child: GridView.builder(
                                itemCount: recipesList.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1, // Number of columns
                                        crossAxisSpacing:
                                            3.0, // Space between columns
                                        mainAxisSpacing:
                                            8.0, // Space between rows
                                        mainAxisExtent: 210),
                                shrinkWrap: true,
                                padding: EdgeInsets.only(
                                    top: 10, left: 8, right: 8, bottom: 15),
                                itemBuilder: ((context, index) {
                                  return InkWell(
                                    onTap: () {
                                      toNext(
                                          context: context,
                                          widget: RecipeDetailScreen(
                                            recipesModel: recipesList[index],
                                          ));
                                    },
                                    child: Container(
                                      height: 45,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(11)),
                                        elevation: 3,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CacheNetworkImageWidget(
                                              imgUrl: recipesList[index]
                                                  .recipeImage
                                                  .toString(),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              radius: 7,
                                              height: 160,
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    recipesList[index]
                                                        .recipeTitle
                                                        .toString(),
                                                    style: fontW5S12(context)!
                                                        .copyWith(
                                                            fontSize: 14,
                                                            color: AppColors
                                                                .blackcolor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                  ),
                                                  Text(
                                                    recipesList[index]
                                                        .dateCreated!
                                                        .toDate()
                                                        .format("d-M-Y"),
                                                    style: fontW5S12(context)!
                                                        .copyWith(
                                                            fontSize: 11,
                                                            color: AppColors
                                                                .blackcolor
                                                                .withOpacity(
                                                                    0.5),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                })));
              })
        ],
      ),
    );
  }
}
