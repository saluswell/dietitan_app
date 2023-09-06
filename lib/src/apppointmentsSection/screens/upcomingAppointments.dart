import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../providers/appointmentProvider.dart';
import 'appointmenstTab/completed.dart';
import 'appointmenstTab/upcomingTab.dart';

class UpcomingAppointmenrsScreen extends StatefulWidget {
  const UpcomingAppointmenrsScreen({Key? key}) : super(key: key);

  @override
  State<UpcomingAppointmenrsScreen> createState() =>
      _UpcomingAppointmenrsScreenState();
}

class _UpcomingAppointmenrsScreenState
    extends State<UpcomingAppointmenrsScreen> {
  // @override
  // void initState() {
  //   context.read<AppointmentProvider>().getpendingAppointments();
  //   context.read<AppointmentProvider>().getprogressAppointments();
  //   context.read<AppointmentProvider>().getcompletedAppointments();
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 55,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Appointments",
                    style: fontW5S12(context)!.copyWith(
                        fontSize: 23,
                        color: AppColors.blackcolor,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Consumer<AppointmentProvider>(
                builder: (context, appointmentProvider, __) {
              return TabBar(
                  labelStyle: fontW4S12(context)!.copyWith(
                      color: AppColors.lightwhitecolor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                  indicatorPadding: EdgeInsets.only(),
                  indicatorWeight: 2,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: AppColors.appcolor,
                  unselectedLabelColor: AppColors.lightdarktextcolor,
                  padding: EdgeInsets.only(),
                  tabs: const [
                    Tab(
                      text: "In Progress",
                    ),
                    // Tab(
                    //   text:
                    //       "Pending",
                    // ),
                    Tab(
                      text: "Completed",
                    )
                  ]);
            }),
            Expanded(
              child: TabBarView(children: [
                //  ProgressAppointmentTab(),
                UpcomingAppointmentsTab(),
                //  PendingForApprovalAppointmentsTab(),
                CompletedAppointmentsTab(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
