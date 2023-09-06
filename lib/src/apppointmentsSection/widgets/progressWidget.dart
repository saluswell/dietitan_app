import 'package:date_time_format/date_time_format.dart';


import 'package:flutter/material.dart';

import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/cacheNetworkImageWidget.dart';
import '../models/appointmetntNewModel.dart';



class ProgressWidget extends StatelessWidget {
  final AppointmentModelNew appointmentModel;

  const ProgressWidget({Key? key, required this.appointmentModel})
      : super(key: key);

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
                imgUrl: appointmentModel.dietitianProfilePic.toString(),
                radius: 7),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dr ${appointmentModel.dietitianName}",
                  style: fontW5S12(context)!.copyWith(
                      fontSize: 14,
                      color: AppColors.blackcolor,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
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
                  "${appointmentModel.from!.toDate().format(
                      DateTimeFormats.american).toString().replaceAll(
                      "January 1, 2022", "")}  - ${appointmentModel.to!.toDate()
                      .format(DateTimeFormats.american).toString()
                      .replaceAll("January 1, 2022", "")}",
                  style: fontW5S12(context)!.copyWith(
                      fontSize: 13,
                      color: AppColors.appcolor,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
        Text(
          appointmentModel.appointmentStatus.toString().toUpperCase(),
          style: fontW5S12(context)!.copyWith(
              fontSize: 13,
              color: AppColors.appcolor,
              fontWeight: FontWeight.w500),
        ),
        // SvgPicture.asset(
        //   Res.threedots,
        //   color: AppColors.lightdarktextcolor,
        // )
      ],
    );
  }
}
