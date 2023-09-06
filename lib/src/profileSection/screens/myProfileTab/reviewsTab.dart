import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../../common/utils/appcolors.dart';
import '../../../../common/utils/themes.dart';
import '../../../reviewsSection/models/review_model.dart';
import '../../../reviewsSection/services/review_services.dart';
import '../../widgets/reviewTileWidget.dart';

class ReviewListTabScreen extends StatefulWidget {
  const ReviewListTabScreen({Key? key}) : super(key: key);

  @override
  State<ReviewListTabScreen> createState() => _ReviewListTabScreenState();
}

class _ReviewListTabScreenState extends State<ReviewListTabScreen> {
  ReviewServices reviewServices = ReviewServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 45,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.maybePop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.appcolor,
                )),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "My Reviews",
                style: fontW5S12(context)!.copyWith(
                    fontSize: 27,
                    color: AppColors.blackcolor,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          StreamProvider.value(
              value: reviewServices.streamReviewsList(),
              initialData: [ReviewModel()],
              builder: (context, child) {
                List<ReviewModel> reviewList =
                    context.watch<List<ReviewModel>>();
                return reviewList.isEmpty
                    ? const Center(
                        child: Padding(
                        padding: EdgeInsets.only(top: 220),
                        child: Text("No reviews Found!",
                            style: TextStyle(
                                // fontFamily: 'Gilroy',
                                color: AppColors.blackcolor,
                                // decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Axiforma',
                                fontSize: 13)),
                      ))
                    : reviewList[0].reviewId == null
                        ? const SpinKitPouringHourGlass(
                            size: 30,
                            color: AppColors.appcolor,
                          )
                        : Expanded(
                            flex: 4,
                            child: ListView.builder(
                                itemCount: reviewList.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.only(top: 20),
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 12, left: 12, right: 14),
                                    child: ReviewsTileWidget(
                                      reviewModel: reviewList[index],
                                    ),
                                  );
                                })),
                          );
              })
        ],
      ),
    );
  }
}
