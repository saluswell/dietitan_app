import 'package:flutter/material.dart';

import '../../../../common/utils/appcolors.dart';
import '../../../../common/widgets/button_widget.dart';
import '../../../../common/widgets/textfield_widget.dart';

class ProfessionalInformation extends StatefulWidget {
  const ProfessionalInformation({Key? key}) : super(key: key);

  @override
  State<ProfessionalInformation> createState() =>
      _ProfessionalInformationState();
}

class _ProfessionalInformationState extends State<ProfessionalInformation> {
  TextEditingController professionalIDNumberController =
      TextEditingController();
  TextEditingController QualficationsController = TextEditingController();
  TextEditingController yearsOfExperienceController = TextEditingController();
  TextEditingController areaOfFocusController = TextEditingController();
  TextEditingController professionalApproachController =
      TextEditingController();
  TextEditingController languageSpokenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              TextFieldWidget(
                  showSuffixIcon: false,
                  controller: professionalIDNumberController,
                  textFieldHeight: 55,
                  enabled: true,
                  maxlines: 1,
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  toppadding: 19,
                  hintText: "Professional ID number",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 5,
              ),
              TextFieldWidget(
                  showSuffixIcon: false,
                  controller: QualficationsController,
                  textFieldHeight: 55,
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  enabled: true,
                  maxlines: 1,
                  toppadding: 19,
                  hintText: "Qualifications (include speciality)",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 5,
              ),
              TextFieldWidget(
                  showSuffixIcon: false,
                  controller: yearsOfExperienceController,
                  textFieldHeight: 55,
                  maxlines: 1,
                  toppadding: 18,
                  hintText: "Years of experience",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 5,
              ),
              TextFieldWidget(
                  showSuffixIcon: false,
                  controller: areaOfFocusController,
                  textFieldHeight: 55,
                  maxlines: 1,
                  toppadding: 18,
                  hintText: "Area of focus",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 5,
              ),
              TextFieldWidget(
                  showSuffixIcon: false,
                  controller: professionalApproachController,
                  textFieldHeight: 55,
                  maxlines: 1,
                  toppadding: 18,
                  hintText: "Professional Approach",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 5,
              ),
              TextFieldWidget(
                  showSuffixIcon: false,
                  controller: languageSpokenController,
                  textFieldHeight: 55,
                  maxlines: 1,
                  toppadding: 18,
                  hintText: "Language Spoken",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 30,
              ),
              CommonButtonWidget(
                  horizontalPadding: 8,
                  backgroundcolor: AppColors.appcolor,
                  text: "Update",
                  textfont: 16,
                  onTap: () {
                    // toNext(
                    //     context: context,
                    //     widget: PersonalInformationScreen());
                  }),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
