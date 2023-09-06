import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../common/utils/appcolors.dart';

class RatingBarWidget extends StatelessWidget {
  final int itemCount;
  final void Function(double) onRatingUpdate;
  const RatingBarWidget(
      {Key? key,
      this.starSize = 17,
      required this.onRatingUpdate,
      required this.itemCount})
      : super(key: key);
  final double starSize;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
        initialRating: double.parse(itemCount.toString()),
        allowHalfRating: true,
        unratedColor: Colors.grey,
        itemCount: 5,
        tapOnlyMode: false,
        itemSize: starSize,
        itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
        itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: AppColors.appcolor,
            ),
        onRatingUpdate: onRatingUpdate);
  }
}
