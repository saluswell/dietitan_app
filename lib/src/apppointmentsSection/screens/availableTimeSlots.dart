import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:saluswell_dietitan_app_updated/common/helperFunctions/showsnackbar.dart';
import 'package:saluswell_dietitan_app_updated/src/apppointmentsSection/providers/available_time_slots.dart';

import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/button_widget.dart';
import '../../authenticationsection/services/userServices.dart';
import '../models/timeslot_model.dart';
import '../providers/appointmentProvider.dart';
import '../services/appointmentServices.dart';
import '../widgets/day_card_widget.dart';
import '../widgets/time_slot_grid.dart';

class AvailableTimeSlots extends StatefulWidget {
  final String userID;

  const AvailableTimeSlots({Key? key, required this.userID}) : super(key: key);

  @override
  State<AvailableTimeSlots> createState() => _AvailableTimeSlotsState();
}

class _AvailableTimeSlotsState extends State<AvailableTimeSlots> {
  AppointmentServices appointmentServices = AppointmentServices();
  UserServices userServices = UserServices();

  @override
  void initState() {
    context.read<TimeSlotProvider>().fetchDietitianAvailability(widget.userID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AppointmentProvider, TimeSlotProvider>(
        builder: (context, appointmentProvider, timeSlotProvider, __) {
      return LoadingOverlay(
        isLoading: timeSlotProvider.isLoading,
        progressIndicator: SpinKitPouringHourGlass(
          color: AppColors.appcolor,
          size: 32,
        ),
        child: WillPopScope(
          onWillPop: () async {
            timeSlotProvider.selectedDaysVar.clear();
            timeSlotProvider.selectedTimes.clear();
            return true;
          },
          child: Scaffold(
            bottomSheet: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonButtonWidget(
                    horizontalPadding: 8,
                    backgroundcolor: AppColors.appcolor,
                    text: "Update",
                    textfont: 16,
                    onTap: () {
                      timeSlotProvider.updateTimeSlot();
                      //  appointmentProvider.updateTimeSlot();
                      //   toNext(context: context, widget: TestWorkWeekCalendar());
                    }),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),

            body: timeSlotProvider.userModel == null
                ? CircularProgressIndicator(
                    color: AppColors.appcolor,
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                    onPressed: () {
                                      timeSlotProvider.selectedDaysVar.clear();
                                      timeSlotProvider.selectedTimes.clear();
                                      Navigator.maybePop(context);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back,
                                      color: AppColors.appcolor,
                                    )),
                              ),
                              Text(
                                "Update Availability",
                                style: fontW5S12(context)!.copyWith(
                                    fontSize: 15,
                                    color: AppColors.blackcolor,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                "Available Days",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: "Helvetica",
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color: AppColors.blackcolor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            //height: 80,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                border: Border.all(
                                    width: 1,
                                    color: AppColors.appcolor.withOpacity(0.3)),
                                color:
                                    AppColors.appLightColor.withOpacity(0.3)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Container(
                                    height: 135,
                                    child: GridView.builder(
                                      itemCount:
                                          timeSlotProvider.daysList1.length,
                                      padding: EdgeInsets.only(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 2.5,
                                      ),
                                      itemBuilder: (context, index) {
                                        String day =
                                            timeSlotProvider.daysList1[index];
                                        bool isSelected = timeSlotProvider
                                            .selectedDays
                                            .contains(day);

                                        return GestureDetector(
                                          onTap: () {
                                            timeSlotProvider.toggleDay(day);
                                          },
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 5, bottom: 5),
                                              child: DayCardWidget(
                                                backGroundColor: isSelected
                                                    ? AppColors.darkAppColor
                                                    : AppColors.whitecolor,
                                                text: timeSlotProvider
                                                    .daysList1[index]
                                                    .toString(),
                                                textColor: isSelected
                                                    ? Colors.white
                                                    : Colors.black,
                                              )),
                                        );
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TimeGridView(title: 'Morning', times: morningTimes),
                        TimeGridView(title: 'Afternoon', times: afternoonTimes),
                        TimeGridView(title: 'Evening', times: eveningTimes),
                        TimeGridView(title: 'Night', times: nightTimes),
                        // ElevatedButton(
                        //     onPressed: () {
                        //       dp(
                        //           msg: "selected times",
                        //           arg: timeSlotProvider.selectedTimes
                        //               .toList()
                        //               .toString());
                        //     },
                        //     child: Center(
                        //       child: Text("get selected time slots"),
                        //     )),
                        SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                  ), // body: StreamProvider.value(
          ),
        ),
      );
    });
  }
}
