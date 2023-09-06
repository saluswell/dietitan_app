import 'package:flutter/material.dart';

import '../widgets/revenue_chart.dart';

class RevenueStatScreen extends StatelessWidget {
  const RevenueStatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Revenue Stats',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        body: Center(
          child: RevenueChartWidget(),
        )

        //     Column(
        //   children: [
        //     SizedBox(
        //       height: 40,
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 12),
        //       child: Container(
        //           child: Card(
        //               elevation: 4,
        //               shape: RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.circular(13),
        //               ),
        //               child: Padding(
        //                 padding: const EdgeInsets.only(top: 10),
        //                 child: RevenueChartWidget(),
        //               ))),
        //     ),
        //   ],
        // ),
        );
  }
}
