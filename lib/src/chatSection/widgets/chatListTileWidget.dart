import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../res.dart';

class ChatListTileWidget extends StatelessWidget {
  const ChatListTileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                color: AppColors.lightwhitecolor,
                borderRadius: BorderRadius.circular(13),
              ),
              child: const Icon(
                Icons.person,
                color: AppColors.appcolor,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ashlynn Workman",
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
                      "Hi, we are ready for the mee...",
                      style: fontW5S12(context)!.copyWith(
                          fontSize: 13,
                          color: AppColors.lightdarktextcolor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "12 min ago",
              style: fontW5S12(context)!.copyWith(
                  fontSize: 11,
                  color: AppColors.lightdarktextcolor,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              height: 17,
              width: 17,
              decoration: BoxDecoration(
                  color: AppColors.appcolor,
                  borderRadius: BorderRadius.circular(33)),
              child: Center(
                child: Text(

                  "2",
                  style: fontW5S12(context)!.copyWith(
                      fontSize: 9,
                      color: AppColors.whitecolor,
                      fontWeight: FontWeight.w400),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
