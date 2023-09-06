import 'package:flutter/material.dart';

import '../../../common/helperFunctions/navigatorHelper.dart';
import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../res.dart';
import '../../authenticationsection/screens/loginScreen.dart';

class OnBoardingScreenThree extends StatefulWidget {
  static String routeName = "OnBoardingScreenThree";

  const OnBoardingScreenThree({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreenThree> createState() => _OnBoardingScreenThreeState();
}

class _OnBoardingScreenThreeState extends State<OnBoardingScreenThree> {
  List images = [
    Res.onboardingimageone,
    Res.onboardingimagetwo,
    Res.onboardingimagethree
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              // Res.threepng,
              "assets/Images/DietitianOnline.jpg",
              height: 400,
              fit: BoxFit.cover,
              //  width: MediaQuery.of(context).size.width,
              // width: 400,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 290,
                      // width: 330,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28)),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17)),
                        elevation: 3,
                        color: AppColors.whitecolor,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 7),
                                child: Container(
                                  height: 4,
                                  width: 304,
                                  decoration: const BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(17))),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 36),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            'Empower peoples to live healthier productive lives',
                                        style: fontW5S12(context)!.copyWith(
                                            fontSize: 45,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.blackcolor)),
                                  ],
                                ),
                                textScaleFactor: 0.6,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 36),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            'Click on Get Started button to create account and join team of experts dietitians, care providers and fitness experts.',
                                        style: fontW5S12(context)!.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                AppColors.lightdarktextcolor)),
                                  ],
                                ),
                                textScaleFactor: 0.7,
                              ),
                            ),
                            Spacer(),
                            CommonButtonWidget(
                                horizontalPadding: 20,
                                backgroundcolor: AppColors.appcolor,
                                text: "Get Started",
                                textfont: 16,
                                onTap: () {
                                  toNext(
                                      context: context, widget: LoginScreen());
                                }),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
