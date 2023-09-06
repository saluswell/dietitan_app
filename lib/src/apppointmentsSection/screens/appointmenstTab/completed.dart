import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../../common/utils/appcolors.dart';
import '../../../../common/utils/firebaseUtils.dart';

import '../../models/appointmetntNewModel.dart';
import '../../services/appointmentServices.dart';
import '../../widgets/completedApointmnetTile.dart';

class CompletedAppointmentsTab extends StatefulWidget {
  const CompletedAppointmentsTab({Key? key}) : super(key: key);

  @override
  State<CompletedAppointmentsTab> createState() =>
      _CompletedAppointmentsTabState();
}

class _CompletedAppointmentsTabState extends State<CompletedAppointmentsTab> {
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
                    .streamAllAppointments(FirebaseUtils.completed),
                initialData: [AppointmentModelNew()],
                builder: (context, child) {
                  List<AppointmentModelNew> appointmentList =
                      context.watch<List<AppointmentModelNew>>();
                  return appointmentList.isEmpty
                      ? const Center(
                          child: Padding(
                          padding: EdgeInsets.only(top: 220),
                          child: Text("No Completed Appointments found!",
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
                                  padding: EdgeInsets.only(top: 20),
                                  itemBuilder: ((context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 12),
                                      child: CompletedAppointmentsTileWidget(
                                        appointmentModel:
                                            appointmentList[index],
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
