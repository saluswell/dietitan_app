import 'package:flutter/material.dart';

import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';

class DateTimeTileWidget extends StatelessWidget {
  final String selectedTime;

  final VoidCallback selectTime;

  // ignore: prefer_const_constructors_in_immutables
  DateTimeTileWidget(
      {Key? key, required this.selectedTime, required this.selectTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: AppColors.whitecolor,
        ),
        child: Card(
          color: AppColors.whitecolor,
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(selectedTime,
                    style: fontW4S12(context)?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackcolor,
                        fontSize: 12)),
                const SizedBox(
                  width: 30,
                ),
                IconButton(
                    onPressed: selectTime,
                    icon: const Icon(
                      Icons.access_time_sharp,
                      color: AppColors.appcolor,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
