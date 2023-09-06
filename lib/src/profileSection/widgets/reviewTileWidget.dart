import 'package:flutter/material.dart';
import 'package:saluswell_dietitan_app_updated/src/profileSection/widgets/ratingWidget.dart';

import '../../../common/helperFunctions/dateFromatter.dart';
import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/cacheNetworkImageWidget.dart';
import '../../reviewsSection/models/review_model.dart';

class ReviewsTileWidget extends StatelessWidget {
  final ReviewModel reviewModel;

  const ReviewsTileWidget({
    Key? key,
    required this.reviewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CacheNetworkImageWidget(
                  imgUrl: reviewModel.patientProfilePic.toString(),
                  height: 55,
                  width: 55,
                  radius: 11,
                )
              ],
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reviewModel.patientName.toString(),
                  style: fontW5S12(context)!.copyWith(
                      fontSize: 14,
                      color: AppColors.blackcolor,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 3,
                ),
                RatingBarWidget(
                  itemCount: reviewModel.reviewStars!.toInt(),
                  onRatingUpdate: (double) {},
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  width: 170,
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black, fontSize: 36),
                      children: <TextSpan>[
                        TextSpan(
                            text: reviewModel.reviewDescription.toString(),
                            style: fontW5S12(context)!.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightdarktextcolor)),
                      ],
                    ),
                    textScaleFactor: 0.7,
                  ),
                ),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              DateFormatter.dateFormatter(reviewModel.reviewDate!.toDate()),
              style: fontW5S12(context)!.copyWith(
                  fontSize: 11,
                  color: AppColors.lightdarktextcolor,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 3,
            ),
          ],
        )
      ],
    );
  }
}
