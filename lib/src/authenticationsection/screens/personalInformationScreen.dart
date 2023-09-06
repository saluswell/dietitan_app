import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../common/helperFunctions/navigatorHelper.dart';
import '../../../common/helperFunctions/showsnackbar.dart';
import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/textfield_widget.dart';
import '../../../res.dart';
import '../../resourcesSection/healthTipsSection/widgets/dropdown_widget.dart';
import '../providers/authProvider.dart';
import 'bankingInformation.dart';

class PersonalInformationScreen extends StatefulWidget {
  static String routeName = "PersonalInformationScreen";

  const PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  bool? isLiablityenable = false;
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

                    //  width: 350,
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
                                  width: 140,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Personal",
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
                                            'Kindly provide personal information to continue.                     ',
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
                                          CustomDropDownWidget(
                                            value:
                                                authProvider.seletedType == null
                                                    ? "Register As"
                                                    : authProvider.seletedType
                                                        .toString(),
                                            list: authProvider.recordvarList,
                                            onChanged: (value) {
                                              authProvider
                                                  .updateRecordVarValue(value);
                                            },
                                          ),
                                          // TextFieldWidget(
                                          //     showSuffixIcon: false,
                                          //     controller:
                                          //         authProvider.titleController,
                                          //     textFieldHeight: 55,
                                          //     maxLengt: 30,
                                          //     enabled: false,
                                          //     maxlines: 1,
                                          //     // suffixIcon:
                                          //     //     const Icon(Icons.arrow_drop_down),
                                          //     toppadding: 20,
                                          //     hintText: "Title",
                                          //     validator: (value) {
                                          //       if (value!.isEmpty) {
                                          //         return "Please enter Title";
                                          //       }
                                          //       return null;
                                          //     },
                                          //     textInputType:
                                          //         TextInputType.emailAddress),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TextFieldWidget(
                                              showSuffixIcon: false,
                                              controller: authProvider
                                                  .firstNameController,
                                              textFieldHeight: 55,
                                              maxLengt: 30,
                                              maxlines: 1,
                                              toppadding: 18,
                                              hintText: "First Name",
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please enter first name";
                                                }
                                                return null;
                                              },
                                              textInputType:
                                                  TextInputType.emailAddress),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          TextFieldWidget(
                                              showSuffixIcon: false,
                                              controller: authProvider
                                                  .lastNameController,
                                              textFieldHeight: 55,
                                              maxlines: 1,
                                              toppadding: 18,
                                              hintText: "Last Name",
                                              maxLengt: 30,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please enter last name";
                                                }
                                                return null;
                                              },
                                              textInputType:
                                                  TextInputType.emailAddress),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          TextFieldWidget(
                                              showSuffixIcon: false,
                                              controller: authProvider
                                                  .mobileNumberController,
                                              textFieldHeight: 55,
                                              maxlines: 1,
                                              toppadding: 18,
                                              maxLengt: 20,
                                              hintText: "Mobile No",
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please enter mobile number";
                                                }
                                                return null;
                                              },
                                              textInputType:
                                                  TextInputType.phone),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          TextFieldWidget(
                                              showSuffixIcon: false,
                                              controller: authProvider
                                                  .bussinessContactController,
                                              textFieldHeight: 55,
                                              maxlines: 1,
                                              maxLengt: 20,
                                              toppadding: 18,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please enter business contact";
                                                }
                                                return null;
                                              },
                                              hintText: "Business Contact",
                                              textInputType:
                                                  TextInputType.phone),
                                          // const SizedBox(
                                          //   height: 5,
                                          // ),
                                          // TextFieldWidget(
                                          //     showSuffixIcon: true,
                                          //     controller: addressController,
                                          //     textFieldHeight: 55,
                                          //     maxlines: 1,
                                          //     enabled: false,
                                          //     suffixIcon:
                                          //         const Icon(Icons.arrow_drop_down),
                                          //     toppadding: 27,
                                          //     hintText: "Timezone",
                                          //     textInputType: TextInputType.emailAddress),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          TextFieldWidget(
                                              showSuffixIcon: false,
                                              controller: authProvider
                                                  .addressController,
                                              textFieldHeight: 55,
                                              maxlines: 1,
                                              maxLengt: 60,
                                              toppadding: 18,
                                              hintText: "Address",
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please enter address";
                                                }
                                                return null;
                                              },
                                              textInputType:
                                                  TextInputType.streetAddress),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: TextFieldWidget(
                                                    showSuffixIcon: false,
                                                    controller: authProvider
                                                        .cityController,
                                                    textFieldHeight: 55,
                                                    maxlines: 1,
                                                    maxLengt: 30,
                                                    toppadding: 18,
                                                    hintText: "City",
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "Please enter city";
                                                      }
                                                      return null;
                                                    },
                                                    textInputType: TextInputType
                                                        .emailAddress),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                flex: 5,
                                                child: TextFieldWidget(
                                                    showSuffixIcon: false,
                                                    controller: authProvider
                                                        .zipPostalCodeController,
                                                    textFieldHeight: 55,
                                                    maxlines: 1,
                                                    maxLengt: 15,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "Please enter postal code";
                                                      }
                                                      return null;
                                                    },
                                                    toppadding: 18,
                                                    hintText: "Zip/Postal Code",
                                                    textInputType:
                                                        TextInputType.number),
                                              ),
                                            ],
                                          ),
                                          TextFieldWidget(
                                              showSuffixIcon: false,
                                              controller: authProvider
                                                  .provinceController,
                                              textFieldHeight: 55,
                                              maxlines: 1,
                                              toppadding: 18,
                                              maxLengt: 40,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please enter province/state";
                                                }
                                                return null;
                                              },
                                              hintText: "Province/State",
                                              textInputType:
                                                  TextInputType.emailAddress),
                                          TextFieldWidget(
                                              showSuffixIcon: false,
                                              controller:
                                                  authProvider.coutryController,
                                              textFieldHeight: 55,
                                              maxlines: 1,
                                              toppadding: 18,
                                              hintText: "Country",
                                              maxLengt: 30,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please enter country name";
                                                }
                                                return null;
                                              },
                                              textInputType:
                                                  TextInputType.emailAddress),
                                          // TextFieldWidget(
                                          //     showSuffixIcon: true,
                                          //     controller: coutryController,
                                          //     textFieldHeight: 55,
                                          //     enabled: false,
                                          //     maxlines: 1,
                                          //     suffixIcon:
                                          //         const Icon(Icons.arrow_drop_down),
                                          //     toppadding: 27,
                                          //     hintText: "Current Status",
                                          //     textInputType: TextInputType.emailAddress),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Spacer(),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (isLiablityenable == false) {
                                          isLiablityenable = true;
                                        } else {
                                          isLiablityenable = false;
                                        }
                                      });
                                      print("bool " +
                                          isLiablityenable.toString());
                                    },
                                    child: Container(
                                      height: 23,
                                      width: 23,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2,
                                              color: AppColors.appcolor),
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: isLiablityenable == true
                                            ? SvgPicture.asset(
                                                Res.tickicon,
                                                height: 12,
                                                width: 12,
                                              )
                                            : Text(""),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Agree to",
                                            style: fontW5S12(context)!.copyWith(
                                                fontSize: 14,
                                                color: AppColors
                                                    .lightdarktextcolor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            " Release ",
                                            style: fontW5S12(context)!.copyWith(
                                                fontSize: 14,
                                                color: AppColors.blackcolor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "and",
                                            style: fontW5S12(context)!.copyWith(
                                                fontSize: 14,
                                                color: AppColors
                                                    .lightdarktextcolor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "Waiver of Liability",
                                            style: fontW5S12(context)!.copyWith(
                                                fontSize: 14,
                                                color: AppColors.blackcolor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Form",
                                        style: fontW5S12(context)!.copyWith(
                                            fontSize: 14,
                                            color: AppColors.blackcolor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
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
                                      " 2 of 4",
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
                                      if (isLiablityenable == false) {
                                        showSnackBarMessage(
                                            backgroundcolor: AppColors.redcolor,
                                            contentColor: AppColors.whitecolor,
                                            context: context,
                                            content:
                                                "Please accept release and waiver of liability form ");
                                      } else if (authProvider.seletedType ==
                                              "Register As" ||
                                          authProvider.seletedType == null) {
                                        showSnackBarMessage(
                                            backgroundcolor: AppColors.redcolor,
                                            contentColor: AppColors.whitecolor,
                                            context: context,
                                            content:
                                                "Please Select Register As");
                                      } else {
                                        //authProvider.createUser();
                                        toNext(
                                            context: context,
                                            widget: BankingInformationScreen());
                                      }
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
                                    Text(
                                      " Login",
                                      style: fontW5S12(context)!.copyWith(
                                          fontSize: 16,
                                          decoration: TextDecoration.underline,
                                          color: AppColors.appcolor,
                                          fontWeight: FontWeight.w500),
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
