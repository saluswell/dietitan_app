import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:saluswell_dietitan_app_updated/common/helperFunctions/dialogHelper.dart';
import 'package:saluswell_dietitan_app_updated/src/recipesSection/providers/recipes_provider.dart';

import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/textfield_widget.dart';

class AddNewRecipeScreen extends StatefulWidget {
  const AddNewRecipeScreen({Key? key}) : super(key: key);

  @override
  State<AddNewRecipeScreen> createState() => _AddNewRecipeScreenState();
}

class _AddNewRecipeScreenState extends State<AddNewRecipeScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipesProvider>(builder: (context, recipesProvider, __) {
      return LoadingOverlay(
        isLoading: recipesProvider.isLoading,
        progressIndicator: SpinKitPouringHourGlass(
          color: AppColors.appcolor,
          size: 25,
        ),
        child: Scaffold(
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonButtonWidget(
                  horizontalPadding: 8,
                  backgroundcolor: AppColors.appcolor,
                  text: "Upload Recipe",
                  textfont: 16,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      recipesProvider.createRecipe();
                    }
                    // toNext(
                    //     context: context,
                    //     widget: BottomNavScreen());
                  }),
              const SizedBox(
                height: 25,
              )
            ],
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
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
                          "Add Recipe",
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
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          "Choose Recipe Image",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 16,
                              color: AppColors.blackcolor,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          " (Max Size: 5 Mb)",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 16,
                              color: AppColors.lightdarktextcolor,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: recipesProvider.recipeImage == null
                          ? Container(
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColors.lightdarktextcolor
                                      .withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: ((context) => SimpleDialog(
                                                title: const Text(
                                                  "Select Docs",
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.whitecolor),
                                                ),
                                                children: [
                                                  Row(
                                                    children: [
                                                      SimpleDialogOption(
                                                        child: Row(
                                                          children: const [
                                                            Icon(
                                                              Icons.image,
                                                              color: AppColors
                                                                  .whitecolor,
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              "Gallery",
                                                              style: TextStyle(
                                                                  color: AppColors
                                                                      .whitecolor),
                                                            ),
                                                          ],
                                                        ),
                                                        onPressed: () {
                                                          //
                                                          recipesProvider
                                                              .pickRecipeImage(
                                                                  context,
                                                                  ImageSource
                                                                      .gallery);
                                                          Navigator.pop(
                                                              context);
                                                          //
                                                        },
                                                      ),
                                                      SimpleDialogOption(
                                                        child: Row(
                                                          children: const [
                                                            Icon(
                                                              Icons.camera_alt,
                                                              color: AppColors
                                                                  .whitecolor,
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              "Camera",
                                                              style: TextStyle(
                                                                  color: AppColors
                                                                      .whitecolor),
                                                            ),
                                                          ],
                                                        ),
                                                        onPressed: () {
                                                          recipesProvider
                                                              .pickRecipeImage(
                                                                  context,
                                                                  ImageSource
                                                                      .camera);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )));
                                      //  getImage(true);
                                    },
                                    child: Container(
                                      height: 47,
                                      width: 145,
                                      decoration: BoxDecoration(
                                          color: AppColors.lightwhitecolor,
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: AppColors.appcolor,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text("Add Image",
                                                style: TextStyle(
                                                    // fontFamily: 'Gilroy',
                                                    color: AppColors.blackcolor,
                                                    // decoration: TextDecoration.underline,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Axiforma',
                                                    fontSize: 13)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text("Preview will appear here ",
                                      style: TextStyle(
                                          // fontFamily: 'Gilroy',
                                          color: AppColors.appcolor,
                                          // decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Axiforma',
                                          fontSize: 13)),
                                  const Text(" after uploading",
                                      style: TextStyle(
                                          // fontFamily: 'Gilroy',
                                          color: AppColors.appcolor,
                                          // decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Axiforma',
                                          fontSize: 13)),
                                ],
                              ),
                            )
                          : Stack(
                              children: [
                                Container(
                                    height: 150,
                                    width: double.infinity,
                                    // child: SvgPicture.asset(
                                    //   Res.invitefriendbanner,
                                    //   fit: BoxFit.cover,
                                    // ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(17),
                                      border: Border.all(
                                          width: 3, color: AppColors.appcolor),
                                      //shape: BoxShape.circle,

                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: FileImage(
                                            recipesProvider.recipeImage!),
                                      ),
                                    )),
                                Positioned.fill(
                                  top: -60,
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.appcolor,
                                        ),
                                        child: Center(
                                          child: IconButton(
                                              icon: const Icon(
                                                Icons.camera_alt_outlined,
                                                color: Colors.white,
                                                size: 19,
                                              ),
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        ((context) =>
                                                            SimpleDialog(
                                                              title: const Text(
                                                                "Select Docs",
                                                                style: TextStyle(
                                                                    color: AppColors
                                                                        .whitecolor),
                                                              ),
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    SimpleDialogOption(
                                                                      child:
                                                                          Row(
                                                                        children: const [
                                                                          Icon(
                                                                            Icons.image,
                                                                            color:
                                                                                AppColors.whitecolor,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          Text(
                                                                            "Gallery",
                                                                            style:
                                                                                TextStyle(color: AppColors.whitecolor),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        //
                                                                        recipesProvider.pickRecipeImage(
                                                                            context,
                                                                            ImageSource.gallery);
                                                                        Navigator.pop(
                                                                            context);
                                                                        //
                                                                      },
                                                                    ),
                                                                    SimpleDialogOption(
                                                                      child:
                                                                          Row(
                                                                        children: const [
                                                                          Icon(
                                                                            Icons.camera_alt,
                                                                            color:
                                                                                AppColors.whitecolor,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          Text(
                                                                            "Camera",
                                                                            style:
                                                                                TextStyle(color: AppColors.whitecolor),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        recipesProvider.pickRecipeImage(
                                                                            context,
                                                                            ImageSource.camera);
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            )));
                                                // getImage(true);
                                              }),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Row(
                      children: [
                        Text(
                          "Recipe Title ",
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFieldWidget(
                        showSuffixIcon: false,
                        controller: recipesProvider.recipeTitleController,
                        textFieldHeight: 55,
                        maxlines: 1,
                        maxLengt: 50,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter recipe title";
                          }
                          return null;
                        },
                        toppadding: 18,
                        hintText: "Enter Title",
                        textInputType: TextInputType.emailAddress),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Row(
                      children: [
                        Text(
                          "Meal Type ",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 15,
                              color: AppColors.blackcolor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: InkWell(
                      onTap: () {
                        DialogHelper.showBottomSheet(
                            widget: Container(
                          height: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Choose Meal Type",
                                style: fontW5S12(context)!.copyWith(
                                    fontSize: 16,
                                    color: AppColors.blackcolor,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: recipesProvider.mealType.length,
                                    padding: EdgeInsets.only(bottom: 20),
                                    itemBuilder: (context, index) {
                                      final dietItems =
                                          Provider.of<RecipesProvider>(context)
                                              .mealType;
                                      final item = dietItems[index];

                                      final isSelected = recipesProvider
                                          .selectedMealType
                                          .contains(item);
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 5),
                                        child: InkWell(
                                          onTap: () {
                                            Provider.of<RecipesProvider>(
                                                    context,
                                                    listen: false)
                                                .toggleMealTypeSelection(index);
                                          },
                                          child: SizedBox(
                                            height: 50,
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(7)),
                                              elevation: 4,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 12),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      item,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: AppColors
                                                              .blackcolor),
                                                    ),
                                                    Container(
                                                      child: isSelected
                                                          ? Icon(
                                                              Icons.check,
                                                              color: AppColors
                                                                  .appcolor,
                                                            )
                                                          : null,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              )
                            ],
                          ),
                        ));
                      },
                      child: TextFieldWidget(
                          showSuffixIcon: true,
                          suffixIcon: Icon(Icons.arrow_drop_down_outlined),
                          //   controller: recipesProvider.recipeStepsController,
                          textFieldHeight: 45,
                          enabled: false,
                          maxlines: 1,
                          maxLengt: 2500,

                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return "Please enter recipe steps";
                          //   }
                          //   return null;
                          // },
                          toppadding: 20,
                          hintText: "Select Meal",
                          textInputType: TextInputType.emailAddress),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Row(
                      children: [
                        Text(
                          "Diet Type ",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 15,
                              color: AppColors.blackcolor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFieldWidget(
                        showSuffixIcon: false,
                        suffixIcon: Icon(Icons.arrow_drop_down_outlined),
                        controller: recipesProvider.dietTypeController,
                        textFieldHeight: 45,
                        enabled: true,
                        maxlines: 1,
                        maxLengt: 2500,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter diet type";
                          }
                          return null;
                        },

                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return "Please enter recipe steps";
                        //   }
                        //   return null;
                        // },
                        toppadding: 20,
                        hintText: "Enter Diet Types",
                        textInputType: TextInputType.emailAddress),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Row(
                      children: [
                        Text(
                          "Allergens",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 15,
                              color: AppColors.blackcolor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: InkWell(
                      onTap: () {
                        DialogHelper.showBottomSheet(
                            widget: Container(
                          height: 500,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Choose Allergens",
                                style: fontW5S12(context)!.copyWith(
                                    fontSize: 16,
                                    color: AppColors.blackcolor,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: recipesProvider.foodItems.length,
                                    padding: EdgeInsets.only(bottom: 20),
                                    itemBuilder: (context, index) {
                                      final foodItems =
                                          Provider.of<RecipesProvider>(context)
                                              .foodItems;
                                      final item = foodItems[index];

                                      final isSelected = recipesProvider
                                          .selectedFoodItems
                                          .contains(item);
                                      return SizedBox(
                                        height: 50,
                                        child: ListTile(
                                          title: Text(
                                            item,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.blackcolor),
                                          ),
                                          trailing: isSelected
                                              ? Icon(
                                                  Icons.check,
                                                  color: AppColors.appcolor,
                                                )
                                              : null,
                                          onTap: () {
                                            Provider.of<RecipesProvider>(
                                                    context,
                                                    listen: false)
                                                .toggleAllergenSelection(index);
                                          },
                                        ),
                                      );
                                    }),
                              )
                            ],
                          ),
                        ));
                      },
                      child: TextFieldWidget(
                          showSuffixIcon: true,
                          suffixIcon: Icon(Icons.arrow_drop_down_outlined),
                          // controller: recipesProvider.recipeStepsController,
                          textFieldHeight: 45,
                          enabled: false,
                          maxlines: 1,
                          maxLengt: 2500,

                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return "Please enter recipe steps";
                          //   }
                          //   return null;
                          // },
                          toppadding: 20,
                          hintText: "Select Allergens",
                          textInputType: TextInputType.emailAddress),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Row(
                      children: [
                        Text(
                          "Conditions",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 15,
                              color: AppColors.blackcolor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: InkWell(
                      onTap: () {
                        // DialogHelper.showBottomSheet(
                        //     widget: Container(
                        //   height: 500,
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: [
                        //       SizedBox(
                        //         height: 30,
                        //       ),
                        //       Text(
                        //         "Choose Conditions",
                        //         style: fontW5S12(context)!.copyWith(
                        //             fontSize: 16,
                        //             color: AppColors.blackcolor,
                        //             fontWeight: FontWeight.w600),
                        //       ),
                        //       SizedBox(
                        //         height: 20,
                        //       ),
                        //       Expanded(
                        //         child: ListView.builder(
                        //             itemCount:
                        //                 recipesProvider.recipeConditions.length,
                        //             padding: EdgeInsets.only(bottom: 20),
                        //             itemBuilder: (context, index) {
                        //               final foodItems =
                        //                   Provider.of<RecipesProvider>(context)
                        //                       .recipeConditions;
                        //               final item = foodItems[index];
                        //
                        //               final isSelected = recipesProvider
                        //                   .selectedRecipeConditions
                        //                   .contains(item);
                        //               return SizedBox(
                        //                 height: 50,
                        //                 child: ListTile(
                        //                   title: Text(
                        //                     item.name,
                        //                     style: TextStyle(
                        //                         fontSize: 14,
                        //                         fontWeight: FontWeight.w600,
                        //                         color: AppColors.blackcolor),
                        //                   ),
                        //                   trailing: isSelected
                        //                       ? Icon(
                        //                           Icons.check,
                        //                           color: AppColors.appcolor,
                        //                         )
                        //                       : null,
                        //                   onTap: () {
                        //                     Provider.of<RecipesProvider>(context,
                        //                             listen: false)
                        //                         .toggleRecipeConditionsSelection(
                        //                             index);
                        //                   },
                        //                 ),
                        //               );
                        //             }),
                        //       )
                        //     ],
                        //   ),
                        // ));
                      },
                      child: TextFieldWidget(
                          showSuffixIcon: false,
                          suffixIcon: Icon(Icons.arrow_drop_down_outlined),
                          controller: recipesProvider.conditionsController,
                          textFieldHeight: 45,
                          enabled: true,
                          maxlines: 1,
                          maxLengt: 2500,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter conditions";
                            }
                            return null;
                          },

                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return "Please enter recipe steps";
                          //   }
                          //   return null;
                          // },
                          toppadding: 20,
                          hintText: "Enter Conditions",
                          textInputType: TextInputType.emailAddress),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Row(
                      children: [
                        Text(
                          "Recipe Ingredients",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 15,
                              color: AppColors.blackcolor,
                              fontWeight: FontWeight.w500),
                        ),
                        // Text(
                        //   " (Max Chars: 50)",
                        //   style: fontW5S12(context)!.copyWith(
                        //       fontSize: 15,
                        //       color: AppColors.lightdarktextcolor,
                        //       fontWeight: FontWeight.w400),
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFieldWidget(
                        showSuffixIcon: false,
                        // controller: recipesProvider.recipeIngredientsController,
                        suffixIcon: Icon(Icons.add),
                        textFieldHeight: 55,
                        maxlines: 1,
                        maxLengt: 50,
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return "Please enter Ingredient to add";
                        //   }
                        //   return null;
                        // },
                        onCompleted: (val) {
                          if (val.isNotEmpty) {
                            recipesProvider.addIngredientsToList(val);
                          }
                        },
                        toppadding: 18,
                        hintText: "Enter Ingredient",
                        textInputType: TextInputType.emailAddress),
                  ),
                  if (recipesProvider.ingredients!.isNotEmpty) ...[
                    Container(
                      height: 45,
                      child: ListView.builder(
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: recipesProvider.ingredients!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10, top: 2),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    height: 45,
                                    //width: 80,
                                    child: Card(
                                      elevation: 4,
                                      color: AppColors.darkAppColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: Text(
                                            recipesProvider.ingredients![index]
                                                .toString(),
                                            style: TextStyle(
                                                color: AppColors.whitecolor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      right: -5,
                                      top: -2,
                                      child: InkWell(
                                        onTap: () {
                                          recipesProvider
                                              .removeIngredientsFromList(index);
                                        },
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(33),
                                              color: AppColors.redcolor),
                                          child: Center(
                                            child: Icon(
                                              Icons.close,
                                              color: AppColors.whitecolor,
                                              size: 16,
                                            ),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Row(
                      children: [
                        Text(
                          "Nutritional Values",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 15,
                              color: AppColors.blackcolor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFieldWidget(
                              showSuffixIcon: false,
                              suffixIcon: Icon(Icons.arrow_drop_down_outlined),
                              controller: recipesProvider.caloriesController,
                              textFieldHeight: 45,
                              enabled: true,
                              maxlines: 1,
                              maxLengt: 2500,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Calories";
                                }
                                return null;
                              },
                              toppadding: 20,
                              hintText: "Calories",
                              textInputType: TextInputType.emailAddress),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextFieldWidget(
                              showSuffixIcon: false,
                              suffixIcon: Icon(Icons.arrow_drop_down_outlined),
                              controller:
                                  recipesProvider.carbohydratesController,
                              textFieldHeight: 45,
                              enabled: true,
                              maxlines: 1,
                              maxLengt: 2500,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Carbohydrates";
                                }
                                return null;
                              },
                              toppadding: 20,
                              hintText: "Carbohydrates",
                              textInputType: TextInputType.emailAddress),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFieldWidget(
                              showSuffixIcon: false,
                              suffixIcon: Icon(Icons.arrow_drop_down_outlined),
                              controller: recipesProvider.proteinController,
                              textFieldHeight: 45,
                              enabled: true,
                              maxlines: 1,
                              maxLengt: 2500,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Protein";
                                }
                                return null;
                              },
                              toppadding: 20,
                              hintText: "Protein",
                              textInputType: TextInputType.emailAddress),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextFieldWidget(
                              showSuffixIcon: false,
                              suffixIcon: Icon(Icons.arrow_drop_down_outlined),
                              controller: recipesProvider.fiberController,
                              textFieldHeight: 45,
                              enabled: true,
                              maxlines: 1,
                              maxLengt: 2500,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Fiber";
                                }
                                return null;
                              },
                              toppadding: 20,
                              hintText: "Fiber",
                              textInputType: TextInputType.emailAddress),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFieldWidget(
                              showSuffixIcon: false,
                              suffixIcon: Icon(Icons.arrow_drop_down_outlined),
                              controller: recipesProvider.sodiumController,
                              textFieldHeight: 45,
                              enabled: true,
                              maxlines: 1,
                              maxLengt: 2500,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Sodium";
                                }
                                return null;
                              },
                              toppadding: 20,
                              hintText: "Sodium",
                              textInputType: TextInputType.emailAddress),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextFieldWidget(
                              showSuffixIcon: false,
                              suffixIcon: Icon(Icons.arrow_drop_down_outlined),
                              controller: recipesProvider.sugarController,
                              textFieldHeight: 45,
                              enabled: true,
                              maxlines: 1,
                              maxLengt: 2500,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Sugar";
                                }
                                return null;
                              },
                              toppadding: 20,
                              hintText: "Sugar",
                              textInputType: TextInputType.emailAddress),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Row(
                      children: [
                        Text(
                          "Recipe Steps",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 15,
                              color: AppColors.blackcolor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFieldWidget(
                        showSuffixIcon: false,
                        controller: recipesProvider.recipeStepsController,
                        textFieldHeight: 55,
                        maxlines: 10,
                        maxLengt: 2500,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter recipe steps";
                          }
                          return null;
                        },
                        toppadding: 18,
                        hintText: "Enter Steps",
                        textInputType: TextInputType.emailAddress),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Row(
                      children: [
                        Text(
                          "Breakdown of Essential Ingredients",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 15,
                              color: AppColors.blackcolor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFieldWidget(
                        showSuffixIcon: false,
                        controller:
                            recipesProvider.breakDownOfEssentialsController,
                        textFieldHeight: 55,
                        maxlines: 10,
                        maxLengt: 2500,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Breakdown of Essential Ingredients";
                          }
                          return null;
                        },
                        toppadding: 18,
                        hintText: "Enter Breakdown of Essential Ingredients",
                        textInputType: TextInputType.emailAddress),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

/// diet type
// DialogHelper.showBottomSheet(
// widget: Container(
// height: 500,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// SizedBox(
// height: 30,
// ),
// Text(
// "Choose Diet Type",
// style: fontW5S12(context)!.copyWith(
// fontSize: 16,
// color: AppColors.blackcolor,
// fontWeight: FontWeight.w600),
// ),
// SizedBox(
// height: 20,
// ),
// Expanded(
// child: ListView.builder(
// itemCount: recipesProvider.dietTypes.length,
// padding: EdgeInsets.only(bottom: 20),
// itemBuilder: (context, index) {
// final dietItems =
// Provider.of<RecipesProvider>(context)
//     .dietTypes;
// final item = dietItems[index];
//
// final isSelected = recipesProvider
//     .selectedDietTypes
//     .contains(item);
// return Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 12, vertical: 5),
// child: InkWell(
// onTap: () {
// Provider.of<RecipesProvider>(context,
// listen: false)
//     .toggleDietTypeSelection(index);
// },
// child: SizedBox(
// height: 50,
// child: Card(
// shape: RoundedRectangleBorder(
// borderRadius:
// BorderRadius.circular(7)),
// elevation: 4,
// child: Padding(
// padding:
// const EdgeInsets.symmetric(
// horizontal: 12),
// child: Row(
// mainAxisAlignment:
// MainAxisAlignment
//     .spaceBetween,
// children: [
// Text(
// item.name,
// style: TextStyle(
// fontSize: 14,
// fontWeight:
// FontWeight.w600,
// color: AppColors
//     .blackcolor),
// ),
// Container(
// child: isSelected
// ? Icon(
// Icons.check,
// color: AppColors
//     .appcolor,
// )
//     : null,
// )
// ],
// ),
// ),
// ),
// ),
// ),
// );
// }),
// )
// ],
// ),
// ));
