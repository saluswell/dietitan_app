import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:saluswell_dietitan_app_updated/src/authenticationsection/screens/personalInformationScreen.dart';

import '../../../common/helperFunctions/navigatorHelper.dart';
import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/textfield_widget.dart';
import '../providers/authProvider.dart';
import 'loginScreen.dart';

class CreateAccountScreen extends StatefulWidget {
  static String routeName = "CreateAccountScreen";

  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, __) {
      return LoadingOverlay(
        isLoading: authProvider.isLoading,
        progressIndicator: const CircularProgressIndicator(
          color: AppColors.appcolor,
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.appcolor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Expanded(
                  flex: 6,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      //  height: 660,

                      // width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28)),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17)),
                        elevation: 3,
                        color: AppColors.whitecolor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 3,
                                  width: 70,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Create",
                                  style: fontW5S12(context)!.copyWith(
                                      fontSize: 31,
                                      color: AppColors.blackcolor,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Account",
                                  style: fontW5S12(context)!.copyWith(
                                      fontSize: 31,
                                      color: AppColors.blackcolor,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 36),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text:
                                              'Please fill the below details to continue.                     ',
                                          style: fontW5S12(context)!.copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors
                                                  .lightdarktextcolor)),
                                    ],
                                  ),
                                  textScaleFactor: 0.7,
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    TextFieldWidget(
                                        showSuffixIcon: false,
                                        controller:
                                            authProvider.userNameController,
                                        textFieldHeight: 55,
                                        maxlines: 1,
                                        maxLengt: 20,
                                        toppadding: 18,
                                        validator: (String? value) {
                                          if (value?.isEmpty ?? true) {
                                            return "UserName is required";
                                          }
                                          return null;
                                        },
                                        hintText: "UserName",
                                        textInputType:
                                            TextInputType.emailAddress),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFieldWidget(
                                        maxLengt: 40,
                                        showSuffixIcon: false,
                                        controller:
                                            authProvider.emailController,
                                        textFieldHeight: 55,
                                        maxlines: 1,
                                        toppadding: 18,
                                        validator: (String? value) {
                                          if (value?.trim().isEmpty ?? true) {
                                            return "Email is requried";
                                          }

                                          String email = value ?? '';

                                          bool emailValid = RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(email);

                                          if (!emailValid) {
                                            return 'please use valid email address';
                                          }
                                          return null;
                                        },
                                        hintText: "Email Address",
                                        textInputType:
                                            TextInputType.emailAddress),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFieldWidget(
                                        maxLengt: 40,
                                        showSuffixIcon: true,
                                        controller:
                                            authProvider.passwordController,
                                        textFieldHeight: 55,
                                        maxlines: 1,
                                        obsecureText:
                                            authProvider.showconfirmobsecure,
                                        toppadding: 27,
                                        suffixIcon: Icon(
                                            authProvider.showconfirmobsecure ==
                                                    true
                                                ? Icons.visibility_off
                                                : Icons.visibility),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please Enter Password";
                                          } else if (!RegExp(
                                                  r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$")
                                              .hasMatch(value)) {
                                            return "Please Enter Strong Password";
                                          }
                                        },
                                        onsuffixIconTap: () {
                                          setState(() {
                                            if (authProvider
                                                    .showconfirmobsecure ==
                                                true) {
                                              authProvider.showconfirmobsecure =
                                                  false;
                                            } else {
                                              authProvider.showconfirmobsecure =
                                                  true;
                                            }
                                          });
                                        },
                                        hintText: "Password",
                                        textInputType:
                                            TextInputType.emailAddress),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFieldWidget(
                                        maxLengt: 40,
                                        showSuffixIcon: true,
                                        controller: authProvider
                                            .confirmPasswordController,
                                        textFieldHeight: 55,
                                        suffixIcon: Icon(
                                            authProvider.showicon == true
                                                ? Icons.visibility_off
                                                : Icons.visibility),
                                        maxlines: 1,
                                        obsecureText: authProvider.showicon,
                                        toppadding: 27,
                                        onsuffixIconTap: () {
                                          setState(() {
                                            if (authProvider.showicon == true) {
                                              authProvider.showicon = false;
                                            } else {
                                              authProvider.showicon = true;
                                            }
                                          });
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please Confirm Password";
                                          } else if (value !=
                                              authProvider
                                                  .passwordController.text) {
                                            return "Password Not Matched";
                                          }
                                        },
                                        hintText: "Confirm Password",
                                        textInputType:
                                            TextInputType.emailAddress),
                                  ],
                                ),
                              ),
                              SizedBox(
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
                                      " 1 of 4",
                                      style: fontW5S12(context)!.copyWith(
                                          fontSize: 16,
                                          color: AppColors.appcolor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              CommonButtonWidget(
                                  horizontalPadding: 8,
                                  backgroundcolor: AppColors.appcolor,
                                  text: "Next",
                                  textfont: 16,
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      // authProvider.createUser();
                                      toNext(
                                          context: context,
                                          widget: PersonalInformationScreen());
                                    }
                                  }),
                              SizedBox(
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
                                        toRemoveAll(
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
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
