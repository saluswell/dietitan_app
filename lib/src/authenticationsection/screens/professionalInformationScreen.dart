import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../common/helperFunctions/navigatorHelper.dart';
import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/textfield_widget.dart';
import '../providers/authProvider.dart';
import 'loginScreen.dart';

class ProfessionalInformationScreen extends StatefulWidget {
  static String routeName = "ProfessionalInformationScreen";

  const ProfessionalInformationScreen({Key? key}) : super(key: key);

  @override
  State<ProfessionalInformationScreen> createState() =>
      _ProfessionalInformationScreenState();
}

class _ProfessionalInformationScreenState
    extends State<ProfessionalInformationScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, __) {
      return LoadingOverlay(
        isLoading: authProvider.isLoading,
        progressIndicator: SpinKitPouringHourGlass(
          size: 30,
          color: AppColors.appcolor,
        ),
        child: Scaffold(
          backgroundColor: AppColors.appcolor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  flex: 6,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      //  height: 660,

                      // width: 340,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28)),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17)),
                        elevation: 3,
                        color: AppColors.whitecolor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    height: 3,
                                    width: 310,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Professional",
                                    style: fontW5S12(context)!.copyWith(
                                        fontSize: 30,
                                        color: AppColors.blackcolor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Information",
                                    style: fontW5S12(context)!.copyWith(
                                        fontSize: 30,
                                        color: AppColors.blackcolor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 36),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text:
                                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.                     ',
                                          style: fontW5S12(context)!.copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors
                                                  .lightdarktextcolor)),
                                    ],
                                  ),
                                  textScaleFactor: 0.7,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 350,
                                        child: ListView(
                                          padding: const EdgeInsets.only(),
                                          children: [
                                            TextFieldWidget(
                                                showSuffixIcon: false,
                                                controller: authProvider
                                                    .professionalIDNumberController,
                                                textFieldHeight: 55,
                                                enabled: true,
                                                maxLengt: 40,
                                                maxlines: 1,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Please enter professional id number";
                                                  }
                                                  return null;
                                                },
                                                suffixIcon: const Icon(
                                                    Icons.arrow_drop_down),
                                                toppadding: 19,
                                                hintText:
                                                    "Professional ID number",
                                                textInputType:
                                                    TextInputType.number),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            TextFieldWidget(
                                                showSuffixIcon: false,
                                                controller: authProvider
                                                    .QualficationsController,
                                                textFieldHeight: 55,
                                                suffixIcon:
                                                    Icon(Icons.arrow_drop_down),
                                                enabled: true,
                                                maxlines: 1,
                                                toppadding: 19,
                                                maxLengt: 40,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Please enter qualifications";
                                                  }
                                                  return null;
                                                },
                                                hintText:
                                                    "Qualifications (include speciality)",
                                                textInputType:
                                                    TextInputType.emailAddress),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            TextFieldWidget(
                                                showSuffixIcon: false,
                                                controller: authProvider
                                                    .yearsOfExperienceController,
                                                textFieldHeight: 55,
                                                maxlines: 1,
                                                toppadding: 18,
                                                maxLengt: 15,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Please enter years of experience";
                                                  }
                                                  return null;
                                                },
                                                hintText: "Years of experience",
                                                textInputType:
                                                    TextInputType.number),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            TextFieldWidget(
                                                showSuffixIcon: false,
                                                controller: authProvider
                                                    .areaOfFocusController,
                                                textFieldHeight: 55,
                                                maxlines: 1,
                                                toppadding: 18,
                                                maxLengt: 40,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Please enter area of focus";
                                                  }
                                                  return null;
                                                },
                                                hintText: "Area of focus",
                                                textInputType:
                                                    TextInputType.text),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            TextFieldWidget(
                                                showSuffixIcon: false,
                                                controller: authProvider
                                                    .professionalApproachController,
                                                textFieldHeight: 55,
                                                maxlines: 1,
                                                toppadding: 18,
                                                maxLengt: 150,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Please enter professional approach";
                                                  }
                                                  return null;
                                                },
                                                hintText:
                                                    "Professional Approach",
                                                textInputType:
                                                    TextInputType.emailAddress),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            TextFieldWidget(
                                                showSuffixIcon: false,
                                                controller: authProvider
                                                    .languageSpokenController,
                                                textFieldHeight: 55,
                                                maxlines: 1,
                                                toppadding: 18,
                                                maxLengt: 40,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Please enter language spoken";
                                                  }
                                                  return null;
                                                },
                                                hintText: "Language Spoken",
                                                textInputType:
                                                    TextInputType.text),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Spacer(),

                                const SizedBox(
                                  height: 50,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Step",
                                        style: fontW5S12(context)!.copyWith(
                                            fontSize: 16,
                                            color: AppColors.blackcolor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        " 4 of 4",
                                        style: fontW5S12(context)!.copyWith(
                                            fontSize: 16,
                                            color: AppColors.appcolor,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                CommonButtonWidget(
                                    horizontalPadding: 8,
                                    backgroundcolor: AppColors.appcolor,
                                    text: "Create Account",
                                    textfont: 16,
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        authProvider.createUser();
                                      }
                                    }),
                                const SizedBox(
                                  height: 15,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Already have an account?",
                                        style: fontW5S12(context)!.copyWith(
                                            fontSize: 16,
                                            color: AppColors.blackcolor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          toNext(
                                              context: context,
                                              widget: LoginScreen());
                                        },
                                        child: Text(
                                          " Login",
                                          style: fontW5S12(context)!.copyWith(
                                              fontSize: 16,
                                              decoration:
                                                  TextDecoration.underline,
                                              color: AppColors.appcolor,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
