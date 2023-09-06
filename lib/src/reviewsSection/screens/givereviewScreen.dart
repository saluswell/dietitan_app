import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/textfield_widget.dart';
import '../../apppointmentsSection/models/appointmetntNewModel.dart';
import '../../profileSection/widgets/ratingWidget.dart';
import '../providers/review_provider.dart';

class GiveReviewScreen extends StatefulWidget {
  final AppointmentModelNew appointmentModelNew;

  const GiveReviewScreen({Key? key, required this.appointmentModelNew})
      : super(key: key);

  @override
  State<GiveReviewScreen> createState() => _GiveReviewScreenState();
}

class _GiveReviewScreenState extends State<GiveReviewScreen> {
  TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ReviewProvider>(builder: (context, reviewProvider, __) {
      return LoadingOverlay(
        isLoading: reviewProvider.isLoading,
        progressIndicator: const SpinKitPouringHourGlass(
          size: 30,
          color: AppColors.appcolor,
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonButtonWidget(
                  horizontalPadding: 8,
                  backgroundcolor: AppColors.appcolor,
                  text: "Submit",
                  textfont: 16,
                  onTap: () {
                    reviewProvider.createReview(
                        widget.appointmentModelNew.dietitianId.toString(),
                        widget.appointmentModelNew.patientId.toString(),
                        reviewController.text,
                        widget.appointmentModelNew.appointmentId.toString(),
                        widget.appointmentModelNew);

                    // toNext(
                    //     context: context,
                    //     widget: BottomNavScreen());
                  }),
              const SizedBox(
                height: 45,
              )
            ],
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.maybePop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.appcolor,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Give A Review",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 23,
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w700),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.maybePop(context);
                      },
                      child: Container(
                        height: 40,
                        width: 95,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: AppColors.redcolor.withOpacity(0.1)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.close,
                                size: 20,
                                color: AppColors.redcolor,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Cancel",
                                style: fontW5S12(context)!.copyWith(
                                    fontSize: 14,
                                    color: AppColors.redcolor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 14),
              //   child: Container(
              //     height: 70,
              //     child: Card(
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(7)),
              //       elevation: 4,
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 12),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Row(
              //               children: [
              //                 Container(
              //                   height: 46,
              //                   width: 46,
              //                   decoration: BoxDecoration(
              //                     color: AppColors.lightwhitecolor,
              //                     borderRadius: BorderRadius.circular(9),
              //                   ),
              //                   child: const Icon(
              //                     Icons.person,
              //                     color: AppColors.appcolor,
              //                   ),
              //                 ),
              //                 const SizedBox(
              //                   width: 10,
              //                 ),
              //                 Text(
              //                   "Muhammad Wajahat",
              //                   style: fontW5S12(context)!.copyWith(
              //                       fontSize: 13,
              //                       color: AppColors.blackcolor,
              //                       fontWeight: FontWeight.w500),
              //                 ),
              //               ],
              //             ),
              //             Row(
              //               children: [
              //                 RatingBarWidget(
              //                   itemCount: 5,
              //                   onRatingUpdate: (value) {
              //                     reviewProvider.itemCountVar = value;
              //                     dp(arg: "star update value", msg: value);
              //                   },
              //                 ),
              //                 Text(
              //                   "(21)",
              //                   style: fontW5S12(context)!.copyWith(
              //                       fontSize: 13,
              //                       color: AppColors.blackcolor,
              //                       fontWeight: FontWeight.w500),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Give Rating",
                    style: fontW5S12(context)!.copyWith(
                        fontSize: 15,
                        color: AppColors.blackcolor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RatingBarWidget(
                starSize: 35,
                itemCount: 5,
                onRatingUpdate: (double) {
                  reviewProvider.itemCountVar = double;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Write Description",
                    style: fontW5S12(context)!.copyWith(
                        fontSize: 15,
                        color: AppColors.blackcolor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextFieldWidget(
                    showSuffixIcon: false,
                    controller: reviewController,
                    textFieldHeight: 50,
                    maxlines: 13,
                    suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                    toppadding: 15,
                    hintText: "write your experience with patient",
                    textInputType: TextInputType.emailAddress),
              ),
            ],
          ),
        ),
      );
    });
  }
}
