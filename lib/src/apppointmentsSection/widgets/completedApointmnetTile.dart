import 'package:date_time_format/date_time_format.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/helperFunctions/navigatorHelper.dart';
import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/cacheNetworkImageWidget.dart';
import '../../../res.dart';
import '../../reviewsSection/screens/givereviewScreen.dart';
import '../models/appointmetntNewModel.dart';
import '../screens/appointmentDetails/appointmentDetailsScreen.dart';

class CompletedAppointmentsTileWidget extends StatelessWidget {
  final AppointmentModelNew appointmentModel;

  const CompletedAppointmentsTileWidget({
    Key? key,
    required this.appointmentModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CacheNetworkImageWidget(
                height: 52,
                width: 52,
                imgUrl: appointmentModel.patientProfilePic.toString(),
                radius: 7),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appointmentModel.patientName.toString(),
                  style: fontW5S12(context)!.copyWith(
                      fontSize: 14,
                      color: AppColors.blackcolor,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Text(
                      appointmentModel.combineDateTime!
                          .toDate()
                          .format(DateTimeFormats.american)
                          .toString()
                          .replaceAll("12:00 am", ""),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 12,
                          color: AppColors.appcolor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 7,
            ),
            InkWell(
              onTap: () {
                toNext(
                    context: context,
                    widget: AppointmentDetailsScreen(
                      appointmentModelNew: appointmentModel,
                    ));
              },
              child: Container(
                height: 45,
                width: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: AppColors.appcolor),
                child: Center(
                  child: Text(
                    "View Details",
                    style: fontW5S12(context)!.copyWith(
                        fontSize: 13,
                        color: AppColors.whitecolor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     toNext(context: context, widget: const GiveReviewScreen());
            //   },
            //   child: Image.asset(
            //     Res.feedback,
            //     height: 23,
            //     width: 23,
            //     color: AppColors.appcolor,
            //   ),
            // ),
          ],
        )
      ],
    );
  }
}
