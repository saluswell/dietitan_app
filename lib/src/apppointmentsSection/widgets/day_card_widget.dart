import 'package:flutter/material.dart';

import '../../../common/utils/appcolors.dart';

class DayCardWidget extends StatelessWidget {
  final Color backGroundColor;
  final String text;
  final Color textColor;

  const DayCardWidget({
    Key? key,
    required this.backGroundColor,
    required this.text,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backGroundColor,
        border: Border.all(
          color: AppColors.darkAppColor.withOpacity(0.4),
          width: 1.0,
        ),
      ),
      child: Center(
        child: Text(text,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontSize: 10, color: textColor, fontWeight: FontWeight.w700)),
      ),
    );
  }
}
