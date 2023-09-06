// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:date_time_format/date_time_format.dart';
// import 'package:dietationapp/common/helperFunctions/getUserIDhelper.dart';
//
// import 'package:dietationapp/src/apppointmentsSection/providers/appointmentProvider.dart';
// import 'package:dietationapp/src/apppointmentsSection/screens/test4.dart';
// import 'package:dietationapp/src/apppointmentsSection/services/appointmentServices.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:loading_overlay/loading_overlay.dart';
// import 'package:provider/provider.dart';
//
// import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
//
// import '../../../common/helperFunctions/navigatorHelper.dart';
// import '../../../common/utils/appcolors.dart';
// import '../../../common/utils/themes.dart';
// import '../../../common/widgets/button_widget.dart';
// import '../models/timeSlotModel.dart';
// import '../widgets/accessories_widget.dart';
// import '../widgets/dateTimeTileWidget.dart';
//
// class EditAppointmentSlot extends StatefulWidget {
//   final TimeSlotModel timeSlotModel;
//
//   const EditAppointmentSlot({Key? key, required this.timeSlotModel})
//       : super(key: key);
//
//   @override
//   State<EditAppointmentSlot> createState() => _EditAppointmentSlotState();
// }
//
// class _EditAppointmentSlotState extends State<EditAppointmentSlot> {
//   DateRangePickerController _datePickerController = DateRangePickerController();
//
//   @override
//   initState() {
//     _datePickerController.displayDate = DateTime.now();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AppointmentProvider>(
//         builder: (context, appointmentProvider, __) {
//       return LoadingOverlay(
//         isLoading: appointmentProvider.isLoading,
//         progressIndicator: SpinKitPouringHourGlass(
//           size: 30,
//           color: AppColors.appcolor,
//         ),
//         child: Scaffold(
//           body: Column(
//             children: [
//               const SizedBox(
//                 height: 40,
//               ),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                         onPressed: () {
//                           Navigator.maybePop(context);
//                         },
//                         icon: const Icon(
//                           Icons.arrow_back,
//                           color: AppColors.appcolor,
//                         )),
//                     Text(
//                       appointmentProvider.datePickerControllerfortimeslot
//                                   .selectedDate ==
//                               null
//                           ? "Please Select Date"
//                           : appointmentProvider
//                               .datePickerControllerfortimeslot.selectedDate!
//                               .format(DateTimeFormats.american)
//                               .toString()
//                               .replaceAll("12:00 am", ""),
//                       style: fontW5S12(context)!.copyWith(
//                           fontSize: 19,
//                           color: AppColors.blackcolor.withOpacity(0.8),
//                           fontWeight: FontWeight.w600),
//                     ),
//                     Text("             "),
//                   ],
//                 ),
//               ),
//
//               const SizedBox(
//                 height: 15,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Edit Slot",
//                       style: fontW5S12(context)!.copyWith(
//                           fontSize: 23,
//                           color: AppColors.blackcolor,
//                           fontWeight: FontWeight.w700),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.maybePop(context);
//                         appointmentProvider.startingSelectedTime = null;
//                         appointmentProvider.endingSelectedTime = null;
//                       },
//                       child: Container(
//                         height: 40,
//                         width: 95,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(11),
//                             color: AppColors.redcolor.withOpacity(0.1)),
//                         child: Center(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Icon(
//                                 Icons.close,
//                                 size: 20,
//                                 color: AppColors.redcolor,
//                               ),
//                               const SizedBox(
//                                 width: 8,
//                               ),
//                               Text(
//                                 "Cancel",
//                                 style: fontW5S12(context)!.copyWith(
//                                     fontSize: 14,
//                                     color: AppColors.redcolor,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 25,
//               ),
//
//               // Padding(
//               //   padding: const EdgeInsets.symmetric(horizontal: 15),
//               //   child: Align(
//               //     alignment: Alignment.centerLeft,
//               //     child: Text(
//               //       "Available Days",
//               //       style: fontW5S12(context)!.copyWith(
//               //           fontSize: 15,
//               //           color: AppColors.blackcolor,
//               //           fontWeight: FontWeight.w600),
//               //     ),
//               //   ),
//               // ),
//               //
//               // const SizedBox(
//               //   height: 15,
//               // ),
//               //
//               // Padding(
//               //   padding: const EdgeInsets.symmetric(horizontal: 10),
//               //   child: Consumer<AppointmentProvider>(
//               //       builder: (context, appointmentProvider, __) {
//               //     return Wrap(
//               //       direction: Axis.horizontal,
//               //       //  runAlignment: WrapAlignment.end,
//               //       children: [
//               //         "Monday",
//               //         "Tuesday",
//               //         "Wednesday",
//               //         "Thursday",
//               //         "Friday",
//               //         "Saturday",
//               //         "Sunday"
//               //       ]
//               //           .map((e) => AccessoriesWidget(
//               //                 onTap: (value) {
//               //                   appointmentProvider.addOrRemoveAccessory(
//               //                       context, value);
//               //                 },
//               //                 text: e,
//               //                 color: appointmentProvider.acessoriesList
//               //                         .contains(e)
//               //                     ? AppColors.appcolor
//               //                     : AppColors.lightdarktextcolor.withOpacity(0.7),
//               //               ))
//               //           .toList(),
//               //     );
//               //   }),
//               // ),
//               // const SizedBox(
//               //   height: 25,
//               // ),
//
//               // Padding(
//               //   padding: const EdgeInsets.symmetric(horizontal: 15),
//               //   child: Align(
//               //     alignment: Alignment.centerLeft,
//               //     child: Row(
//               //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //       children: [
//               //         Text(
//               //           "Available Time",
//               //           style: fontW5S12(context)!.copyWith(
//               //               fontSize: 15,
//               //               color: AppColors.blackcolor,
//               //               fontWeight: FontWeight.w600),
//               //         ),
//               //         IconButton(onPressed: () {}, icon: Icon(Icons.add))
//               //       ],
//               //     ),
//               //   ),
//               // ),
//               //
//               // const SizedBox(
//               //   height: 15,
//               // ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 18),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     "From",
//                     style: fontW5S12(context)!.copyWith(
//                         fontSize: 12,
//                         color: AppColors.blackcolor,
//                         fontWeight: FontWeight.w500),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 3,
//               ),
//               DateTimeTileWidget(
//                 selectedTime: appointmentProvider.startingSelectedTime == null
//                     ? widget.timeSlotModel.startTime!
//                         .toDate()
//                         .format(DateTimeFormats.american)
//                         .toString()
//                         .replaceAll("January 1, 2022", "")
//                     : appointmentProvider.startingSelectedTime!.format(context),
//                 selectTime: () {
//                   _selectStartingTime(context, appointmentProvider);
//                 },
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 18),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     "To",
//                     style: fontW5S12(context)!.copyWith(
//                         fontSize: 12,
//                         color: AppColors.blackcolor,
//                         fontWeight: FontWeight.w500),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 3,
//               ),
//               DateTimeTileWidget(
//                 selectedTime: appointmentProvider.endingSelectedTime == null
//                     ? widget.timeSlotModel.endTime!
//                         .toDate()
//                         .format(DateTimeFormats.american)
//                         .toString()
//                         .replaceAll("January 1, 2022", "")
//                     : appointmentProvider.endingSelectedTime!.format(context),
//                 selectTime: () {
//                   _selectEndingTime(context, appointmentProvider);
//                 },
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Spacer(),
//               CommonButtonWidget(
//                   horizontalPadding: 8,
//                   backgroundcolor: AppColors.appcolor,
//                   text: "Update",
//                   textfont: 16,
//                   onTap: () {
//                     appointmentProvider.updateSlot(
//                         widget.timeSlotModel.startTime!.toDate(),
//                         widget.timeSlotModel.endTime!.toDate(),
//                         widget.timeSlotModel.dateofslot.toString(),
//                         widget.timeSlotModel.timeslotId.toString());
//
//                     //   toNext(context: context, widget: TestWorkWeekCalendar());
//                   }),
//               const SizedBox(
//                 height: 15,
//               ),
//
//               // Padding(
//               //   padding: const EdgeInsets.symmetric(horizontal: 12),
//               //   child: Card(
//               //     elevation: 4,
//               //     shape: RoundedRectangleBorder(
//               //         borderRadius: BorderRadius.circular(13)),
//               //     color: AppColors.whitecolor,
//               //     child: Padding(
//               //       padding: const EdgeInsets.all(8.0),
//               //       child: SfDateRangePicker(
//               //         headerStyle: DateRangePickerHeaderStyle(
//               //             backgroundColor: AppColors.appcolor.withOpacity(0.9),
//               //             textAlign: TextAlign.center,
//               //             textStyle: fontW4S12(context)!
//               //                 .copyWith(fontSize: 17, color: AppColors.whitecolor)),
//               //         headerHeight: 50,
//               //
//               //         controller: _datePickerController,
//               //         enablePastDates: false,
//               //         enableMultiView: false,
//               //
//               //         showNavigationArrow: true,
//               //         minDate: DateTime.now(),
//               //         viewSpacing: 20,
//               //
//               //         // monthViewSettings:
//               //         //     DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
//               //         onSelectionChanged: _onSelectionChanged,
//               //         navigationDirection:
//               //             DateRangePickerNavigationDirection.horizontal,
//               //         selectionMode: DateRangePickerSelectionMode.range,
//               //         startRangeSelectionColor: AppColors.appcolor,
//               //         endRangeSelectionColor: AppColors.appcolor,
//               //         todayHighlightColor: AppColors.appcolor,
//               //
//               //         //showActionButtons: true,
//               //         //allowViewNavigation: false,
//               //         view: DateRangePickerView.month,
//               //         selectionRadius: 17,
//               //         rangeSelectionColor: AppColors.appcolor.withOpacity(0.3),
//               //         selectionShape: DateRangePickerSelectionShape.rectangle,
//               //         selectionColor: AppColors.appcolor,
//               //         monthViewSettings: const DateRangePickerMonthViewSettings(
//               //
//               //           // showWeekNumber: true,
//               //           enableSwipeSelection: false,
//               //           weekNumberStyle: DateRangePickerWeekNumberStyle(
//               //               textStyle: TextStyle(color: AppColors.redcolor)),
//               //           firstDayOfWeek: 1,
//               //           showTrailingAndLeadingDates: true,
//               //           dayFormat: 'EE',
//               //           viewHeaderStyle: DateRangePickerViewHeaderStyle(
//               //
//               //               //    backgroundColor: Color(0xFF7fcd91),
//               //               textStyle: TextStyle(
//               //                   color: AppColors.blackcolor,
//               //                   fontWeight: FontWeight.w500,
//               //                   fontSize: 14,
//               //                   letterSpacing: 5)),
//               //
//               //           //  numberOfWeeksInView: 1
//               //         ),
//               //         toggleDaySelection: true,
//               //
//               //
//               //         //showTodayButton: true,
//               //         //   showActionButtons: ,
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               const SizedBox(
//                 height: 20,
//               ),
//             ],
//           ),
//         ),
//       );
//     });
//   }
//
//   _AppointmentDataSource _getCalendarDataSource() {
//     List<Appointment> appointments = <Appointment>[];
//     appointments.add(Appointment(
//       startTime: DateTime.now(),
//       endTime: DateTime.now().add(const Duration(minutes: 10)),
//       subject: 'Meeting',
//       color: Colors.blue,
//       startTimeZone: '',
//       endTimeZone: '',
//     ));
//
//     return _AppointmentDataSource(appointments);
//   }
//
//   void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
// // TODO: implement your code here
//   }
// }
//
// class _AppointmentDataSource extends CalendarDataSource {
//   _AppointmentDataSource(List<Appointment> source) {
//     appointments = source;
//   }
// }
//
// _selectStartingTime(
//     BuildContext context, AppointmentProvider carProvider) async {
//   final TimeOfDay? timeOfDay = await showTimePicker(
//     context: context,
//     builder: (context, child) {
//       return Theme(
//           data: ThemeData(
//             dialogBackgroundColor: AppColors.whitecolor,
//             colorScheme: ColorScheme.dark(
//               primary: AppColors.whitecolor,
//               onPrimary: secondryColor(context),
//               onSurface: Colors.white,
//             ),
//             textButtonTheme: TextButtonThemeData(
//               style: TextButton.styleFrom(
//                 primary: Colors.white,
//               ),
//             ),
//           ),
//           child: child!);
//     },
//     initialTime: const TimeOfDay(hour: 12, minute: 00),
//     initialEntryMode: TimePickerEntryMode.dial,
//   );
//   if (timeOfDay != null && timeOfDay != carProvider.startingSelectedTime) {
//     carProvider.updateStartingTime(timeOfDay);
//   }
// }
//
// _selectEndingTime(BuildContext context, AppointmentProvider carProvider) async {
//   final TimeOfDay? timeOfDay = await showTimePicker(
//     context: context,
//     builder: (context, child) {
//       return Theme(
//           data: ThemeData(
//             dialogBackgroundColor: AppColors.whitecolor,
//             colorScheme: ColorScheme.dark(
//               primary: AppColors.whitecolor,
//               onPrimary: secondryColor(context),
//               onSurface: Colors.white,
//             ),
//             textButtonTheme: TextButtonThemeData(
//               style: TextButton.styleFrom(
//                 primary: Colors.white,
//               ),
//             ),
//           ),
//           child: child!);
//     },
//     initialTime: const TimeOfDay(hour: 12, minute: 00),
//     initialEntryMode: TimePickerEntryMode.dial,
//   );
//   if (timeOfDay != null && timeOfDay != carProvider.endingSelectedTime) {
//     carProvider.updateEndingTime(timeOfDay);
//   }
// }
