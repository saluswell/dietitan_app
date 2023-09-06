import 'package:flutter/material.dart';
import 'package:saluswell_dietitan_app_updated/src/payementSection/models/paymentModel.dart';

import '../../../common/helperFunctions/dateFromatter.dart';
import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/cacheNetworkImageWidget.dart';

class PaymentTileWidget extends StatelessWidget {
  final PaymentModel paymentModel;

  const PaymentTileWidget({
    Key? key,
    required this.paymentModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CacheNetworkImageWidget(
                            imgUrl: paymentModel.senderpic.toString(),
                            height: 45,
                            width: 45,
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
                            "Paid By",
                            style: fontW5S12(context)!.copyWith(
                                fontSize: 11,
                                color: AppColors.redcolor,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            paymentModel.senderName.toString().toUpperCase(),
                            style: fontW5S12(context)!.copyWith(
                                fontSize: 14,
                                color: AppColors.blackcolor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        DateFormatter.dateFormatter(
                            paymentModel.paymentDateTime!.toDate()),
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 11,
                            color: AppColors.lightdarktextcolor,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "\$" + paymentModel.totalAmount.toString(),
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 14,
                            color: AppColors.appcolor,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
