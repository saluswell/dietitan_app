import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/helperFunctions/getUserIDhelper.dart';
import '../../../../common/utils/appcolors.dart';
import '../../../../common/utils/themes.dart';
import '../../../apppointmentsSection/models/timeSlotModel.dart';
import '../../../apppointmentsSection/providers/appointmentProvider.dart';

class TimeSlotWidget extends StatelessWidget {
  final TimeSlotModel timeSlotModel;

  const TimeSlotWidget({Key? key, required this.timeSlotModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        height: 90,
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            "Start Time :",
                            style: fontW5S12(context)!.copyWith(
                                fontSize: 15,
                                color: AppColors.blackcolor.withOpacity(0.7),
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            timeSlotModel.startTime!
                                .toDate()
                                .format(DateTimeFormats.american)
                                .replaceAll("January 1, 2022", ""),
                            style: fontW5S12(context)!.copyWith(
                                fontSize: 15,
                                color: AppColors.blackcolor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "End Time :",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 15,
                              color: AppColors.blackcolor.withOpacity(0.7),
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          timeSlotModel.endTime!
                              .toDate()
                              .format(DateTimeFormats.american)
                              .replaceAll("January 1, 2022", ""),
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 15,
                              color: AppColors.blackcolor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
                Consumer<AppointmentProvider>(
                    builder: (context, appointmentProvider, __) {
                  return Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            // toNext(
                            //     context: context,
                            //     widget: EditAppointmentSlot(
                            //       timeSlotModel: timeSlotModel,
                            //     ));
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: AppColors.appcolor,
                          )),
                      IconButton(
                          onPressed: () {
                            appointmentProvider.deleteSlot(
                                getUserID(),
                                timeSlotModel.dateofslot.toString(),
                                timeSlotModel.timeslotId.toString());
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: AppColors.redcolor,
                          )),
                    ],
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
