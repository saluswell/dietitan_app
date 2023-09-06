import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:saluswell_dietitan_app_updated/common/helperFunctions/navigatorHelper.dart';
import 'package:saluswell_dietitan_app_updated/src/payementSection/models/paymentModel.dart';
import 'package:saluswell_dietitan_app_updated/src/payementSection/services/paymentServices.dart';
import 'package:saluswell_dietitan_app_updated/src/payementSection/widgets/payment_tile_widget.dart';
import 'package:saluswell_dietitan_app_updated/src/revenueSection/screens/revenue_stats_screen.dart';

import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../revenueSection/widgets/revenue_chart.dart';

class RevenueListPaymentsScreen extends StatefulWidget {
  const RevenueListPaymentsScreen({Key? key}) : super(key: key);

  @override
  State<RevenueListPaymentsScreen> createState() =>
      _RevenueListPaymentsScreenState();
}

class _RevenueListPaymentsScreenState extends State<RevenueListPaymentsScreen> {
  PaymentServices paymentServices = PaymentServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 55,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.maybePop(context);
                  },
                  child: Container(
                    height: 42,
                    width: 42,
                    child: Card(
                      elevation: 2,
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.appcolor,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Revenue History",
                  style: fontW5S12(context)!.copyWith(
                      fontSize: 16,
                      color: AppColors.blackcolor,
                      fontWeight: FontWeight.w700),
                ),
                InkWell(
                  onTap: () {
                    toNext(context: context, widget: RevenueStatScreen());
                  },
                  child: Image.asset(
                    "assets/Images/stats.png",
                    height: 28,
                    width: 28,
                    color: AppColors.appcolor,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
                height: 250,
                child: Card(
                    color: AppColors.appLightColor,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: RevenueChartWidget(),
                    ))),
          ),
          StreamProvider.value(
              value: paymentServices.streamsPaymentsList(),
              initialData: [PaymentModel()],
              builder: (context, child) {
                List<PaymentModel> paymentsList =
                    context.watch<List<PaymentModel>>();
                return paymentsList.isEmpty
                    ? const Center(
                        child: Padding(
                        padding: EdgeInsets.only(top: 220),
                        child: Text("No Revenue History Found!",
                            style: TextStyle(
                                // fontFamily: 'Gilroy',
                                color: AppColors.blackcolor,
                                // decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Axiforma',
                                fontSize: 13)),
                      ))
                    : paymentsList[0].paymentId == null
                        ? const SpinKitPouringHourGlass(
                            size: 30,
                            color: AppColors.appcolor,
                          )
                        : Expanded(
                            flex: 4,
                            child: ListView.builder(
                                itemCount: paymentsList.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.only(top: 20),
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 12, left: 12, right: 14),
                                    child: PaymentTileWidget(
                                      paymentModel: paymentsList[index],
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
