import 'package:date_time_format/date_time_format.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/cacheNetworkImageWidget.dart';
import '../../../res.dart';
import '../models/appointmetntNewModel.dart';


class PendingForApprovalAppointmentsTileWidget extends StatelessWidget {
  final AppointmentModelNew appointmentModel;

  PendingForApprovalAppointmentsTileWidget({
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
            // Container(
            //   height: 52,
            //   width: 52,
            //   decoration: BoxDecoration(
            //     color: AppColors.lightwhitecolor,
            //     borderRadius: BorderRadius.circular(13),
            //   ),
            //   child: const Icon(
            //     Icons.person,
            //     color: AppColors.appcolor,
            //   ),
            // ),
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
                  height: 3,
                ),
                Row(
                  children: [
                    Text(
                      appointmentModel.appointmentDateTime!
                          .toDate()
                          .format(DateTimeFormats.american)
                          .toString()
                          .replaceAll("12:00 am", ""),
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 13,
                          color: AppColors.lightdarktextcolor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "${appointmentModel.from!.toDate().format(DateTimeFormats.american).toString().replaceAll("January 1, 2022", "")}  - ${appointmentModel.to!.toDate().format(DateTimeFormats.american).toString().replaceAll("January 1, 2022", "")}",
                  style: fontW5S12(context)!.copyWith(
                      fontSize: 13,
                      color: AppColors.appcolor,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            Text(
              appointmentModel.appointmentStatus.toString().toUpperCase(),
              style: fontW5S12(context)!.copyWith(
                  fontSize: 13,
                  color: AppColors.redcolor,
                  fontWeight: FontWeight.w500),
            ),
            // SvgPicture.asset(
            //   Res.reddishcloseicon,
            //   height: 33,
            //   width: 33,
            //   //color: AppColors.lightdarktextcolor,
            // ),
            // SizedBox(
            //   width: 7,
            // ),
            // SvgPicture.asset(
            //   Res.tickgreenishicon,
            //   height: 33,
            //   width: 33,
            //   //  color: AppColors.lightdarktextcolor,
            // ),
            // SizedBox(
            //   width: 7,
            // ),
            // SvgPicture.asset(
            //   Res.threedots,
            //   color: AppColors.lightdarktextcolor,
            //  ),
          ],
        )
      ],
    );
  }
}
