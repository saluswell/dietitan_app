import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../common/helperFunctions/navigatorHelper.dart';
import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/textfield_widget.dart';
import '../../../res.dart';
import '../providers/authProvider.dart';
import 'loginScreen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static String routeName = "ForgotPasswordScreen";

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      Res.fogotpassworddoctorpng,
                      height: 490,
                      width: 400,
                    ),
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 360,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 380,
                                // width: 340,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28)),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(17)),
                                  elevation: 3,
                                  color: AppColors.whitecolor,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Forgot",
                                            style: fontW5S12(context)!.copyWith(
                                                fontSize: 31,
                                                color: AppColors.blackcolor,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Password?",
                                            style: fontW5S12(context)!.copyWith(
                                                fontSize: 31,
                                                color: AppColors.blackcolor,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        RichText(
                                          textAlign: TextAlign.start,
                                          text: TextSpan(
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 36),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text:
                                                      'Enter your registered email address below.                     ',
                                                  style: fontW5S12(context)!
                                                      .copyWith(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .lightdarktextcolor)),
                                            ],
                                          ),
                                          textScaleFactor: 0.7,
                                        ),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        Form(
                                          key: _formKey,
                                          child: TextFieldWidget(
                                              showSuffixIcon: false,
                                              controller: authProvider
                                                  .forgotemailController,
                                              textFieldHeight: 55,
                                              maxlines: 1,
                                              toppadding: 18,
                                              validator: (String? value) {
                                                if (value?.trim().isEmpty ??
                                                    true) {
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
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Spacer(),
                                        CommonButtonWidget(
                                            horizontalPadding: 8,
                                            backgroundcolor: AppColors.appcolor,
                                            text: "Get Reset Link",
                                            textfont: 16,
                                            onTap: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                authProvider
                                                    .getResetPasswordLink();
                                              }
                                            }),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "I remembered!",
                                            style: fontW5S12(context)!.copyWith(
                                                fontSize: 16,
                                                color: AppColors.blackcolor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: InkWell(
                                            onTap: () {
                                              toNext(
                                                  context: context,
                                                  widget: LoginScreen());
                                            },
                                            child: Text(
                                              "Login",
                                              style: fontW5S12(context)!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      color: AppColors.appcolor,
                                                      fontWeight:
                                                          FontWeight.w400),
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
