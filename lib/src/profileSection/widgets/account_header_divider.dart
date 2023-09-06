import 'package:flutter/material.dart';

import '../../../common/utils/appcolors.dart';

class AccountHeadingDividerWidget extends StatelessWidget {
  final String text;

  AccountHeadingDividerWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      color: AppColors.lightdarktextcolor.withOpacity(0.3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(text,
                    style: TextStyle(
                        // fontFamily: 'Gilroy',
                        color: AppColors.blackcolor,
                        // decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Axiforma',
                        fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
