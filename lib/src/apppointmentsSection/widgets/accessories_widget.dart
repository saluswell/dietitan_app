import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';

import '../../../common/utils/appcolors.dart';

class TimeSlotWidget extends StatelessWidget {
  const TimeSlotWidget(
      {Key? key, required this.text, required this.onTap, required this.color})
      : super(key: key);

  final String text;
  final Function(String) onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(text);
      },
      child: Container(
        height: 35,
        width: 102,
        margin: const EdgeInsets.only(left: 6, bottom: 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: color),
        child: Center(
          child: Text(
            //text,

            DateTime.parse(text)
                .format(DateTimeFormats.american)
                .toString()
                .substring(17)
                .toUpperCase()
                .toString(),
            style: const TextStyle(
                // textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 10,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                color: AppColors.whitecolor),
          ),
        ),
      ),
    );
  }
}
