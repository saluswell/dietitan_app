import 'package:flutter/material.dart';

import '../../../../common/utils/appcolors.dart';
import '../../../../common/utils/themes.dart';
import '../../../authenticationsection/Models/userModel.dart';

class AboutUserProfileTabScreen extends StatelessWidget {
  final UserModel userModel;

  const AboutUserProfileTabScreen({Key? key, required this.userModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 45,
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
                SizedBox(
                  height: 14,
                ),
                Text(
                  "Personal Information",
                  style: fontW5S12(context)!.copyWith(
                      fontSize: 16,
                      color: AppColors.blackcolor,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "First Name",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.lightdarktextcolor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      userModel.personalInformationModel!.firstName.toString(),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Last Name",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.lightdarktextcolor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      userModel.personalInformationModel!.lastName.toString(),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mobile Number",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.lightdarktextcolor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      userModel.personalInformationModel!.mobileNumber
                          .toString(),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "City",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.lightdarktextcolor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      userModel.personalInformationModel!.city.toString(),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Country",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.lightdarktextcolor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      userModel.personalInformationModel!.country.toString(),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Address",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.lightdarktextcolor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      userModel.personalInformationModel!.adress.toString(),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Postal Code",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.lightdarktextcolor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      userModel.personalInformationModel!.postalCode.toString(),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Province",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.lightdarktextcolor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      userModel.personalInformationModel!.province.toString(),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  "Professional Information",
                  style: fontW5S12(context)!.copyWith(
                      fontSize: 16,
                      color: AppColors.blackcolor,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Qualifications",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.lightdarktextcolor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      userModel.professionalInformationModel!.qualfications
                          .toString(),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Area of focus",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.lightdarktextcolor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      userModel.professionalInformationModel!.areaOfFocus
                          .toString(),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Professional Approach",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.lightdarktextcolor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      userModel
                          .professionalInformationModel!.professionalApproach
                          .toString(),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Years of experience",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.lightdarktextcolor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      userModel.professionalInformationModel!.yearofExperience
                          .toString(),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Professional ID Number",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.lightdarktextcolor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      userModel
                          .professionalInformationModel!.professionalIdNumber
                          .toString(),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Languages Spoken",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.lightdarktextcolor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      userModel.professionalInformationModel!.languageSpoken
                          .toString(),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  "Banking Information",
                  style: fontW5S12(context)!.copyWith(
                      fontSize: 16,
                      color: AppColors.blackcolor,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bank Branc Name",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.lightdarktextcolor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      userModel.bankingInformationModel!.bankBrachName
                          .toString(),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Account Type",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.lightdarktextcolor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      userModel.bankingInformationModel!.accountType.toString(),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Account Number",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.lightdarktextcolor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      userModel.bankingInformationModel!.accountNumber
                          .toString(),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Finical Instution Number",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.lightdarktextcolor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      userModel
                          .bankingInformationModel!.financialInstitutionNumber
                          .toString(),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transit Number",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.lightdarktextcolor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      userModel.bankingInformationModel!.transitNumber
                          .toString(),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
