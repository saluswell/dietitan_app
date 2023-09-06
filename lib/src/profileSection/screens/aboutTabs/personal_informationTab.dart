import 'package:flutter/material.dart';
import '../../../../common/helperFunctions/navigatorHelper.dart';
import '../../../../common/utils/appcolors.dart';
import '../../../../common/widgets/button_widget.dart';
import '../../../../common/widgets/textfield_widget.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController bussinessContactController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipPostalCodeController = TextEditingController();
  TextEditingController provinceController = TextEditingController();
  TextEditingController coutryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  showSuffixIcon: true,
                  controller: firstNameController,
                  textFieldHeight: 55,
                  enabled: false,
                  maxlines: 1,
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  toppadding: 27,
                  hintText: "Title",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 5,
              ),
              TextFieldWidget(
                  showSuffixIcon: false,
                  controller: firstNameController,
                  textFieldHeight: 55,
                  maxlines: 1,
                  toppadding: 18,
                  hintText: "First Name",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 5,
              ),
              TextFieldWidget(
                  showSuffixIcon: false,
                  controller: lastNameController,
                  textFieldHeight: 55,
                  maxlines: 1,
                  toppadding: 18,
                  hintText: "Last Name",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 5,
              ),
              TextFieldWidget(
                  showSuffixIcon: false,
                  controller: mobileNumberController,
                  textFieldHeight: 55,
                  maxlines: 1,
                  toppadding: 18,
                  hintText: "Mobile No",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 5,
              ),
              TextFieldWidget(
                  showSuffixIcon: false,
                  controller: bussinessContactController,
                  textFieldHeight: 55,
                  maxlines: 1,
                  toppadding: 18,
                  hintText: "Business Contact",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 5,
              ),
              TextFieldWidget(
                  showSuffixIcon: true,
                  controller: addressController,
                  textFieldHeight: 55,
                  maxlines: 1,
                  enabled: false,
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  toppadding: 27,
                  hintText: "Timezone",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 5,
              ),
              TextFieldWidget(
                  showSuffixIcon: false,
                  controller: addressController,
                  textFieldHeight: 55,
                  maxlines: 1,
                  toppadding: 18,
                  hintText: "Address",
                  textInputType: TextInputType.emailAddress),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: TextFieldWidget(
                        showSuffixIcon: false,
                        controller: cityController,
                        textFieldHeight: 55,
                        maxlines: 1,
                        toppadding: 18,
                        hintText: "City",
                        textInputType: TextInputType.emailAddress),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 5,
                    child: TextFieldWidget(
                        showSuffixIcon: false,
                        controller: zipPostalCodeController,
                        textFieldHeight: 55,
                        maxlines: 1,
                        toppadding: 18,
                        hintText: "Zip/Postal Code",
                        textInputType: TextInputType.emailAddress),
                  ),
                ],
              ),
              TextFieldWidget(
                  showSuffixIcon: false,
                  controller: provinceController,
                  textFieldHeight: 55,
                  maxlines: 1,
                  toppadding: 18,
                  hintText: "Province/State",
                  textInputType: TextInputType.emailAddress),
              TextFieldWidget(
                  showSuffixIcon: false,
                  controller: coutryController,
                  textFieldHeight: 55,
                  maxlines: 1,
                  toppadding: 18,
                  hintText: "Country",
                  textInputType: TextInputType.emailAddress),
              TextFieldWidget(
                  showSuffixIcon: true,
                  controller: coutryController,
                  textFieldHeight: 55,
                  enabled: false,
                  maxlines: 1,
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  toppadding: 27,
                  hintText: "Current Status",
                  textInputType: TextInputType.emailAddress),
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
