import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:saluswell_dietitan_app_updated/src/apppointmentsSection/providers/available_time_slots.dart';

import '../../../common/utils/appcolors.dart';

class TimeGridView extends StatelessWidget {
  final String title;
  final List<DateTime> times;

  TimeGridView({required this.title, required this.times});

  @override
  Widget build(BuildContext context) {
    final timeProvider = Provider.of<TimeSlotProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Helvetica",
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: AppColors.blackcolor),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(),
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 2.5,
            ),
            // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //   crossAxisCount: 4,
            // ),
            itemCount: times.length,
            itemBuilder: (context, index) {
              DateTime time = times[index];
              bool isSelected = timeProvider.selectedTimes.contains(time);

              return GestureDetector(
                onTap: () {
                  timeProvider.toggleTimeSelection(time);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.darkAppColor,
                        width: 1.0,
                      ),
                      color: isSelected
                          ? AppColors.darkAppColor
                          : AppColors.whitecolor,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Center(
                      child: Text('${DateFormat.jm().format(time)}',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontSize: 10,
                                  color: isSelected
                                      ? AppColors.whitecolor
                                      : AppColors.blackcolor,
                                  fontWeight: FontWeight.w700)),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
