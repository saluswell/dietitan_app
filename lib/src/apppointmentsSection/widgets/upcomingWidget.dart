import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';

import '../../../common/helperFunctions/navigatorHelper.dart';
import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/cacheNetworkImageWidget.dart';
import '../models/appointmetntNewModel.dart';
import '../screens/appointmentDetails/appointmentDetailsScreen.dart';

class UpcomingWidget extends StatefulWidget {
  final AppointmentModelNew appointmentModel;

  const UpcomingWidget({Key? key, required this.appointmentModel})
      : super(key: key);

  @override
  State<UpcomingWidget> createState() => _UpcomingWidgetState();
}

class _UpcomingWidgetState extends State<UpcomingWidget> {
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
                imgUrl: widget.appointmentModel.patientProfilePic.toString(),
                radius: 7),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.appointmentModel.patientName.toString(),
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
                      widget.appointmentModel.combineDateTime!
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

                // Text(
                //   "${widget.appointmentModel.from!.toDate().format(DateTimeFormats.american).toString().replaceAll("January 1, 2022", "")}  - ${widget.appointmentModel.to!.toDate().format(DateTimeFormats.american).toString().replaceAll("January 1, 2022", "")}",
                //   style: fontW5S12(context)!.copyWith(
                //       fontSize: 13,
                //       color: AppColors.appcolor,
                //       fontWeight: FontWeight.w500),
                // ),
              ],
            )
          ],
        ),
        InkWell(
          onTap: () {
            toNext(
                context: context,
                widget: AppointmentDetailsScreen(
                  appointmentModelNew: widget.appointmentModel,
                ));
          },
          child: Container(
            height: 35,
            width: 85,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: AppColors.appcolor),
            child: Center(
              child: Text(
                "View Details",
                style: fontW5S12(context)!.copyWith(
                    fontSize: 11,
                    color: AppColors.whitecolor,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        )
        // Text(
        //   widget.appointmentModel.appointmentStatus.toString().toUpperCase(),
        //   style: fontW5S12(context)!.copyWith(
        //       fontSize: 13,
        //       color: AppColors.appcolor,
        //       fontWeight: FontWeight.w500),
        // ),
        // SvgPicture.asset(
        //   Res.threedots,
        //   color: AppColors.lightdarktextcolor,
        // )
      ],
    );
  }
}
