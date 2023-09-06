import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../../common/utils/appcolors.dart';
import '../../../../common/utils/firebaseUtils.dart';
import '../../models/appointmetntNewModel.dart';
import '../../services/appointmentServices.dart';
import '../../widgets/upcomingWidget.dart';

class UpcomingAppointmentsTab extends StatefulWidget {
  const UpcomingAppointmentsTab({Key? key}) : super(key: key);

  @override
  State<UpcomingAppointmentsTab> createState() =>
      _UpcomingAppointmentsTabState();
}

class _UpcomingAppointmentsTabState extends State<UpcomingAppointmentsTab> {
  AppointmentServices appointmentServices = AppointmentServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            StreamProvider.value(
                value: appointmentServices
                    .streamAllAppointments(FirebaseUtils.progress),
                initialData: [AppointmentModelNew()],
                builder: (context, child) {
                  List<AppointmentModelNew> appointmentList =
                      context.watch<List<AppointmentModelNew>>();
                  return appointmentList.isEmpty
                      ? const Center(
                          child: Padding(
                          padding: EdgeInsets.only(top: 220),
                          child:
                              Text("No Upcoming Appointments found! Book Now",
                                  style: TextStyle(
                                      // fontFamily: 'Gilroy',
                                      color: AppColors.blackcolor,
                                      // decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Axiforma',
                                      fontSize: 13)),
                        ))
                      : appointmentList[0].appointmentId == null
                          ? const SpinKitPouringHourGlass(
                              size: 30,
                              color: AppColors.appcolor,
                            )
                          : Expanded(
                              flex: 4,
                              child: ListView.builder(
                                  itemCount: appointmentList.length,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(top: 20),
                                  itemBuilder: ((context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 12),
                                      child: InkWell(
                                        onTap: () {},
                                        child: UpcomingWidget(
                                          appointmentModel:
                                              appointmentList[index],
                                        ),
                                      ),
                                    );
                                  })),
                            );
                })
          ],
        ),
      ),
    );
  }
}
