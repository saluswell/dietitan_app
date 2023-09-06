import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/helperFunctions/navigatorHelper.dart';
import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../res.dart';
import 'onboardingscreen_three.dart';

class OnBoardingScreenTwo extends StatefulWidget {
  static String routeName = "OnBoardingScreenTwo";

  const OnBoardingScreenTwo({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreenTwo> createState() => _OnBoardingScreenTwoState();
}

class _OnBoardingScreenTwoState extends State<OnBoardingScreenTwo> {
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
              //  Res.twopng,
              "assets/Images/Manonline training.jpg",
              height: 410,
              width: double.infinity,
              // width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 270,
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
                                  width: 180,
                                  decoration: const BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(17))),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 36),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            'Do you want to join team of fitness experts?',
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
                                            'Let’s transform health care while building your own virtual practice on your schedule',
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
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    child:
                                        SvgPicture.asset(Res.arrowbaclcircle),
                                    onTap: () {
                                      Navigator.maybePop(context);
                                    },
                                  ),
                                  InkWell(
                                    onTap: () {
                                      toNext(
                                          context: context,
                                          widget: OnBoardingScreenThree());
                                    },
                                    child: Text(
                                      "Skip",
                                      style: fontW5S12(context)!.copyWith(
                                          fontSize: 16,
                                          color: AppColors.appcolor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        toNext(
                                            context: context,
                                            widget: OnBoardingScreenThree());
                                      },
                                      child:
                                          SvgPicture.asset(Res.nextcircleicon))
                                ],
                              ),
                            )
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
