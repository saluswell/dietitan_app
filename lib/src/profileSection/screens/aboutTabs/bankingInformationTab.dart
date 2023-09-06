import 'package:flutter/material.dart';

import '../../../../common/utils/appcolors.dart';
import '../../../../common/widgets/button_widget.dart';
import '../../../../common/widgets/textfield_widget.dart';

class BankingInformation extends StatefulWidget {
  const BankingInformation({Key? key}) : super(key: key);

  @override
  State<BankingInformation> createState() => _BankingInformationState();
}

class _BankingInformationState extends State<BankingInformation> {
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController transitNumberController = TextEditingController();
  TextEditingController finincalInstutuionnumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              TextFieldWidget(
                  showSuffixIcon: true,
                  controller: accountNumberController,
                  textFieldHeight: 55,
                  enabled: false,
                  maxlines: 1,
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  toppadding: 27,
                  hintText: "Bank Branch Name",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 5,
              ),
              TextFieldWidget(
                  showSuffixIcon: true,
                  controller: accountNumberController,
                  textFieldHeight: 55,
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  enabled: false,
                  maxlines: 1,
                  toppadding: 26,
                  hintText: "Account Type",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 5,
              ),
              TextFieldWidget(
                  showSuffixIcon: false,
                  controller: accountNumberController,
                  textFieldHeight: 55,
                  maxlines: 1,
                  toppadding: 18,
                  hintText: "Account Number",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 5,
              ),
              TextFieldWidget(
                  showSuffixIcon: false,
                  controller: transitNumberController,
                  textFieldHeight: 55,
                  maxlines: 1,
                  toppadding: 18,
                  hintText: "Transit Number",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 5,
              ),
              TextFieldWidget(
                  showSuffixIcon: false,
                  controller: finincalInstutuionnumber,
                  textFieldHeight: 55,
                  maxlines: 1,
                  toppadding: 18,
                  hintText: "Financial Institution Number",
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
