import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saluswell_dietitan_app_updated/src/authenticationsection/screens/professionalInformationScreen.dart';

import '../../../common/helperFunctions/navigatorHelper.dart';
import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/textfield_widget.dart';
import '../providers/authProvider.dart';
import 'loginScreen.dart';

class BankingInformationScreen extends StatefulWidget {
  static String routeName = "BankingInformationScreen";

  const BankingInformationScreen({Key? key}) : super(key: key);

  @override
  State<BankingInformationScreen> createState() =>
      _BankingInformationScreenState();
}

class _BankingInformationScreenState extends State<BankingInformationScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, __) {
      return Scaffold(
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

                    //   width: 350,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(28)),
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
                                  width: 210,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Banking",
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
                                            color:
                                                AppColors.lightdarktextcolor)),
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
                                                  .branchNameController,
                                              textFieldHeight: 55,
                                              enabled: true,
                                              maxlines: 1,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please enter branch name";
                                                }
                                                return null;
                                              },
                                              // suffixIcon:
                                              //     const Icon(Icons.arrow_drop_down),
                                              toppadding: 20,
                                              maxLengt: 30,
                                              hintText: "Bank Branch Name",
                                              textInputType:
                                                  TextInputType.emailAddress),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          TextFieldWidget(
                                              showSuffixIcon: false,
                                              controller: authProvider
                                                  .accountTypeController,
                                              textFieldHeight: 55,
                                              suffixIcon:
                                                  Icon(Icons.arrow_drop_down),
                                              enabled: true,
                                              maxLengt: 30,
                                              maxlines: 1,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please enter account type";
                                                }
                                                return null;
                                              },
                                              toppadding: 20,
                                              hintText: "Account Type",
                                              textInputType:
                                                  TextInputType.emailAddress),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          TextFieldWidget(
                                              showSuffixIcon: false,
                                              controller: authProvider
                                                  .accountNumberController,
                                              textFieldHeight: 55,
                                              maxlines: 1,
                                              toppadding: 18,
                                              maxLengt: 40,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please enter account number";
                                                }
                                                return null;
                                              },
                                              hintText: "Account Number",
                                              textInputType:
                                                  TextInputType.number),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          TextFieldWidget(
                                              showSuffixIcon: false,
                                              controller: authProvider
                                                  .transitNumberController,
                                              textFieldHeight: 55,
                                              maxlines: 1,
                                              toppadding: 18,
                                              maxLengt: 40,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please enter transit number";
                                                }
                                                return null;
                                              },
                                              hintText: "Transit Number",
                                              textInputType:
                                                  TextInputType.number),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          TextFieldWidget(
                                              showSuffixIcon: false,
                                              controller: authProvider
                                                  .finincalInstutuionnumber,
                                              textFieldHeight: 55,
                                              maxlines: 1,
                                              toppadding: 18,
                                              maxLengt: 40,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please enter financial institution number";
                                                }
                                                return null;
                                              },
                                              hintText:
                                                  "Financial Institution Number",
                                              textInputType:
                                                  TextInputType.number),
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
                                height: 40,
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
                                      " 3 of 4",
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
                                  text: "Next",
                                  textfont: 16,
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      toNext(
                                          context: context,
                                          widget:
                                              ProfessionalInformationScreen());
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
      );
    });
  }
}
