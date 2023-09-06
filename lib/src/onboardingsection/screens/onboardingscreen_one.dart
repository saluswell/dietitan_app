import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/helperFunctions/hive_local_storage.dart';
import '../../../common/helperFunctions/navigatorHelper.dart';
import '../../../common/utils/appcolors.dart';
import '../../../common/utils/textutils.dart';
import '../../../common/utils/themes.dart';
import '../../../res.dart';
import 'onboardingscreen_three.dart';
import 'onboardingscreen_two.dart';

class OnBoardingScreenOne extends StatefulWidget {
  static String routeName = "OnBoardingScreenOne";

  const OnBoardingScreenOne({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreenOne> createState() => _OnBoardingScreenOneState();
}

class _OnBoardingScreenOneState extends State<OnBoardingScreenOne> {
  List images = [
    Res.onboardingimageone,
    Res.onboardingimagetwo,
    Res.onboardingimagethree
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    writeOnbaordingValue();
  }

  writeOnbaordingValue() async {
    await HiveLocalStorage.write(
        boxName: TextUtils.currentRouteBox,
        key: TextUtils.currentRouteKey,
        value: OnBoardingScreenOne.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appcolor,
      body:

          // Container(
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          //   // decoration: BoxDecoration(
          //   //     image: DecorationImage(
          //   //         fit: BoxFit.fitHeight,
          //   //         image: AssetImage("assets/Images/DietitianNutritionist.png"))
          //   ),
          SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // SizedBox(
            //   height: 430,
            // ),
            Image.asset(
              // Res.onepng,
              "assets/Images/DietitianNutritionist.png",
              height: 410,
              //width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),

            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  //  height: 270,
                  //width: 330,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(28)),
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
                              width: 100,
                              decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(17))),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 36),
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        'Passionate About Helping people achieve Better Health?',
                                    style: fontW5S12(context)!.copyWith(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.blackcolor)),
                              ],
                            ),
                            textScaleFactor: 0.6,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 36),
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        'Join our team of Care Providers if you are registered dietitian, fitness expert, doctor, and nurse practitioner.  ',
                                    style: fontW5S12(context)!.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.lightdarktextcolor)),
                              ],
                            ),
                            textScaleFactor: 0.7,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("            "),
                              //  SvgPicture.asset(Res.arrowbaclcircle),
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
                                        widget: OnBoardingScreenTwo());
                                  },
                                  child: SvgPicture.asset(Res.nextcircleicon))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
