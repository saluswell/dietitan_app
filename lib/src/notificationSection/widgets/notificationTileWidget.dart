import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/helperFunctions/dateFromatter.dart';
import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../res.dart';
import '../models/notificationModel.dart';

class NotificationTileWidget extends StatelessWidget {
  final NotificationModelFirebase notificationModelFirebase;

  const NotificationTileWidget(
      {Key? key, required this.notificationModelFirebase})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: AppColors.lightwhitecolor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: AppColors.whitecolor),
                        child: Center(
                          child: SvgPicture.asset(Res.starrating),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            notificationModelFirebase.notificationTitle
                                .toString(),
                            style: fontW5S12(context)!.copyWith(
                                fontSize: 15,
                                color: AppColors.blackcolor,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 3,
                          ),

                          Container(
                            height: 22,
                            width: 250,
                            child: RichText(
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                text: TextSpan(
                                  text: notificationModelFirebase
                                      .notificationDescription
                                      .toString(),
                                  style: fontW5S12(context)!.copyWith(
                                      fontSize: 11,
                                      color: AppColors.lightdarktextcolor,
                                      fontWeight: FontWeight.w500),
                                )),
                          ),
                          // Text(
                          //   notificationModelFirebase.notificationDescription
                          //       .toString(),
                          //   style: fontW5S12(context)!.copyWith(
                          //       fontSize: 13,
                          //       color: AppColors.appcolor,
                          //       fontWeight: FontWeight.w500),
                          // ),
                        ],
                      )
                    ],
                  ),

                  // Text(
                  //   "12 sec ago",
                  //   style: fontW5S12(context)!.copyWith(
                  //       fontSize: 13,
                  //       color: AppColors.lightdarktextcolor,
                  //       fontWeight: FontWeight.w500),
                  // ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    DateFormatter.dateFormatter(notificationModelFirebase
                        .notificationDateTime!
                        .toDate()),
                    style: fontW5S12(context)!.copyWith(
                        fontSize: 11,
                        color: AppColors.lightdarktextcolor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
